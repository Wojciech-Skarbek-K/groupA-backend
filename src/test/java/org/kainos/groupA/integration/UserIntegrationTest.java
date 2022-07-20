package org.kainos.groupA.integration;

import io.dropwizard.configuration.ResourceConfigurationSourceProvider;
import io.dropwizard.testing.junit5.DropwizardAppExtension;
import io.dropwizard.testing.junit5.DropwizardExtensionsSupport;
import org.eclipse.jetty.http.HttpStatus;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.groupA.GroupAApplication;
import org.kainos.groupA.GroupAConfiguration;
import org.kainos.groupA.models.LoginUser;
import org.kainos.groupA.models.User;

import javax.ws.rs.client.Entity;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import java.nio.charset.Charset;
import java.util.Map;
import java.util.Random;

import static org.hibernate.validator.internal.util.Contracts.assertTrue;

@ExtendWith(DropwizardExtensionsSupport.class)
public class UserIntegrationTest {
    User testUser =  new User(
            "test@kainos.com",
            "0a3cb046627a5cf9d8b7d055b663780cd00e68ffd6b32dc2582b3cf77e7d5fcf",
            User.Role.Employee,
            "Joe",
            "Doe",
            "123456789",
            User.Location.Birmingham
    );
    static final DropwizardAppExtension<GroupAConfiguration> APP = new DropwizardAppExtension<GroupAConfiguration>(
            GroupAApplication.class, null,
            new ResourceConfigurationSourceProvider()
    );

    /**
     * Generates Kainos e-mail address to fulfill validator e-mail requirements. Example e-mail address would be
     * 'ABC123@kainos.com`. Returns the address as string.
     *
     * @return generated e-mail address.
     */
    private String generateEmail() {
        String CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 10) {
            int i = (int) (rnd.nextFloat() * CHARS.length());
            salt.append(CHARS.charAt(i));
        }
        return salt.toString() + "@kainos.com";
    }

    @Test
    void createUser_shouldReturnCreatedUserId() {
        testUser.setEmail(generateEmail());
        Response response = APP.client().target("http://localhost:8080/api/user/register")
                .request()
                .post(Entity.entity(testUser, MediaType.APPLICATION_JSON));
        Assertions.assertEquals(HttpStatus.OK_200, response.getStatus());
        Assertions.assertTrue(response.readEntity(Integer.class) > 0);
        //TODO: when we will have remove user endpoint, replace the email generator with deleting the user after the test
    }

    @Test
    void createUser_withoutWrongParam_shouldReturnStatusCode400() {
        testUser.setEmail("notkainosemail");
        Response response = APP.client().target("http://localhost:8080/api/user/register")
                .request()
                .post(Entity.entity(testUser, MediaType.APPLICATION_JSON));
        Assertions.assertEquals(HttpStatus.BAD_REQUEST_400, response.getStatus());
    }

    @Test
    void createUser_withoutAParam_shouldReturnStatusCode500() {
        testUser.setEmail(null);
        Response response = APP.client().target("http://localhost:8080/api/user/register")
                .request()
                .post(Entity.entity(testUser, MediaType.APPLICATION_JSON));
        Assertions.assertEquals(HttpStatus.INTERNAL_SERVER_ERROR_500, response.getStatus());
    }

    @Test
    void loginUser_shouldReturnJWTTokenAndRole() {
        //Create another user, separate for login testing, so we are 100% sure it exists.
        testUser.setEmail(generateEmail());
        Response response = APP.client().target("http://localhost:8080/api/user/register")
                .request()
                .post(Entity.entity(testUser, MediaType.APPLICATION_JSON));
        Assertions.assertEquals(HttpStatus.OK_200, response.getStatus());
        //Login with the users email and password.
        LoginUser testLoginUser = new LoginUser(testUser.getEmail(), testUser.getPassword());
        response = APP.client().target("http://localhost:8080/api/user/login")
                .request()
                .post(Entity.entity(testLoginUser, MediaType.APPLICATION_JSON));
        Assertions.assertEquals(HttpStatus.OK_200, response.getStatus());
        JSONObject json = new JSONObject(response.readEntity(new GenericType<Map<String, String>>(){}));
        Assertions.assertNotNull(json.get("token"));
        Assertions.assertNotNull(json.get("role"));
        //TODO: Check if received response is JWTToken ?
    }
}

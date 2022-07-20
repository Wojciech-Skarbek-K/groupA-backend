package org.kainos.groupA.integration;

import io.dropwizard.configuration.ResourceConfigurationSourceProvider;
import io.dropwizard.testing.junit5.DropwizardAppExtension;
import io.dropwizard.testing.junit5.DropwizardExtensionsSupport;
import org.eclipse.jetty.http.HttpStatus;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.groupA.GroupAApplication;
import org.kainos.groupA.GroupAConfiguration;
import org.kainos.groupA.models.User;

import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import java.nio.charset.Charset;
import java.util.Random;

import static org.hibernate.validator.internal.util.Contracts.assertTrue;

@ExtendWith(DropwizardExtensionsSupport.class)
public class UserIntegrationTest {
    User testUser =  new User(
            "test@kainos.com",
            "$2b$10$ktJIlwDzSgj/kCgu3WaX/Or00YlPkye77zUSsDJtGZy/atH4c9xcK",
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
        //TODO: when we will have remove user endpoint, replace the email generator with
        //deleting the user after creating it
        testUser.setEmail(generateEmail());
        Response response = APP.client().target("http://localhost:8080/api/user/register")
                .request()
                .post(Entity.entity(testUser, MediaType.APPLICATION_JSON));
        Assertions.assertEquals(HttpStatus.OK_200, response.getStatus());
        Assertions.assertTrue(response.readEntity(Integer.class) > 0);
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
}

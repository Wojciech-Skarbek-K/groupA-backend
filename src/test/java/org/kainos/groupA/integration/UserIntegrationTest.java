package org.kainos.groupA.integration;

import io.dropwizard.configuration.ResourceConfigurationSourceProvider;
import io.dropwizard.testing.junit5.DropwizardAppExtension;
import io.dropwizard.testing.junit5.DropwizardExtensionsSupport;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.groupA.GroupAApplication;
import org.kainos.groupA.GroupAConfiguration;
import org.kainos.groupA.models.User;

import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import static org.hibernate.validator.internal.util.Contracts.assertTrue;

@ExtendWith(DropwizardExtensionsSupport.class)
public class UserIntegrationTest {
    User testUser =  new User(
            "test@email.com",
            "encryptedpass",
            User.Role.Employee,
            "token",
            "Joe",
            "Doe",
            "123456789",
            User.Location.Birmingham
    );
    static final DropwizardAppExtension<GroupAConfiguration> APP = new DropwizardAppExtension<GroupAConfiguration>(
            GroupAApplication.class, null,
            new ResourceConfigurationSourceProvider()
    );

    @Test
    void createUser_shouldReturnCreatedUserId() {
        Response response = APP.client().target("https://localhost:8080/api/user/register")
                .request()
                .post(Entity.entity(testUser, MediaType.APPLICATION_JSON))
                .readEntity(Response.class);
        Assertions.assertTrue(response > 0);
    }
}

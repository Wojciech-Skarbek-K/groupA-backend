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
import org.kainos.groupA.models.AddJobRole;

import javax.print.attribute.standard.Media;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@ExtendWith(DropwizardExtensionsSupport.class)
public class AddJobRoleIntegrationTest {

    AddJobRole jobRole = new AddJobRole(
            "Software Engineer",
            "Writing code, testing code, fixing code.",
            "https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1",
            3,
            5
    );
    static final DropwizardAppExtension<GroupAConfiguration> APP = new DropwizardAppExtension<GroupAConfiguration>(
            GroupAApplication.class, null,
            new ResourceConfigurationSourceProvider()
    );
    @Test
    void addJobRole_shouldReturnCreatedRoleId() {
        Response response = APP.client().target("http://localhost:8080/api/job-roles")
                .request()
                .post(Entity.entity(jobRole, MediaType.APPLICATION_JSON));
        Assertions.assertEquals(HttpStatus.OK_200, response.getStatus());
        Assertions.assertTrue(response.readEntity(Integer.class) > 0);
    }

   @Test
    void createJobRole_withWrongParam_shouldReturnStatusCode400() {
        jobRole.setSharepoint_url("notSharepointURL");
        Response response = APP.client().target("http://localhost:8080/api/job-roles")
                .request()
                .post(Entity.entity(jobRole, MediaType.APPLICATION_JSON));
        Assertions.assertEquals(HttpStatus.BAD_REQUEST_400, response.getStatus());
   }

    @Test
    void createJobRole_withoutParam_shouldReturnStatusCode500() {
        jobRole.setRole_name(null);
        Response response = APP.client().target("http://localhost:8080/api/job-roles")
                .request()
                .post(Entity.entity(jobRole, MediaType.APPLICATION_JSON));
        Assertions.assertEquals(HttpStatus.INTERNAL_SERVER_ERROR_500, response.getStatus());
    }
}

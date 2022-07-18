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
import org.kainos.groupA.models.Responsibility;

import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;
import java.util.List;

@ExtendWith(DropwizardExtensionsSupport.class)
public class JobRespIntegrationTest {
    static final DropwizardAppExtension<GroupAConfiguration> APP = new DropwizardAppExtension<>(
            GroupAApplication.class, null,
            new ResourceConfigurationSourceProvider()
    );

    @Test
    void getJobResponsibilityByID_shouldReturnStatusCode200() {
        Response response = APP.client().target("http://localhost:8080/api/job-responsibility/2")
                .request()
                .get(Response.class);
        System.out.println(response.getEntity());
        Assertions.assertEquals(response.getStatus(), HttpStatus.OK_200);
        List<Responsibility> resp =response.readEntity(new GenericType<List<Responsibility>>(){});
        Assertions.assertTrue(resp.size() > 0);
        Assertions.assertNotNull(resp.get(0).getResp_desc());
        Assertions.assertNotNull(resp.get(0).getRole_name());
    }

    @Test
    void getJobResponsibilityByID_shouldReturnStatusCode404() {
        Response response = APP.client().target("http://localhost:8080/api/band-comp/string")
                .request()
                .get(Response.class);
        Assertions.assertEquals(response.getStatus(), HttpStatus.NOT_FOUND_404);
    }

}

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
import org.kainos.groupA.models.Competency;
import org.kainos.groupA.models.JobRole;

import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;
import java.util.List;

@ExtendWith(DropwizardExtensionsSupport.class)
public class BandCompIntegrationTest {
    static final DropwizardAppExtension<GroupAConfiguration> APP = new DropwizardAppExtension<>(
            GroupAApplication.class, null,
            new ResourceConfigurationSourceProvider()
    );

    @Test
    void getCompByBandID_shouldReturnStatusCode200() {
        Response response = APP.client().target("http://localhost:8080/api/band-comp/2")
                .request()
                .get(Response.class);
        Assertions.assertEquals(response.getStatus(), HttpStatus.OK_200);
        List<Competency> comp =response.readEntity(new GenericType<List<Competency>>(){});
        Assertions.assertTrue(comp.size() > 0);
        Assertions.assertNotNull(comp.get(0).getComp_name());
        Assertions.assertNotNull(comp.get(0).getComp_description());
    }

    @Test
    void getCompByBandID_shouldReturnStatusCode404() {
        Response response = APP.client().target("http://localhost:8080/api/band-comp/string")
                .request()
                .get(Response.class);
        Assertions.assertEquals(response.getStatus(), HttpStatus.NOT_FOUND_404);
    }

}

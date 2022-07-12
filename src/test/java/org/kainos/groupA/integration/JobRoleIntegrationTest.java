package org.kainos.groupA.integration;

import io.dropwizard.configuration.ResourceConfigurationSourceProvider;
import io.dropwizard.testing.junit5.DropwizardAppExtension;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import io.dropwizard.testing.junit5.DropwizardExtensionsSupport;
import org.kainos.groupA.GroupAApplication;
import org.kainos.groupA.GroupAConfiguration;
import org.kainos.groupA.models.JobRole;

import javax.ws.rs.core.GenericType;
import java.util.List;

@ExtendWith(DropwizardExtensionsSupport.class)
public class JobRoleIntegrationTest {
    static final DropwizardAppExtension<GroupAConfiguration> APP = new DropwizardAppExtension<>(
            GroupAApplication.class, null,
            new ResourceConfigurationSourceProvider()
    );

    @Test
    void getJobRoles_shouldReturnListOfJobRoles() {
       List<JobRole> response = APP.client().target("http://localhost:8080/api/job-roles")
               .request()
               .get(new GenericType<List<JobRole>>(){});
       Assertions.assertTrue(response.size() > 0);
       Assertions.assertTrue(response.get(0).getRole_name() != null);
    }
}

package org.kainos.groupA;

import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.federecio.dropwizard.swagger.SwaggerBundle;
import io.federecio.dropwizard.swagger.SwaggerBundleConfiguration;
import org.kainos.groupA.api.JobRoleService;
import org.kainos.groupA.api.UserService;
import org.kainos.groupA.dao.JobRoleDao;
import org.kainos.groupA.utils.DatabaseConnector;

public class GroupAApplication extends io.dropwizard.Application<GroupAConfiguration> {

    DatabaseConnector databaseConnector = new DatabaseConnector();

    public static void main(final String[] args) throws Exception {
        new GroupAApplication().run(args);
    }

    @Override
    public String getName() {
        return "true";
    }

    @Override
    public void initialize(final Bootstrap<GroupAConfiguration> bootstrap) {
        bootstrap.addBundle(new SwaggerBundle<GroupAConfiguration>() {
            @Override
            protected SwaggerBundleConfiguration getSwaggerBundleConfiguration(GroupAConfiguration configuration) {
                return configuration.getSwagger();
            }
        });
    }

    @Override
    public void run(final GroupAConfiguration configuration,
                    final Environment environment) {
        environment.jersey().register(new UserService());
        environment.jersey().register(new JobRoleService(databaseConnector, new JobRoleDao()));
    }
}

package org.kainos.groupA;

import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.federecio.dropwizard.swagger.SwaggerBundle;
import io.federecio.dropwizard.swagger.SwaggerBundleConfiguration;
import org.kainos.groupA.controller.JobRoleController;
import org.kainos.groupA.controller.UserController;
import org.kainos.groupA.controller.BandCompController;

/**
 * Main class of the application.
 */
public class GroupAApplication extends io.dropwizard.Application<GroupAConfiguration> {

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

    /**
     * Registers application controllers.
     */
    @Override
    public void run(final GroupAConfiguration configuration,
                    final Environment environment) {
        environment.jersey().register(new UserController());
        environment.jersey().register(new JobRoleController());
        environment.jersey().register(new BandCompController());
    }
}

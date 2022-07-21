package org.kainos.groupA;

import com.github.toastshaman.dropwizard.auth.jwt.JwtAuthFilter;
import io.dropwizard.auth.AuthDynamicFeature;
import io.dropwizard.auth.AuthValueFactoryProvider;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.federecio.dropwizard.swagger.SwaggerBundle;
import io.federecio.dropwizard.swagger.SwaggerBundleConfiguration;
import org.glassfish.jersey.server.filter.RolesAllowedDynamicFeature;
import org.jose4j.jwt.consumer.JwtConsumer;
import org.jose4j.jwt.consumer.JwtConsumerBuilder;
import org.jose4j.keys.HmacKey;
import org.kainos.groupA.controller.*;
import org.kainos.groupA.models.AuthUser;
import org.kainos.groupA.utils.JwtAuthenticator;

import java.io.UnsupportedEncodingException;
import java.security.Principal;

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
                    final Environment environment) throws UnsupportedEncodingException {
        final byte[] key = configuration.getJwtTokenSecret();

        final JwtConsumer consumer = new JwtConsumerBuilder()
                .setAllowedClockSkewInSeconds(30) // allow some leeway in validating time based claims to account for clock skew
                .setRequireExpirationTime() // the JWT must have an expiration time
                .setRequireSubject() // the JWT must have a subject claim
                .setVerificationKey(new HmacKey(key)) // verify the signature with the public key
                .setRelaxVerificationKeyValidation() // relaxes key length requirement
                .build(); // create the JwtConsumer instance

        environment.jersey().register(new AuthDynamicFeature(
                new JwtAuthFilter.Builder<AuthUser>()
                        .setJwtConsumer(consumer)
                        .setRealm("realm")
                        .setPrefix("Bearer")
                        .setAuthenticator(new JwtAuthenticator(configuration.getJwtTokenSecret()))
                        .buildAuthFilter()));

        //Controllers
        environment.jersey().register(new UserController(configuration.getJwtTokenSecret()));
        environment.jersey().register(new JobRoleController());
        environment.jersey().register(new BandCompController());
        environment.jersey().register(new JobResponsibilityController());
        //Authentication
        environment.jersey().register(new AuthValueFactoryProvider.Binder<>(Principal.class));
        environment.jersey().register(RolesAllowedDynamicFeature.class);
    }
}

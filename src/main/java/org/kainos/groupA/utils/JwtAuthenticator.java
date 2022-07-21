package org.kainos.groupA.utils;

import io.dropwizard.auth.AuthenticationException;
import io.dropwizard.auth.Authenticator;
import org.jose4j.jws.JsonWebSignature;
import org.jose4j.jwt.JwtClaims;
import org.jose4j.jwt.consumer.JwtContext;
import org.jose4j.keys.HmacKey;
import org.jose4j.lang.JoseException;
import org.kainos.groupA.models.AuthUser;
import org.kainos.groupA.models.LoginUser;
import org.kainos.groupA.models.User;

import java.util.Optional;

import static org.jose4j.jws.AlgorithmIdentifiers.HMAC_SHA256;

public class JwtAuthenticator implements Authenticator<JwtContext, AuthUser> {

    final byte[] jwtTokenSecret;

    public JwtAuthenticator(byte[] jwtTokenSecret) {
        this.jwtTokenSecret = jwtTokenSecret;
    }

    public JsonWebSignature buildToken(String userEmail, String userRole) throws JoseException {
        final JwtClaims claims = new JwtClaims();
        claims.setSubject(userEmail);
        claims.setStringClaim("role", userRole);
        claims.setIssuedAtToNow();
        claims.setGeneratedJwtId();

        final JsonWebSignature jws = new JsonWebSignature();
        jws.setPayload(claims.toJson());
        jws.setAlgorithmHeaderValue(HMAC_SHA256);
        jws.setKey(new HmacKey(jwtTokenSecret));
        return jws;
    }

    @Override
    public Optional<AuthUser> authenticate(JwtContext jwtContext) throws AuthenticationException {
        try {
            JwtClaims claims = jwtContext.getJwtClaims();

            String email = claims.getSubject();
            User.Role role = (User.Role) claims.getClaimValue("role");
            return Optional.of(new AuthUser(email, role));
        } catch (Exception e) {
            return Optional.empty();
        }
    }
}

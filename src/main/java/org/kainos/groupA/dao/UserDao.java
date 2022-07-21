package org.kainos.groupA.dao;

import io.dropwizard.auth.AuthenticationException;
import io.dropwizard.auth.Authenticator;
import org.jose4j.jws.JsonWebSignature;
import org.jose4j.jwt.JwtClaims;
import org.jose4j.jwt.consumer.JwtContext;
import org.jose4j.keys.HmacKey;
import org.jose4j.lang.JoseException;
import org.kainos.groupA.exception.InvalidUserException;
import org.kainos.groupA.models.LoginUser;
import org.kainos.groupA.models.User;

import javax.validation.constraints.Null;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import static java.util.Collections.singletonMap;
import static org.jose4j.jws.AlgorithmIdentifiers.HMAC_SHA256;

public class UserDao {

    private final byte[] tokenSecret;

    public UserDao(byte[] tokenSecret) {
        this.tokenSecret = tokenSecret;
    }
    /**
     * Checks if the email address already exists in database and validates the received user using validator. If no
     * issues occur, adds (registers) the user into the database using prepared statement. Returns id of created
     * user in the database. Throws SQLException on database errors and UserValidationException on not valid user.
     *
     * @param user
     * @param c
     * @return id of created user
     * @throws SQLException
     */
    public int createUser(User user, Connection c) throws SQLException {
        int userId = -1;
        try {
            String createUserQuery = "INSERT INTO User (email, password, role, first_name, last_name," +
                    "phone_number, location) VALUES (?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement preparedSt = c.prepareStatement(createUserQuery, Statement.RETURN_GENERATED_KEYS);
            preparedSt.setString(1, user.getEmail());
            preparedSt.setString(2, user.getPassword());
            preparedSt.setString(3, user.getRole().name());
            preparedSt.setString(4, user.getFirst_name());
            preparedSt.setString(5, user.getLast_name());
            preparedSt.setString(6, user.getPhone_number());
            preparedSt.setString(7, user.getLocation().name());
            int affectedRows = preparedSt.executeUpdate();

            try (ResultSet rs = preparedSt.getGeneratedKeys()) {
                if (rs.next()) {
                    userId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            c.close();
        }
        return userId;
    }

    public String loginUser(LoginUser loginUser, Connection c) throws SQLException, InvalidUserException, JoseException {
        try {
            String checkLoginQuery = "SELECT email, role FROM User WHERE email=? AND password=?";
            PreparedStatement preparedSt = c.prepareStatement(checkLoginQuery, Statement.RETURN_GENERATED_KEYS);
            preparedSt.setString(1, loginUser.getName());
            preparedSt.setString(2, loginUser.getPassword());
            ResultSet rs = preparedSt.executeQuery();
            if(rs.next()) {
                final JwtClaims claims = new JwtClaims();
                claims.setSubject(rs.getString(1));
                claims.setExpirationTimeMinutesInTheFuture(43200);

                final JsonWebSignature jws = new JsonWebSignature();
                jws.setPayload(claims.toJson());
                jws.setAlgorithmHeaderValue(HMAC_SHA256);
                jws.setKey(new HmacKey(tokenSecret));
                return jws.getCompactSerialization();
            } else {
                throw new InvalidUserException("Incorrect email or password.");
            }
        } catch (SQLException e) {
            throw e;
        } catch (JoseException e) {
            throw e;
        } finally {
            c.close();
        }
    }

}

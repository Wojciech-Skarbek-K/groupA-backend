package org.kainos.groupA.dao;

import org.kainos.groupA.models.User;

import javax.validation.constraints.Null;
import java.sql.*;

public class UserDao {
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
        int userId = 0;
        try {
            String createUserQuery = "INSERT INTO User (email, password, role, token, first_name, last_name," +
                    "phone_number, location) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement preparedSt = c.prepareStatement(createUserQuery, Statement.RETURN_GENERATED_KEYS);
            preparedSt.setString(1, user.getEmail());
            preparedSt.setString(2, user.getPassword());
            preparedSt.setString(3, user.getRole().name());
            preparedSt.setString(4, user.getToken());
            preparedSt.setString(5, user.getFirst_name());
            preparedSt.setString(6, user.getLast_name());
            preparedSt.setString(7, user.getPhone_number());
            preparedSt.setString(8, user.getLocation().name());
            int affectedRows = preparedSt.executeUpdate();
            System.out.println("AFFECTED ROWS: " + affectedRows);

            try (ResultSet rs = preparedSt.getGeneratedKeys()) {
                if (rs.next()) {
                    userId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            c.close();
            return userId;
        }
    }
}

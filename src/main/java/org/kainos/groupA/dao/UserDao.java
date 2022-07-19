package org.kainos.groupA.dao;

import org.kainos.groupA.models.LoginUser;
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

    public int loginUser(LoginUser loginUser, Connection c) throws SQLException {
        try {
            String checkLoginQuery = "SELECT email, password FROM User WHERE email=? AND password=?";
            PreparedStatement preparedSt = c.prepareStatement(checkLoginQuery, Statement.RETURN_GENERATED_KEYS);
            preparedSt.setString(1, loginUser.getEmail());
            preparedSt.setString(2, loginUser.getPassword());
            ResultSet a = preparedSt.executeQuery();
            if(a.next()) {
                System.out.println(a.getString(1));
                System.out.println(a.getString(2));
                return 1;
            } else {
                return 0;
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            c.close();
        }
    }
}

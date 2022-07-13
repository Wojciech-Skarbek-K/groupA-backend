package org.kainos.groupA.dao;

import org.kainos.groupA.models.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDao {
    /**
     * Checks if the email address already exists in database and validates the received user using validator. If no
     * issues occur, adds (registers) the user into the database using prepared statement. Throws SQLException on
     * database errors and UserValidationException on not valid user.
     *
     * @param user
     * @param c
     * @return response
     * @throws SQLException
     */
    public int createUser(User user, Connection c) throws SQLException {
        try {
            Statement st = c.createStatement();
            //check if email exists and is correct email
            //check if password is correct
            //insert into database using prepared statement
        } catch (SQLException e) {
            throw e;
        } finally {
            c.close();
        }
        return 0;
    }
}

package org.kainos.groupA.utils;

import java.io.FileInputStream;
import java.sql.*;
import java.util.Properties;

public class DatabaseConnector {
    private static Connection conn;

    public Connection getConnection() throws SQLException {
        String user;
        String password;
        String host;
        String db;

        if (conn != null && !conn.isClosed()) {
            return conn;
        }

        try {
            user = System.getenv("DB_USERNAME");
            password = System.getenv("DB_PASSWORD");
            host = System.getenv("DB_HOST");
            db = System.getenv("DB_NAME");


            if (user == null || password == null || host == null)
                throw new IllegalArgumentException(
                        "Properties file must exist and must contain "
                                + "user, password, an host properties.");

            conn = DriverManager.getConnection("jdbc:mysql://"
                    + host + "/" + db + "?allowPublicKeyRetrieval=true&useSSL=false", user, password);
            return conn;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
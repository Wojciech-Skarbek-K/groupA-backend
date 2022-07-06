package org.kainos.groupA.db;

import org.kainos.groupA.api.JobRole;

import java.io.FileInputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class DB {
    private static Connection conn;

    protected static Connection getConnection() {
        String user;
        String password;
        String host;
        String db;

        if (conn != null) {
            return conn;
        }

        try {
            FileInputStream propsStream =
                    new FileInputStream("db.properties");

            Properties props = new Properties();
            props.load(propsStream);

            user            = props.getProperty("user");
            password        = props.getProperty("password");
            host            = props.getProperty("host");
            db              = props.getProperty("db");

            if (user == null || password == null || host == null)
                throw new IllegalArgumentException(
                        "Properties file must exist and must contain "
                                + "user, password, an host properties.");

            conn = DriverManager.getConnection("jdbc:mysql://"
                    + host + "/" + db +  "?allowPublicKeyRetrieval=true&useSSL=false", user, password);
            return conn;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<JobRole> getJobRoles() throws SQLException {
        Connection c = getConnection();

        Statement st = c.createStatement();
        ResultSet rs = st.executeQuery(
                "SELECT * " + "FROM Job_Roles;");

        List<JobRole> jobs = new ArrayList<>();

        while (rs.next()) {
            JobRole job = new JobRole(
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getString("sharepoint url"),
                    rs.getInt("cap id")
            );

            jobs.add(job);
        }
        return jobs;
    }
}

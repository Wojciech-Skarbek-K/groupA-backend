package org.kainos.groupA.dao;

import org.kainos.groupA.models.JobRole;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JobRoleDao {
    public List<JobRole> getJobRoles(Connection c) throws SQLException {
        List<JobRole> jobs = new ArrayList<>();
        try {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(
                    "SELECT * " + "FROM Job_Roles;");

            while (rs.next()) {
                JobRole job = new JobRole(
                        rs.getString("role_name"),
                        rs.getString("role_description"),
                        rs.getString("sharepoint_url"),
                        rs.getInt("cap_id")
                );
                jobs.add(job);
            }
        } catch (SQLException e) {
            System.out.println(e + " is thrown in dao.");
            throw e;
        } finally {
            c.close();
        }
        return jobs;
    }
}

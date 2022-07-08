package org.kainos.groupA.dao;

import org.kainos.groupA.api.models.JobRole;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JobRoleDao {

    public List<JobRole> getJobRoles(Connection c) throws SQLException {
        Statement st = c.createStatement();
        ResultSet rs = st.executeQuery(
                "SELECT * " + "FROM Job_Roles;");

        List<JobRole> jobs = new ArrayList<>();

        while (rs.next()) {
            JobRole job = new JobRole(
                    rs.getString("role_name"),
                    rs.getString("role_description"),
                    rs.getString("sharepoint_url"),
                    rs.getInt("cap_id")
            );
            jobs.add(job);
        }
        return jobs;
    }
}

package org.kainos.groupA.dao;

import org.kainos.groupA.models.AddJobRole;
import org.kainos.groupA.models.JobRole;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddJobRoleDao {
    public int addJobRole(AddJobRole jobRole, Connection c) throws SQLException {
        //List<JobRole> jobs = new ArrayList<>();
        int jobRoleID = -1;

        try {
                    String addJobRoleQuery = "INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id)" +
                            "VALUES (?, ?, ?, ?, ?);";

            PreparedStatement preparedSt = c.prepareStatement(addJobRoleQuery, Statement.RETURN_GENERATED_KEYS);
            preparedSt.setString(1, jobRole.getRole_name());
            preparedSt.setString(2, jobRole.getRole_description());
            preparedSt.setString(3, jobRole.getSharepoint_url());
            preparedSt.setInt(4, jobRole.getCap_id());
            preparedSt.setInt(5, jobRole.getBand_id());

            int affectedRows = preparedSt.executeUpdate();

            try (ResultSet rs = preparedSt.getGeneratedKeys()) {
                if (rs.next()) {
                    jobRoleID = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            c.close();
        }
        return jobRoleID;
    }


}

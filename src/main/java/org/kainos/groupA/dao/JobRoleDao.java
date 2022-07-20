package org.kainos.groupA.dao;

import org.kainos.groupA.exception.JobRoleDoesNotExistException;
import org.kainos.groupA.exception.RespIDDoesNotExistException;
import org.kainos.groupA.models.Competency;
import org.kainos.groupA.models.JobRole;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JobRoleDao {
    /**
     * Sends query to database using Connection c. On successful transaction creates a list of JobRoles. After the
     * list is created, connection is closed and the list is returned.
     *
     * @param c connection which will be used to send query.
     * @return List of JobRoles
     * @throws SQLException
     */
    public List<JobRole> getJobRoles(Connection c) throws SQLException {
        List<JobRole> jobs = new ArrayList<>();
        try {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(

                    "SELECT * FROM Job_Roles JOIN Band ON (Job_Roles.band_id = Band.band_id) JOIN Capability ON (Job_Roles.cap_id = Capability.cap_id);");

            while (rs.next()) {
                JobRole job = new JobRole(
                        rs.getInt("role_id"),
                        rs.getString("role_name"),
                        rs.getString("role_description"),
                        rs.getString("sharepoint_url"),
                        rs.getInt("cap_id"),
                        rs.getString("cap_name"),
                        rs.getInt("band_id"),
                        rs.getString("band_name")
                );
                jobs.add(job);
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            c.close();
        }
        return jobs;
    }

    public JobRole getJobRole(Connection c, int roleId) throws SQLException, JobRoleDoesNotExistException {
        JobRole job = new JobRole(0, "", "", "", 0, "", 0, "");
        try {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(

                    "SELECT * FROM Job_Roles WHERE role_id = '" + roleId + "'");

            if(!rs.next()){
                throw new JobRoleDoesNotExistException();
            }
            else{
                while(rs.next()){
                    job.setRole_id(rs.getInt("role_id"));
                    job.setRole_name(rs.getString("role_name"));
                    job.setRole_description(rs.getString("role_description"));
                    job.setSharepoint_url(rs.getString("sharepoint_url"));
                    job.setCap_id(rs.getInt("cap_id"));
                    job.setCap_name(rs.getString("cap_name"));
                    job.setBand_id(rs.getInt("band_id"));
                    job.setBand_name(rs.getString("band_name"));
                }
            }
        } catch(SQLException | JobRoleDoesNotExistException e) {
            throw e;
        } finally {
            c.close();
        }
        return job;
    }
}

package org.kainos.groupA.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteJobRoleDao {
    /**
     * Sends query to database using Connection c. On successful transaction deletes a job role. After the
     * role is deleted, connection is closed.
     *
     * @param c connection which will be used to send query.
     * @param jobRoleId get a job role that will be deleted.
     * @return id of deleted job role
     * @throws SQLException
     */
    public void deleteJobRole(Connection c, int jobRoleId) throws SQLException{
        try {
            Statement st = c.createStatement();
            String deleteJobRoleQuery = "DELETE FROM Job_Roles WHERE role_id = '" + jobRoleId + "'";
            st.executeUpdate(deleteJobRoleQuery);

        } catch (SQLException e) {
            throw e;
        } finally {
            c.close();
        }
    }

}

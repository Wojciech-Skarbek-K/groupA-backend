package org.kainos.groupA.api;

import io.swagger.annotations.Api;
import org.kainos.groupA.api.models.JobRole;
import org.kainos.groupA.db.DB;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.sql.SQLException;
import java.util.List;

@Path("/api")
@Api("User API")
public class JobService {

    @GET
    @Path("/job-roles")
    @Produces(MediaType.APPLICATION_JSON)
    public List<JobRole> getJobRoles()throws SQLException {
        try {
            return DB.getJobRoles();
        } catch (SQLException e) {
            System.out.println("SQL Exception: There are no job roles to be displayed." + e.getMessage());
            return null;
        }
    }
}

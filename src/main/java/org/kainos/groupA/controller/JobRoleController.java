package org.kainos.groupA.controller;

import io.swagger.annotations.Api;
import org.eclipse.jetty.http.HttpStatus;
import org.kainos.groupA.exception.InvalidJobRoleException;
import org.kainos.groupA.models.AddJobRole;
import org.kainos.groupA.dao.JobRoleDao;
import org.kainos.groupA.services.AddJobRoleService;
import org.kainos.groupA.utils.DatabaseConnector;
import org.kainos.groupA.services.JobRoleService;
import org.kainos.groupA.validator.AddJobRoleValidator;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.SQLException;

@Path("/api")
@Api("Job Role API")
public class JobRoleController {

    private static JobRoleService jobRoleService;

    public JobRoleController() {
        DatabaseConnector databaseConnector = new DatabaseConnector();
        jobRoleService = new JobRoleService(databaseConnector, new JobRoleDao());
    }

    /**
     * On successful retrieval of list of JobRoles, builds a response and returns it. If
     * the list couldn't be retrieved returns response with code 500 (Internal Server Error)
     *
     * @return response
     * @throws SQLException
     */
    @GET
    @Path("/job-roles")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getJobRoles() throws SQLException {
        try {
            return Response.ok(jobRoleService.getJobRoles()).build();
        } catch (SQLException e) {
            return Response.status(HttpStatus.INTERNAL_SERVER_ERROR_500).build();
        }
    }

}
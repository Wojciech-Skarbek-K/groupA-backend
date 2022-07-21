package org.kainos.groupA.controller;

import io.swagger.annotations.Api;
import org.eclipse.jetty.http.HttpStatus;
import org.kainos.groupA.dao.AddJobRoleDao;
import org.kainos.groupA.exception.InvalidJobRoleException;
import org.kainos.groupA.models.AddJobRole;
import org.kainos.groupA.services.AddJobRoleService;
import org.kainos.groupA.utils.DatabaseConnector;
import org.kainos.groupA.validator.AddJobRoleValidator;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.SQLException;

@Path("/api")
@Api("Add Job Role API")
public class AddJobRoleController {
    private static AddJobRoleService jobRoleService;
    private static AddJobRoleValidator addJobRoleValidator;

    public AddJobRoleController() {
        DatabaseConnector databaseConnector = new DatabaseConnector();
        jobRoleService = new AddJobRoleService(databaseConnector, new AddJobRoleDao());
        addJobRoleValidator = new AddJobRoleValidator();
    }

    @POST
    @Path("/job-roles")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response addJobRole(AddJobRole jobRole) throws InvalidJobRoleException {
                try {
                    return Response.ok(jobRoleService.addJobRole(jobRole)).build();
                } catch (NullPointerException | InvalidJobRoleException e) {
                    return Response.status(HttpStatus.BAD_REQUEST_400).entity(e.getMessage()).build();
                } catch (SQLException e) {
                    return Response.status(HttpStatus.INTERNAL_SERVER_ERROR_500).build();
                }
    }
}

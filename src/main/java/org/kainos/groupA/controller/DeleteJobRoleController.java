package org.kainos.groupA.controller;

import io.swagger.annotations.Api;
import org.eclipse.jetty.http.HttpStatus;
import org.kainos.groupA.dao.DeleteJobRoleDao;
import org.kainos.groupA.dao.JobRoleDao;
import org.kainos.groupA.exception.BandIDDoesNotExistException;
import org.kainos.groupA.exception.JobRoleDoesNotExistException;
import org.kainos.groupA.models.JobRole;
import org.kainos.groupA.services.DeleteJobRoleService;
import org.kainos.groupA.services.JobRoleService;
import org.kainos.groupA.utils.DatabaseConnector;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.sql.SQLException;

@Path("/api")
@Api("Delete Job Role API")
public class DeleteJobRoleController {

    private static DeleteJobRoleService deleteJobRoleService;
    private static JobRoleService jobRoleService;

    public DeleteJobRoleController() {
        DatabaseConnector databaseConnector = new DatabaseConnector();
        deleteJobRoleService = new DeleteJobRoleService(databaseConnector, new DeleteJobRoleDao());
        jobRoleService = new JobRoleService(databaseConnector, new JobRoleDao());
    }

    /**
     * On successful retrieval of list of JobRoles, builds a response and returns it. If
     * the list couldn't be retrieved returns response with code 500 (Internal Server Error)
     *
     * @return response
     * @throws SQLException
     */
    @DELETE
    @Path("/job-roles/{id}")
    public Response deleteJobRole(@PathParam("id")int roleId){
        try{
            JobRole jobRole = jobRoleService.findJobRoleById(roleId);
            deleteJobRoleService.deleteJobRole(roleId);
            return Response.ok(HttpStatus.OK_200).build();
        }
        catch( SQLException e) {
            return Response.status(HttpStatus.INTERNAL_SERVER_ERROR_500).build();
        } catch (JobRoleDoesNotExistException e) {
            return Response.status(HttpStatus.BAD_REQUEST_400).build();
        }
    }
}

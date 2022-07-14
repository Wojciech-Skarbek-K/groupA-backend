package org.kainos.groupA.controller;

import io.swagger.annotations.Api;
import org.eclipse.jetty.http.HttpStatus;
import org.kainos.groupA.dao.BandCompDao;
import org.kainos.groupA.dao.JobResponsibilityDao;
import org.kainos.groupA.exception.BandIDDoesNotExistException;
import org.kainos.groupA.exception.RespIDDoesNotExistException;
import org.kainos.groupA.services.BandCompService;
import org.kainos.groupA.services.JobResponsibilityService;
import org.kainos.groupA.utils.DatabaseConnector;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.SQLException;

@Path("/api")
@Api("Job Responsibility API")
public class JobResponsibilityController {

        private static JobResponsibilityService jobResponsibilityService;

        public JobResponsibilityController() {
            DatabaseConnector databaseConnector = new DatabaseConnector();
            jobResponsibilityService = new JobResponsibilityService(databaseConnector, new JobResponsibilityDao());
        }


        @GET
        @Path("/job-responsibility/{id}")
        @Produces(MediaType.APPLICATION_JSON)
        public Response getJobResponsibilityByID(@PathParam("id") int roleID) {
            try {
                return Response.ok(jobResponsibilityService.getJobResponsibilityByID(roleID)).build();
            } catch ( SQLException e) {
                return Response.status(HttpStatus.INTERNAL_SERVER_ERROR_500).build();
            } catch (RespIDDoesNotExistException e) {
                return Response.status(HttpStatus.BAD_REQUEST_400).build();
            }
        }

}

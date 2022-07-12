package org.kainos.groupA.controller;

import io.swagger.annotations.Api;
import org.eclipse.jetty.http.HttpStatus;
import org.kainos.groupA.dao.BandCompDao;
import org.kainos.groupA.utils.DatabaseConnector;
import org.kainos.groupA.services.BandCompService;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.SQLException;

@Path("/api")
@Api("Band Comp API")
public class BandCompController {

    private static BandCompService bandCompService;

    public BandCompController() {
        DatabaseConnector databaseConnector = new DatabaseConnector();
        bandCompService = new BandCompService(databaseConnector, new BandCompDao());
    }

    @GET
    @Path("/band-comp/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getJobRoles(@PathParam("id") int bandID) throws SQLException {
        try {
            return Response.ok(bandCompService.getCompByBandID(bandID)).build();
        } catch ( SQLException e) {
            return Response.status(HttpStatus.INTERNAL_SERVER_ERROR_500).build();
        }
    }

}

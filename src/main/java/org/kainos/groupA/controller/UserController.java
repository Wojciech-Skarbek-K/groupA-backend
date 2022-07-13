package org.kainos.groupA.controller;

import io.swagger.annotations.Api;
import org.eclipse.jetty.http.HttpStatus;
import org.kainos.groupA.dao.UserDao;
import org.kainos.groupA.models.User;
import org.kainos.groupA.services.UserService;
import org.kainos.groupA.utils.DatabaseConnector;
import org.kainos.groupA.validator.UserValidator;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.SQLException;
import java.util.List;

@Path("/api")
@Api("User API")
public class UserController {
    //Endpoints

    private static UserService userService;
    private static UserValidator userValidator;

    public UserController() {
        DatabaseConnector databaseConnector = new DatabaseConnector();
        userService = new UserService(databaseConnector, new UserDao());
        userValidator = new UserValidator();
    }

    @POST
    @Path("/users")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response createUser(User user) {
        if(userValidator.isValidUser(user)) {
            try {
                return Response.ok(userService.createUser(user)).build();
            } catch ( SQLException | NullPointerException e) {
                System.out.println(e);
                return Response.status(HttpStatus.INTERNAL_SERVER_ERROR_500).entity(e.getMessage()).build();
            }
        } else {
            return Response.status(HttpStatus.BAD_REQUEST_400).build();
        }
    }

    @GET
    @Path("/users")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public List<User> getUsers() {
        return null;
    }
}

package org.kainos.groupA.api;

import io.swagger.annotations.Api;
import org.kainos.groupA.api.models.User;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/api")
@Api("User API")
public class UserService {
    //Endpoints
    @GET
    @Path("/users")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public List<User> getUsers() {
        return null;
    }
}

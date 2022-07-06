package org.kainos.groupA.api;

import io.swagger.annotations.Api;
import org.kainos.groupA.api.models.User;
import org.kainos.groupA.db.DB;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.sql.SQLException;
import java.util.List;

@Path("/api")
@Api("User API")
public class UserService {
    //Endpoints
}

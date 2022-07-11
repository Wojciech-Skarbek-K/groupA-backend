package org.kainos.groupA.services;

import io.swagger.annotations.Api;
import org.kainos.groupA.dao.JobRoleDao;
import org.kainos.groupA.models.JobRole;
import org.kainos.groupA.utils.DatabaseConnector;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.sql.SQLException;
import java.util.List;

@Path("/api")
@Api("User API")
public class JobRoleService {

    private DatabaseConnector databaseConnector;
    public JobRoleDao jobRoleDao;

    public JobRoleService(DatabaseConnector databaseConnector, JobRoleDao jobRoleDao) {
        this.databaseConnector = databaseConnector;
        this.jobRoleDao = jobRoleDao;
    }

    public List<JobRole> getJobRoles() throws SQLException {
        return jobRoleDao.getJobRoles(databaseConnector.getConnection());
    }
}

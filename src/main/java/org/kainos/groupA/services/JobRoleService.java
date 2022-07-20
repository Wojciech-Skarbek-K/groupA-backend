package org.kainos.groupA.services;

import org.kainos.groupA.dao.JobRoleDao;
import org.kainos.groupA.exception.JobRoleDoesNotExistException;
import org.kainos.groupA.models.JobRole;
import org.kainos.groupA.utils.DatabaseConnector;

import java.sql.SQLException;
import java.util.List;

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

    public JobRole findJobRoleById(int roleId) throws SQLException, JobRoleDoesNotExistException {
        return jobRoleDao.getJobRole(databaseConnector.getConnection(), roleId);
    }
}

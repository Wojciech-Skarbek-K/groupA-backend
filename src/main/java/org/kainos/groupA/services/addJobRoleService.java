package org.kainos.groupA.services;

import org.kainos.groupA.dao.AddJobRoleDao;
import org.kainos.groupA.dao.JobRoleDao;
import org.kainos.groupA.models.JobRole;
import org.kainos.groupA.utils.DatabaseConnector;

import java.sql.SQLException;
import java.util.List;

public class addJobRoleService {

    private DatabaseConnector databaseConnector;
    public AddJobRoleDao addJobRoleDao;

    public addJobRoleService(DatabaseConnector databaseConnector, AddJobRoleDao addJobRoleDao) {
        this.databaseConnector = databaseConnector;
        this.addJobRoleDao = addJobRoleDao;
    }

    public int addJobRole(JobRole jobRole) throws SQLException {
        return addJobRoleDao.addJobRole(jobRole, databaseConnector.getConnection());
    }
}

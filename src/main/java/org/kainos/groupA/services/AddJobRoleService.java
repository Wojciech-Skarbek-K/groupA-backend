package org.kainos.groupA.services;

import org.kainos.groupA.dao.AddJobRoleDao;
import org.kainos.groupA.exception.InvalidJobRoleException;
import org.kainos.groupA.models.AddJobRole;
import org.kainos.groupA.models.JobRole;
import org.kainos.groupA.models.User;
import org.kainos.groupA.utils.DatabaseConnector;
import org.kainos.groupA.validator.AddJobRoleValidator;

import java.sql.SQLException;

public class AddJobRoleService {

    private DatabaseConnector databaseConnector;

    private AddJobRoleValidator addJobRoleValidator;
    public AddJobRoleDao addJobRoleDao;

    public AddJobRoleService(DatabaseConnector databaseConnector, AddJobRoleDao addJobRoleDao) {
        this.databaseConnector = databaseConnector;
        this.addJobRoleDao = addJobRoleDao;
    }


    public int addJobRole(AddJobRole jobRole) throws SQLException, InvalidJobRoleException {
        if (addJobRoleValidator.isValidJobRole(jobRole)) {
            return addJobRoleDao.addJobRole(jobRole, databaseConnector.getConnection());
        }
        throw new InvalidJobRoleException("Invalid job role");
    }
}

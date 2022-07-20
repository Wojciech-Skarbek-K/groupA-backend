package org.kainos.groupA.services;

import org.kainos.groupA.dao.DeleteJobRoleDao;
import org.kainos.groupA.utils.DatabaseConnector;

import java.sql.SQLException;

public class DeleteJobRoleService {

    private DatabaseConnector databaseConnector;
    public DeleteJobRoleDao deleteJobRoleDao;

    public DeleteJobRoleService(DatabaseConnector databaseConnector, DeleteJobRoleDao deleteJobRoleDao) {
        this.databaseConnector = databaseConnector;
        this.deleteJobRoleDao = deleteJobRoleDao;
    }

    public int deleteJobRole(int roleId) throws SQLException {
       deleteJobRoleDao.deleteJobRole(databaseConnector.getConnection(), roleId);
       return roleId;
    }

}

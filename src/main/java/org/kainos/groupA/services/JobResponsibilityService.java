package org.kainos.groupA.services;

import org.kainos.groupA.dao.JobResponsibilityDao;
import org.kainos.groupA.exception.RespIDDoesNotExistException;
import org.kainos.groupA.models.Responsibility;
import org.kainos.groupA.utils.DatabaseConnector;

import java.sql.SQLException;
import java.util.List;

public class JobResponsibilityService {

    private DatabaseConnector databaseConnector;
    public JobResponsibilityDao jobResponsibilityDao;

    public JobResponsibilityService(DatabaseConnector databaseConnector, JobResponsibilityDao jobResponsibilityDao) {
        this.databaseConnector = databaseConnector;
        this.jobResponsibilityDao = jobResponsibilityDao;
    }

    public Responsibility getJobResponsibilityByID(int roleID) throws SQLException, RespIDDoesNotExistException {
        return jobResponsibilityDao.getJobResponsibilityByID(databaseConnector.getConnection(), roleID);
    }
}

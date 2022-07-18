package org.kainos.groupA.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.groupA.dao.JobResponsibilityDao;
import org.kainos.groupA.exception.BandIDDoesNotExistException;
import org.kainos.groupA.exception.RespIDDoesNotExistException;
import org.kainos.groupA.models.Competency;
import org.kainos.groupA.models.Responsibility;
import org.kainos.groupA.services.JobResponsibilityService;
import org.kainos.groupA.utils.DatabaseConnector;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@ExtendWith(MockitoExtension.class)
public class JobRespServiceTest {

    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    Connection conn;

    JobResponsibilityDao jobResponsibilityDao = Mockito.mock(JobResponsibilityDao.class);

    JobResponsibilityService jobResponsibilityService = new JobResponsibilityService(databaseConnector, jobResponsibilityDao);

    @Test
    void getJobResponsibilityByID_shouldReturnListOfResponsibilities_whenReturnsResponsibilityList() throws SQLException, RespIDDoesNotExistException {
        List<Responsibility> responsibilityList = new ArrayList<>();
        int id = 1;
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(jobResponsibilityDao.getJobResponsibilityByID(conn, id)).thenReturn(responsibilityList);
        assertEquals(responsibilityList, jobResponsibilityService.getJobResponsibilityByID(id));
    }

    @Test
    void getJobResponsibilityByID_shouldThrowSQLException_whenThrowsSQLException() throws SQLException, RespIDDoesNotExistException {
        int id = 1;
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(jobResponsibilityDao.getJobResponsibilityByID(conn,id)).thenThrow(SQLException.class);
        assertThrows(SQLException.class, () -> jobResponsibilityService.getJobResponsibilityByID(id));
    }

    @Test
    void getJobResponsibilityByID_shouldThrowRespIDDoesNotExist_whenIDisGreaterThanRespTableCount() throws SQLException, RespIDDoesNotExistException {
        int id = 232;
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(jobResponsibilityDao.getJobResponsibilityByID(conn,id)).thenThrow(RespIDDoesNotExistException.class);
        assertThrows(RespIDDoesNotExistException.class, () -> jobResponsibilityService.getJobResponsibilityByID(id));
    }

}

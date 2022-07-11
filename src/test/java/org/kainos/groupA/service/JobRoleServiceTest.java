package org.kainos.groupA.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.groupA.controller.JobRoleController;
import org.kainos.groupA.models.JobRole;
import org.kainos.groupA.dao.JobRoleDao;
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
public class JobRoleServiceTest {

    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    Connection conn;
    JobRoleDao jobRoleDao = Mockito.mock(JobRoleDao.class);
    JobRoleController jobService = Mockito.mock(JobRoleController.class);

    @Test
    void getJobRoles_shouldReturnJobRolesList_whenReturnsJobRolesList() throws SQLException {
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        List<JobRole> employeeList = new ArrayList<JobRole>();
        Mockito.when(jobRoleDao.getJobRoles(conn)).thenReturn(employeeList);

        assertEquals(employeeList, jobService.getJobRoles());
    }

    @Test
    void getJobRoles_shouldThrowSqlException_whenThrowsSqlException() throws SQLException {
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(jobRoleDao.getJobRoles(conn)).thenThrow(SQLException.class);
        assertThrows(SQLException.class, () -> jobService.getJobRoles());
    }
}

package org.kainos.groupA.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.groupA.dao.AddJobRoleDao;
import org.kainos.groupA.models.AddJobRole;
import org.kainos.groupA.services.AddJobRoleService;
import org.kainos.groupA.utils.DatabaseConnector;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@ExtendWith(MockitoExtension.class)
public class AddJobRoleServiceTest {

    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    Connection conn;
    AddJobRoleDao addJobRoleDao = Mockito.mock(AddJobRoleDao.class);
    AddJobRoleService addJobRoleService = new AddJobRoleService(databaseConnector, addJobRoleDao);

    AddJobRole testRole = new AddJobRole(
            "Kainos New Role",
            "This is a new kainos job role",
            "https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/test",
            1,
            1);

    @Test
    void createJobRole_shouldReturnJobRoleID_whenReturnsCreatedJobRoleID() throws SQLException {
        int exceptedResult = 1;
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(addJobRoleDao.addJobRole(testRole, conn)).thenReturn(exceptedResult);
        int result = addJobRoleService.addJobRole(testRole);
        assertEquals(result, exceptedResult);
    }

    @Test
    void createJobRole_shouldThrowSqlException_whenThrowsSqlException() throws SQLException {
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(addJobRoleDao.addJobRole(testRole, conn)).thenThrow(SQLException.class);
        assertThrows(SQLException.class, () -> addJobRoleService.addJobRole(testRole));
    }


}

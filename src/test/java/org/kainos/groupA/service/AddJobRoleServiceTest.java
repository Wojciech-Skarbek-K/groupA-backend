package org.kainos.groupA.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.groupA.dao.AddJobRoleDao;
import org.kainos.groupA.exception.InvalidJobRoleException;
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

    AddJobRole invalidRole = new AddJobRole(
            "Kainos New Role",
            "This is a new kainos job role",
<<<<<<< HEAD
            "hello",
=======
            "https://kainossoftwareltd.sharepoint.com/people/Job%2",
>>>>>>> 6dee420f394b9553351ab88ee1751a2031a42669
            1,
            1);

    @Test
    void createJobRole_shouldReturnJobRoleID_whenReturnsCreatedJobRoleID() throws SQLException, InvalidJobRoleException {
        int exceptedResult = 1;
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(addJobRoleDao.addJobRole(testRole, conn)).thenReturn(exceptedResult);
        int result = addJobRoleService.addJobRole(testRole);
        assertEquals(result, exceptedResult);
    }

    //needs test for isValidJobRole returns false
    @Test
    void createJobRole_shouldReturnFalse_whenFails() throws SQLException, InvalidJobRoleException {
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(addJobRoleDao.addJobRole(testRole, conn)).thenThrow(SQLException.class);
        assertThrows(SQLException.class, () -> addJobRoleService.addJobRole(testRole));
        Mockito.when(addJobRoleDao.addJobRole(invalidRole, conn)).thenThrow(SQLException.class);
        assertThrows(InvalidJobRoleException.class, () -> addJobRoleService.addJobRole(invalidRole));

    }

    @Test
    void createJobRole_shouldThrowSqlException_whenThrowsSqlException() throws SQLException, InvalidJobRoleException {
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(addJobRoleDao.addJobRole(testRole, conn)).thenThrow(SQLException.class);
        assertThrows(SQLException.class, () -> addJobRoleService.addJobRole(testRole));
    }

    @Test
    void createJobRole_shouldReturnFalse_whenFails() throws InvalidJobRoleException, SQLException {
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(addJobRoleDao.addJobRole(invalidRole, conn)).thenThrow(InvalidJobRoleException.class);
        assertThrows(InvalidJobRoleException.class, () -> addJobRoleService.addJobRole(invalidRole));
    }

}

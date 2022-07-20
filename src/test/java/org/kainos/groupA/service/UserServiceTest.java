package org.kainos.groupA.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.groupA.dao.UserDao;
import org.kainos.groupA.models.User;
import org.kainos.groupA.services.UserService;
import org.kainos.groupA.utils.DatabaseConnector;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@ExtendWith(MockitoExtension.class)
public class UserServiceTest {
    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    Connection conn;
    UserDao userDao = Mockito.mock(UserDao.class);
    UserService userService = new UserService(databaseConnector, userDao);

    User testUser =  new User(
            "test@email.com",
            "encryptedpass",
            User.Role.Employee,
            "Joe",
            "Doe",
            "123456789",
            User.Location.Birmingham
    );

    @Test
    void createUser_shouldReturnCreatedUserId_whenReturnsCreatedUserId() throws SQLException {
        int exceptedResult = 1;
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(userDao.createUser(testUser, conn)).thenReturn(exceptedResult);
        int result = userService.createUser(testUser);
        assertEquals(result, exceptedResult);
    }

    @Test
    void createUser_shouldThrowSqlException_whenThrowsSqlException() throws SQLException {
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(userDao.createUser(testUser, conn)).thenThrow(SQLException.class);
        assertThrows(SQLException.class, () -> userService.createUser(testUser));
    }
}

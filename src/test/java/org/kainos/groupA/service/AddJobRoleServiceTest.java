package org.kainos.groupA.service;

import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.groupA.dao.AddJobRoleDao;
import org.kainos.groupA.utils.DatabaseConnector;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Connection;

@ExtendWith(MockitoExtension.class)
public class AddJobRoleServiceTest {

    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    Connection conn;

}

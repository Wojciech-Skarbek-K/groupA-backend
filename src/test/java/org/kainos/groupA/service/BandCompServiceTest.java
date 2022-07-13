package org.kainos.groupA.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.groupA.dao.BandCompDao;
import org.kainos.groupA.exception.BandIDDoesNotExistException;
import org.kainos.groupA.models.Competency;
import org.kainos.groupA.services.BandCompService;
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
public class BandCompServiceTest {

    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    Connection conn;
    BandCompDao bandCompDao = Mockito.mock(BandCompDao.class);
    BandCompService bandCompService = new BandCompService(databaseConnector, bandCompDao);

    @Test
    void getCompByBandID_shouldReturnListOfCompetencies_whenReturnsCompetencyList() throws SQLException, BandIDDoesNotExistException {
        List<Competency> competencyList = new ArrayList<>();
        int id = 1;
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(bandCompDao.getCompByBandID(conn, id)).thenReturn(competencyList);
        assertEquals(competencyList, bandCompService.getCompByBandID(id));
    }

    @Test
    void getCompByBandID_shouldThrowSQLException_whenThrowsSQLException() throws SQLException, BandIDDoesNotExistException {
        int id = 1;
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(bandCompDao.getCompByBandID(conn,id)).thenThrow(SQLException.class);
        assertThrows(SQLException.class, () -> bandCompService.getCompByBandID(id));
    }

    @Test
    void getCompByBandID_shouldThrowBandIDDoesNotExist_whenIDisGreaterThanBandTableCount() throws SQLException, BandIDDoesNotExistException {
        int id = 200;
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(bandCompDao.getCompByBandID(conn,id)).thenThrow(BandIDDoesNotExistException.class);
        assertThrows(BandIDDoesNotExistException.class, () -> bandCompService.getCompByBandID(id));
    }

    @Test
    void getCompByBandID_shouldThrowBandIDDoesNotExist_whenIDisLessThan1() throws SQLException, BandIDDoesNotExistException {
        int id = -1;
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(bandCompDao.getCompByBandID(conn,id)).thenThrow(BandIDDoesNotExistException.class);
        assertThrows(BandIDDoesNotExistException.class, () -> bandCompService.getCompByBandID(id));
    }
}

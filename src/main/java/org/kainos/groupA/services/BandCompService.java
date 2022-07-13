package org.kainos.groupA.services;

import io.swagger.annotations.Api;
import org.kainos.groupA.dao.BandCompDao;
import org.kainos.groupA.exception.BandIDDoesNotExistException;
import org.kainos.groupA.models.Competency;
import org.kainos.groupA.utils.DatabaseConnector;

import javax.ws.rs.Path;
import java.sql.SQLException;
import java.util.List;

@Path("/api")
@Api("User API")
public class BandCompService {
    private DatabaseConnector databaseConnector;
    public BandCompDao bandCompDao;

    public BandCompService(DatabaseConnector databaseConnector, BandCompDao bandCompDao) {
        this.databaseConnector = databaseConnector;
        this.bandCompDao = bandCompDao;
    }

    public List<Competency> getCompByBandID(int bandID) throws SQLException, BandIDDoesNotExistException {
        return bandCompDao.getCompByBandID(databaseConnector.getConnection(), bandID);
    }


}

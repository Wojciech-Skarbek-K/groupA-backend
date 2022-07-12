package org.kainos.groupA.dao;

import org.kainos.groupA.models.Competency;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BandCompDao {
    public List<Competency> getCompByBandID(Connection c, int id) throws SQLException {
        List<Competency> jobs = new ArrayList<>();
        return jobs;
    }

}

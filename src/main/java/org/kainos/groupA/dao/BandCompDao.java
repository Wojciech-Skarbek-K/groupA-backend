package org.kainos.groupA.dao;

import org.kainos.groupA.models.Competency;
import org.kainos.groupA.exception.BandIDDoesNotExistException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BandCompDao {
    public List<Competency> getCompByBandID(Connection c, int bandID) throws SQLException, BandIDDoesNotExistException{
        List<Competency> comps = new ArrayList<>();
        try {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(
                    "SELECT Band.band_name, Competency.comp_name, Competency.comp_description "
                            + "FROM Band_Comp inner join Competency on Band_Comp.comp_id = Competency.comp_id "
                            + "inner join Band on Band_Comp.band_id = Band.band_id "
                            + "WHERE Band_Comp.band_id = " + bandID + ";");
            if(!rs.next()){
                throw new BandIDDoesNotExistException();
            }
            else{
                do{
                    Competency competency = new Competency(
                            rs.getString("band_name"),
                            rs.getString("comp_name"),
                            rs.getString("comp_description")
                    );
                    comps.add(competency);
                }while(rs.next());
            }
        } catch(SQLException | BandIDDoesNotExistException e) {
            throw e;
        } finally {
            c.close();
        }
        return comps;
    }
}

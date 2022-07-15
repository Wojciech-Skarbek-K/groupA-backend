package org.kainos.groupA.dao;

import org.kainos.groupA.exception.RespIDDoesNotExistException;
import org.kainos.groupA.models.Responsibility;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JobResponsibilityDao {
    public List<Responsibility> getJobResponsibilityByID(Connection c, int roleID) throws SQLException, RespIDDoesNotExistException {
        List<Responsibility> roles = new ArrayList<>();
        try {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(
                    "SELECT Job_Roles.role_name, Responsibility.resp_desc"
                            + " FROM JobRoles_Responsibility inner join Responsibility on JobRoles_Responsibility.resp_id = Responsibility.resp_id "
                            + "inner join Job_Roles on JobRoles_Responsibility.role_id = Job_Roles.role_id"
                            + " WHERE JobRoles_Responsibility.role_id = " + roleID + ";");

            if(!rs.next()){
                throw new RespIDDoesNotExistException();
            }
            else{
                do{
                    Responsibility responsibility = new Responsibility(
                            rs.getString("role_name"),
                            rs.getString("resp_desc")
                    );
                    roles.add(responsibility);
                }while(rs.next());
            }
        } catch(SQLException | RespIDDoesNotExistException e) {
            throw e;
        } finally {
            c.close();
        }
        return roles;
    }



}

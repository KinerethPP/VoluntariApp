package mx.edu.utez.voluntariapp_final.models.organization;

import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoForms {
    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;

    public boolean save(Forms forms) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL  CreateEvent();";
            cs = conn.prepareCall(query);
            cs.setString(1, event.getName());
            cs.setString(2, event.getEvent_date());
            cs.setString(3, event.getEvent_time());
            cs.setString(4, event.getDescription());
            cs.setString(5, event.getStreet());
            cs.setString(6, event.getCologne());
            cs.setString(7, event.getPostal_code());
            cs.setString(8, event.getMunicipality());
            cs.setString(9, event.getState());
            cs.setString(10,event.getCategory());
            cs.setLong(11,event.getUser().getId_user());
            cs.setLong(12,event.getOrgan().getId());

            System.out.println(event.getOrgan().getId()+" Daooooo");
            System.out.println(event.getUser().getId_user()+ " id de Usuario");
            cs .executeQuery();

            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            Logger.getLogger(DaoEvent.class.getName()).log(Level.SEVERE, "Error del save " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }



    public void close() {
        try {
            if (conn != null) conn.close();
            if (pstm != null) pstm.close();
            if (cs != null) cs.close();
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

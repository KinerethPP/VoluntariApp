package mx.edu.utez.voluntariapp_final.models.organization;

import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoEvent {

    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;

    public List<Event> findAll() {
        List<Event> events = new ArrayList<>();
        try {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * FROM events;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            rs = pstm.executeQuery();
            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getLong("id"));
                event.setName(rs.getString("name"));
                events.add(event);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoOrgan.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        } finally {
            close();
        }

        return events;
    }

    public Event findOne(Long id) {
        System.out.println(id);
        try {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * FROM events WHERE id = ?;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            Event event = new Event();
            if (rs.next()) {
                event.setId(rs.getLong("id"));
                event.setName(rs.getString("name"));
                event.setEvent_date(rs.getString("event_date"));
                event.setDescription(rs.getString("description"));
                event.setStreet(rs.getString("street"));
                event.setCologne(rs.getString("cologne"));
                event.setPostal_code(rs.getString("postal_code"));
                event.setMunicipality(rs.getString("municipality"));
                event.setEvent_time(rs.getString("event_time"));
                event.setCategory(rs.getString("category"));
               // Category category = new Category(Long.parseLong(category_id));
               // category.setId(rs.getLong("id"));
                //event.setCategory(category);
                User user =new User();
                event.setUser(user);
                Organ organ =new Organ();
                event.setOrgan(organ);
                //users.add(User);
            }
            return event;

        } catch (SQLException e) {
            Logger.getLogger(DaoOrgan.class.getName())
                    .log(Level.SEVERE, "Error findOne"
                            + e.getMessage());
        } finally {
            close();
        }
        return null;
    }

    public boolean save(Event event) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL  CreateEvent(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?);";
            cs = conn.prepareCall(query);
            /*System.out.println(event.getName());
            System.out.println(event.getEvent_date());
            System.out.println(event.getDescription());
            System.out.println(event.getStreet());
            System.out.println(event.getCologne());
            System.out.println(event.getPostal_code());
            System.out.println(event.getMunicipality());
            System.out.println(event.getEvent_time());*/

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


            /*System.out.println(event.getName());
            System.out.println(event.getEvent_date());
            System.out.println(event.getDescription());
            System.out.println(event.getStreet());
            System.out.println(event.getCologne());
            System.out.println(event.getPostal_code());
            System.out.println(event.getMunicipality());
            System.out.println(event.getEvent_time());
            System.out.println(event.getCategory());
            System.out.println(event.getState());
            System.out.println(event.getId());
            System.out.println(event.getOrgan().getId());
            System.out.println(event.getUser().getId_user());*/
            cs .executeQuery();

            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoEvent.class.getName()).log(Level.SEVERE, "Error save " + e.getMessage());
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
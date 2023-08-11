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
        System.out.println(events);
        try {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * FROM events;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            rs = pstm.executeQuery();

            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getLong("id"));
                event.setName(rs.getString("name"));
                event.setEvent_date(rs.getString("event_date"));
                event.setEvent_time(rs.getString("event_time"));
                event.setDescription(rs.getString("description"));
                event.setStreet(rs.getString("street"));
                event.setCologne(rs.getString("cologne"));
                event.setPostal_code(rs.getString("postal_code"));
                event.setMunicipality(rs.getString("municypaly"));
                event.setState(rs.getString("state"));
                event.setCategory(rs.getString("category"));
                User user = new User();
                user.setId_user(rs.getLong("user_id"));
                Organ organ =new Organ();
                organ.setId(rs.getLong("organization_id"));
                events.add(event);
            }
            System.out.println("Que pedo si llegas aqui?");
        } catch (SQLException e) {
            Logger.getLogger(DaoEvent.class.getName())
                    .log(Level.SEVERE, "Error  del Listado"
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
            cs.setString(1, event.getName());
            cs.setString(2, event.getEvent_date());
            cs.setString(3, event.getEvent_time());
            cs.setString(4, event.getDescription());
            cs.setString(5, event.getStreet());
            cs.setString(6, event.getCologne());
            cs.setString(7, event.getPostal_code());
            cs.setString(8, event.getMunicipality());
            cs.setString(9, event.getState());
            cs.setLong(10,event.getUser().getId_user());
            cs.setLong(11,event.getOrgan().getId());
            cs.setString(12,event.getCategory());
            System.out.println(event.getOrgan().getId()+" Daooooo");
            System.out.println(event.getUser().getId_user()+ " id de Usuario");
            cs .executeQuery();

            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
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
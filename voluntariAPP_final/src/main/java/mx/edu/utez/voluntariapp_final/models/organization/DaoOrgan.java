package mx.edu.utez.voluntariapp_final.models.organization;

import mx.edu.utez.voluntariapp_final.models.CRUD.DaoRepository;
import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.user.DaoAdmin;
import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoOrgan {

    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;


    public List<Organ> findAll() {
        List<Organ> organs = new ArrayList<>();
        try {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * FROM organizations;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            rs = pstm.executeQuery();
            while (rs.next()) {
                Organ organ = new Organ();
                organ.setId(rs.getLong("id"));
                organ.setBussines_name(rs.getString("bussines_name"));
                organs.add(organ);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoOrgan.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        } finally {
            close();
        }

        return organs;
    }


    public Organ findOne(Long id) {
        try {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * FROM users WHERE id_user = ?;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            Organ organ = new Organ();
            if (rs.next()) {
                organ.setId(rs.getLong("id"));
                organ.setBussines_name(rs.getString("Correo"));
                organ.setCologne(rs.getString("cologne"));
                //users.add(User);
            }
            return organ;
        } catch (SQLException e) {
            Logger.getLogger(DaoOrgan.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        } finally {
            close();
        }
        return null;
    }

    public boolean save(Organ organ) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "call dividir_info(?, ?, ?,?,?, ?, ?,?,?, ?,?);";
            cs = conn.prepareCall(query);
            cs.setString(1, organ.getUser().getEmail());
            cs.setString(2, organ.getUser().getPassword());
            cs.setBoolean(3, organ.getUser().isStatus());
            cs.setLong(4, organ.getRole().getId());
            cs.setString(5, organ.getBussines_name());
            cs.setString(6, organ.getStreet());
            cs.setString(7, organ.getCologne());
            cs.setString(8, organ.getPostal_code());
            cs.setString(9, organ.getMunicipality());
            cs.setString(10, organ.getRfc());
            cs.setString(11, organ.getPhone());
            cs.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoOrgan.class.getName()).log(Level.SEVERE, "Error save " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }


    public boolean update(Organ organ, String email, String password) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "UPDATE organizations SET email = ?, password = ?, Active = ? WHERE id_user = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setString(1, email);
            pstm.setString(2, password);
            return pstm.executeUpdate() > 0; // ==1
        } catch (SQLException e) {
            Logger.getLogger(DaoOrgan.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        } finally {
            close();
        }
        return false;
    }

    public boolean delete(Long id) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "DELETE from users WHERE id_user = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        } finally {
            close();
        }
        return false;
    }


    public List<Role> searchRole() {
        return null;
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

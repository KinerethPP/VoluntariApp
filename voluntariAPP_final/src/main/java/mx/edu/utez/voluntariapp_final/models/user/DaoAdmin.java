package mx.edu.utez.voluntariapp_final.models.user;

import mx.edu.utez.voluntariapp_final.models.CRUD.DaoRepository;
import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.organization.Organ;
import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoAdmin implements DaoRepository<Admin> {
    private Connection conn;
    private PreparedStatement pstm;
    private ResultSet rs;


    @Override
    public List<Admin> findAll() {
        List<Admin> admins = new ArrayList<>();
        try{
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * FROM users;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            rs = pstm.executeQuery();
            while (rs.next()){
                Admin User = new Admin();
                User.setId(rs.getLong("id"));
                User.setEmail(rs.getString("Correo"));
                admins.add(User);
            }
        }catch(SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        }finally{
            close();
        }

        return admins;
    }

    @Override
    public Admin findOne(Long id) {
        try{
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * FROM users WHERE id_user = ?;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            Admin User = new Admin();
            if (rs.next()){
                User.setId(rs.getLong("id"));
                User.setEmail(rs.getString("Correo"));
                User.setEnable(rs.getBoolean("enable"));
                //users.add(User);
            }
            return User;
        }catch(SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        }finally{
            close();
        }
        return null;
    }

    @Override
    public boolean save(Admin admin)  {
        try{
            conn = new MYSQLConnection().connect();
            String query = "INSERT INTO users (email, password, enable, role_id) VALUES (?, ?, ?,?);";
            pstm = conn.prepareStatement(query);
            System.out.println(admin.getEmail());
            System.out.println(admin.getPassword());
            System.out.println(admin.getEnable());
            //pstm.setLong(1, admin.getId();
            //Admin admin1 = new Admin();
            pstm.setString(1, admin.getEmail());
            pstm.setString(2, admin.getPassword());
            pstm.setBoolean(3, admin.getEnable());
            pstm.setInt(4, admin.getRole().getId());
            pstm.execute();
            //return pstm.executeUpdate() > 0; // ==1
            return true;
        }catch(SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll "
                            + e.getMessage());
        }finally{
            close();
        }
        return false;
    }

    @Override
    public boolean save(Organ organ, String email, String password, String enable, String role) {
        return false;
    }


    @Override
    public boolean update(Admin admin) {
        try{
            conn = new MYSQLConnection().connect();
            String query = "UPDATE users SET email = ?, password = ?, Active = ? WHERE id_user = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setString(1, admin.getEmail());
            pstm.setString(2, admin.getPassword());
            pstm.setBoolean(3, admin.getEnable());
            return pstm.executeUpdate() > 0; // ==1
        }catch(SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        }finally{
            close();
        }
        return false;
    }

    @Override
    public boolean update(Organ organ, String email, String password) {
        return false;
    }

    @Override
    public boolean delete(Long id) {
        try{
            conn = new MYSQLConnection().connect();
            String query = "DELETE from users WHERE id_user = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            return pstm.executeUpdate() == 1;
        }catch (SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        }finally {
            close();
        }
        return false;
    }

    @Override
    public List<Role> searchRole() {
        return null;
    }

    public void close(){
        try{
            if(conn != null) conn.close();
            if(pstm != null) pstm.close();
            if(rs != null) pstm.close();
        }catch(SQLException e){

        }
    }
}

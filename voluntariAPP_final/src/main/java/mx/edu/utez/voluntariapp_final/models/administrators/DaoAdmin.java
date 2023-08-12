package mx.edu.utez.voluntariapp_final.models.administrators;

import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoAdmin {
    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;

    public List<Admin> findAll() {
        List<Admin> admins = new ArrayList();
        System.out.println("Llegas?"+admins);
        try {
            conn = new MYSQLConnection().connect();
            String query = " SELECT * FROM admin_user_info;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Admin admin =new Admin();
                admin.setId_admin(rs.getLong("admin_id"));
                admin.setName(rs.getString("admin_name"));
                admin.setUser_id(rs.getString("user_id"));
                User user =new User();
                user.setId_user(rs.getLong("id_user"));
                user.setEmail(rs.getString("email"));
                user.setStatus(rs.getBoolean("enable"));
                admin.setUser(user);
                Role role =new Role();
                role.setId(rs.getInt("role_id"));
                admin.setRole(role);
                admins.add(admin);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error del Listado " + e.getMessage());
        } finally {
            close();
        }
        return admins;
    }
    /*public Volunteer findOne(Long id) {
        System.out.println(id);
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT * FROM volunteers where id = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            if (rs.next()) {
                Volunteer volunteer = new Volunteer();
                volunteer.setId(rs.getLong("id"));
                volunteer.setName(rs.getString("name"));
                volunteer.setSurname(rs.getString("surname"));
                volunteer.setLastanme(rs.getString("lastanme"));
                volunteer.setBirthday(rs.getString("birthday"));
                volunteer.setAddress(rs.getString("address"));
                volunteer.setPhone(rs.getString("phone"));
                volunteer.setCurp(rs.getString("curp"));
                volunteer.setUser_id(rs.getString("user_id"));

                User user = new User();
                volunteer.setUser(user);

                Role role = new Role();
                volunteer.setRole(role);

                return volunteer;
            }
        } catch (Exception e) {
            Logger.getLogger(DaoVolunteer.class.getName()).log(Level.SEVERE, "ERROR findOne" + e.getMessage());
        } finally {
            close();
        }
        return null;
    }*/

    public Admin findOneByUser(Long id) {
        System.out.println(id);
        System.out.println("Bienvenido a tu inicio de sesion");
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT a.* ,u.* ,r.* FROM administrators a INNER JOIN users u ON u.id = a.user_id INNER JOIN roles r on r.id= u.role_id where u.id =?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            if (rs.next()) {
              Admin admin = new Admin();
                admin .setId_admin(rs.getLong("id"));
                admin .setName(rs.getString("name"));
                admin.setUser_id(rs.getString("user_id"));
                User user = new User();
                admin.setUser(user);
                Role role = new Role();
                admin.setRole(role);
                return admin;
            }
        } catch (Exception e) {
            Logger.getLogger(DaoAdmin.class.getName()).log(Level.SEVERE, "ERROR findOne" + e.getMessage());
        } finally {
            close();
        }
        return null;
    }

    public boolean save(Admin admin) {
        System.out.println("Bienvenido al DAO");
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL dividir_admin(?,?,?,?,?);";
            cs = conn.prepareCall(query);
            cs.setString(1, admin.getUser().getEmail());
            cs.setString(2, admin.getUser().getPassword());
            cs.setBoolean(3, admin.getUser().isStatus());
            cs.setLong(   4, admin.getRole().getId());
            cs.setString(5, admin.getName());
            cs.executeQuery();
            return true;
        } catch (Exception e) {
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll "
                            + e.getMessage());
        } finally {
            close();
        }
        return false;
    }

    public boolean update(Admin admin) {
        System.out.println("Bienvenido a la actualizacion");
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL actualizar_administrador(?, ?, ?, ?);";
            cs= conn.prepareCall(query);
            cs.setLong(1, admin.getId_admin());
            cs.setString(2, admin.getName());
            cs.setString(3,admin.getUser().getEmail());
            cs.setString(4, admin.getUser().getPassword());
            return cs.executeUpdate() > 0;
            // System.out.println(".... Daooo"+volunteer.getId()+volunteer.getAddress()+volunteer.getPhone()+volunteer.getUser().getEmail()+volunteer.getUser().getPassword());
            //System.out.println("valor de la ejecucion :" + pstm.executeUpdate());
        } catch (SQLException e) {
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error  de la actualizacion"
                            + e.getMessage());
        } finally {
            close();
        }
        return false;
    }

    public void close(){
        try{
            if(conn != null) conn.close();
            if(pstm != null) pstm.close();
            if(rs != null) rs.close();

        }catch(SQLException e){

        }
    }
}

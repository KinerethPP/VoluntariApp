package mx.edu.utez.voluntariapp_final.models.volunteer;
import mx.edu.utez.voluntariapp_final.models.Role.Role;

import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoVolunteer {

    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;


    public List<Volunteer> findAll() {
        List<Volunteer> volunteers = new ArrayList<>();
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT * FROM VolunteerInfo;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Volunteer volunteer = new Volunteer();
                volunteer.setId(rs.getLong("id_volun"));
                volunteer.setName(rs.getString("v_name"));
                volunteer.setSurname(rs.getString("surname"));
                volunteer.setLastanme(rs.getString("lastanme"));
                volunteer.setBirthday(rs.getString("birthday"));
                volunteer.setAddress(rs.getString("address"));
                volunteer.setPhone(rs.getString("phone"));
                volunteer.setCurp(rs.getString("curp"));
                volunteer.setUser_id(rs.getString("user_id"));
                User user = new User();
                user.setId_user(rs.getLong("id_user"));
                user.setEmail(rs.getString("email"));
                user.setStatus(rs.getBoolean("enable"));
                volunteer.setUser(user);
                Role role =new Role();
                role.setId(rs.getInt("role_id"));
                volunteer.setRole(role);
                volunteers.add(volunteer);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoVolunteer.class.getName())
                    .log(Level.SEVERE, "Error findAll " + e.getMessage());
        } finally {
            close();
        }
        return volunteers;
    }

    //Listado para mostarar los voluntarios que seran activados
    public List<Volunteer> findAllActive() {
        List<Volunteer> volunteer = new ArrayList<>();
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT * FROM volunteer_desactive;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Volunteer volunteer1 = new Volunteer();
                volunteer1.setId(rs.getLong("id_volun"));
                volunteer1.setName(rs.getString("v_name"));
                volunteer1.setSurname(rs.getString("surname"));
                volunteer1.setLastanme(rs.getString("lastname"));
                volunteer1.setBirthday(rs.getString("birthday"));
                volunteer1.setAddress(rs.getString("address"));
                volunteer1.setPhone(rs.getString("phone"));
                volunteer1.setCurp(rs.getString("curp"));
                volunteer1.setUser_id(rs.getString("user_id"));
                User user = new User();
                user.setId_user(rs.getLong("id_user"));
                user.setEmail(rs.getString("email"));
                user.setStatus(rs.getBoolean("enable"));
                volunteer1.setUser(user);
                Role role =new Role();
                role.setId(rs.getInt("role_id"));
                volunteer1.setRole(role);
                volunteer.add(volunteer1);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoVolunteer.class.getName())
                    .log(Level.SEVERE, "Error findAll " + e.getMessage());
        } finally {
            close();
        }
        return volunteer;
    }


    public Volunteer findOne(Long id) {
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
    }

    public Volunteer findOneByUser(Long id) {
        System.out.println(id);
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT v.*,u.* ,r.* FROM volunteers v INNER JOIN users u ON u.id = v.user_id " +
                    "INNER JOIN  roles r on r.id= u.role_id where u.id =?;";
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
    }


    public boolean save(Volunteer volunteer) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL div_volunteer(?,?,?,?,?,?,?,?,?,?,?);";
            cs = conn.prepareCall(query);
            cs.setString(1, volunteer.getUser().getEmail());
            cs.setString(2, volunteer.getUser().getPassword());
            cs.setBoolean(3, volunteer.getUser().isStatus());
            cs.setLong(   4, volunteer.getRole().getId());
            cs.setString(5, volunteer.getName());
            cs.setString(6, volunteer.getSurname());
            cs.setString(7, volunteer.getLastanme());
            cs.setString(8, volunteer.getBirthday());
            cs.setString(9, volunteer.getAddress());
            cs.setString(10, volunteer.getPhone());
            cs.setString(11, volunteer.getCurp());
            cs.executeQuery();
            return true;
        } catch (Exception e) {
            Logger.getLogger(DaoVolunteer.class.getName())
                    .log(Level.SEVERE, "Error findAll "
                            + e.getMessage());
        } finally {
            close();
        }
        return false;
    }

    public boolean update(Volunteer volunteer) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL actualizar_voluntario(?, ?, ?, ?, ?);";
            cs= conn.prepareCall(query);
            cs.setLong(1, volunteer.getId());
            cs.setString(2, volunteer.getAddress());
            cs.setString(3, volunteer.getPhone());
            cs.setString(4, volunteer.getUser().getEmail());
            cs.setString(5, volunteer.getUser().getPassword());
            return cs.executeUpdate() > 0;
            // System.out.println(".... Daooo"+volunteer.getId()+volunteer.getAddress()+volunteer.getPhone()+volunteer.getUser().getEmail()+volunteer.getUser().getPassword());
            //System.out.println("valor de la ejecucion :" + pstm.executeUpdate());
           /* if (pstm.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }*/
        } catch (Exception e) {
            Logger.getLogger(DaoVolunteer.class.getName())
                    .log(Level.SEVERE, "Error de la actualización " + e.getMessage());
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

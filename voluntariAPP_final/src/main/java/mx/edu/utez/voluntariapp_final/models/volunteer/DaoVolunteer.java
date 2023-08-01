package mx.edu.utez.voluntariapp_final.models.volunteer;

import mx.edu.utez.voluntariapp_final.models.CRUD.DaoRepository;
import mx.edu.utez.voluntariapp_final.models.Role.Role;

import mx.edu.utez.voluntariapp_final.models.organization.Organ;
import mx.edu.utez.voluntariapp_final.models.user.DaoAdmin;

import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoVolunteer  {

    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;



    public List<Volunteer> findAll(Long id) {
        List<Volunteer> volunteers = new ArrayList<>();
        try{
            conn= new MYSQLConnection().connect();
            String query = "SELECT * FROM volunteers;";
            pstm=conn.prepareStatement(query);
            rs= pstm.executeQuery();

            while(rs.next()){
                Volunteer volunteer = new Volunteer();
              volunteer.setId(rs.getLong("id"));
               volunteer.setName(rs.getString("name"));
                volunteer.setSurname(rs.getString("surname"));
                volunteer.setLastanme(rs.getString("lastanme"));
                volunteer.setBirthday(rs.getString("birthday"));
                volunteer.setAddress(rs.getString("address"));
                volunteer.setPhone(rs.getString("phone"));
                volunteer.setCurp(rs.getString("curp"));
                volunteers.add(volunteer);
            }
        }catch (SQLException e){
            Logger.getLogger(DaoVolunteer.class.getName())
                    .log(Level.SEVERE, "Error findAll "+e.getMessage());
        }finally {
            close();
        }
        return volunteers;
    }


    public Volunteer findOne(Long id) {

        return null;
    }


    public boolean save(Volunteer volunteer)  {
        try{
            conn = new MYSQLConnection().connect();

            String query = "CALL div_volunteer(?,?,?,?,?,?,?,?,?,?,?);";
            cs = conn.prepareCall(query);
            cs.setString(1, volunteer.getUser().getEmail());
            cs.setString(2, volunteer.getUser().getPassword());
            cs.setBoolean(3, volunteer.getUser().isStatus());
            cs.setLong(4, volunteer.getRole().getId());
            cs.setString(5, volunteer.getName());
            cs.setString(6, volunteer.getSurname());
            cs.setString(7, volunteer.getLastanme());
            cs.setString(8, volunteer.getBirthday());
            cs.setString(9, volunteer.getAddress());
            cs.setString(10, volunteer.getPhone());
            cs.setString(11,volunteer.getCurp());
            cs.executeQuery();
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

    public boolean update(Volunteer volunteer){
        try {
            conn = new MYSQLConnection().connect();
            String query = "UPDATE volunteers SET email = ?, password = ?, phone = ?  WHERE id=?; " ;
            pstm = conn.prepareStatement(query);
            pstm.setString(1, volunteer.getUser().getEmail());
            pstm.setString(2,volunteer.getUser().getPassword());
            pstm.setString(3, volunteer.getPhone());
            pstm.setLong(  4,volunteer.getId());

            return pstm.executeUpdate() > 0;
        } catch (Exception e) {
            Logger.getLogger(DaoVolunteer.class.getName())
                    .log(Level.SEVERE, "Error update " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }

    public boolean delete(Long id) {
        return false;
    }


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

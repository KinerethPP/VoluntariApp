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


public class DaoUser implements DaoRepository<User> {
    private Connection conn;
    private PreparedStatement pstm;
    private ResultSet rs;

    public User loadUserByEmailandPassword(String email,
                                           String password) {
        System.out.println(email + password);
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT u.id, u.email, r.description FROM users u JOIN roles r ON u.role_id = r.id where email=? and password=?;";
            pstm = conn.prepareStatement(query);
            pstm.setString(1, email);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId_user(rs.getLong("id"));
                user.setEmail(rs.getString("email"));

                Role description = new Role();
                description.setDescription(rs.getString("description"));
                user.setDescription(description);
                return user;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoUser.class.getName()).log(Level.SEVERE, "Credentials mismatch: " + e.getMessage());
        } finally {
            close();
        }
        return null;
    }

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        //SELECT u.id_user, u.email,u.is_active, r.description, r.id_role
        //FROM users u
        //JOIN roles r ON u.id_user = r.id_role
        //WHERE u.email = 'jassiel@gmail.com'
        //AND u.password = 'admin';
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT u.id_user, u.email,u.is_active, r.description, r.id_role FROM users u JOIN roles r ON u.id_user = r.id_role;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId_user(rs.getLong("id_user"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setIs_active(rs.getString("is_active"));

                Role role = new Role();
                role.setId(rs.getInt("id"));
                role.setDescription(rs.getString("description"));
                user.setDescription(role);
                users.add(user);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoUser.class.getName()).log(Level.SEVERE, "Error findAll " + e.getMessage());
        } finally {
            close();
        }
        return users;
    }

    @Override
    public User findOne(Long id) {
        return null;
    }


    public User finOne(Long id_user) {
        return null;
    }


    public boolean save(User object) throws SQLException {
        try {
            conn = new MYSQLConnection().connect();
            conn.setAutoCommit(false);
            String query = "INSERT INTO users (email,password,id_role) VALUES (?, ?, ?);";
            pstm = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            pstm.setString(1, object.getEmail());
            pstm.setString(2, object.getPassword());
            pstm.setInt(3, object.getDescription().getId());
            pstm.executeUpdate();
            rs = pstm.getGeneratedKeys();

        } catch (SQLException e) {
            Logger.getLogger(DaoUser.class.getName()).log(Level.SEVERE, "Error save " + e.getMessage());
            conn.rollback();
        } finally {
            close();
        }
        return false;
    }

    @Override
    public boolean save(Organ organ, String email, String password, String enable, String role) {
        return false;
    }

    @Override
    public List<Role> searchRole() {
        List<Role> types = new ArrayList<>();
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT *  FROM roles;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt("id"));//Ver despues  *************
                role.setDescription(rs.getString("description"));
                types.add(role);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoUser.class.getName()).log(Level.SEVERE, "ERROR searchType" + e.getMessage());
        } finally {
            close();
        }
        return types;
    }

    @Override
    public boolean update(User object) {
        return false;
    }

    @Override
    public boolean update(Organ organ, String email, String password) {
        return false;
    }

    @Override
    public boolean delete(Long id) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "DELETE FROM users WHERE id =?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoUser.class.getName()).log(Level.SEVERE, "!Error delete ... ¡ " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }

    public void close() {
        try {
            if (conn != null) conn.close();
            if (pstm != null) pstm.close();
            if (rs != null) rs.close();
        } catch (SQLException e) {

        }

    }
}

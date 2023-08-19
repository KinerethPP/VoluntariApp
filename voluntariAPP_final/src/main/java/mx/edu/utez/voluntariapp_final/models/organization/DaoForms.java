package mx.edu.utez.voluntariapp_final.models.organization;

import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoForms {
    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;

    public List<Forms> findAll(long id) {
        List<Forms> list = new ArrayList<>();
        Forms form;
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT * FROM forms WHERE event_id = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                form = new Forms();
                form.setId_forms(rs.getLong("id"));
                form.setName_form(rs.getString("name_forms"));
                form.setInstructions(rs.getString("instructions"));
                form.setEvent_id(rs.getString("event_id"));
                list.add(form);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoForms.class.getName()).log(Level.SEVERE, "Error findAll " + e.getMessage());
        } finally {
            close();
        }
        return list;
    }

    public boolean save(Forms forms) {
        try {
            System.out.println("Bienvenido al DAO de forms");
            conn = new MYSQLConnection().connect();
            String query = "CALL  InsertForm(?,?,?,?);";
            cs = conn.prepareCall(query);
            cs.setString(1, forms.getName_form());
            cs.setString(2, forms.getInstructions());
            cs.setString(3, forms.getEvent_id());
            cs.setString(4, forms.getEvent().getOrganization_id());

            cs.executeQuery();

            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            Logger.getLogger(DaoForms.class.getName()).log(Level.SEVERE, "Error de giardar el formulario " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }
    public boolean saveQuestions(Question question) {
       try {
           System.out.println("Bienvenido al DAO de forms");
           conn = new MYSQLConnection().connect();
           String query = "CALL  CreateQuestionWithAnswers(?,?,?,?,?);";
           cs = conn.prepareCall(query);





          }catch (Exception e) {
        System.out.println(e.getMessage());
        Logger.getLogger(DaoForms.class.getName()).log(Level.SEVERE, "Error de giardar el formulario " + e.getMessage());
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

package mx.edu.utez.voluntariapp_final;

import java.io.*;
import java.util.List;

import com.google.gson.Gson;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import mx.edu.utez.voluntariapp_final.models.organization.DaoForms;
import mx.edu.utez.voluntariapp_final.models.organization.Forms;

@WebServlet(name = "helloServlet", value = "/forms")
public class HelloServlet extends HttpServlet {
    private String id;

    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        id = request.getParameter("id");
        List<Forms> list = new DaoForms().findAll(Long.valueOf(id));
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.println(new Gson().toJson(list));
        out.flush();
    }

    public void destroy() {
    }
}
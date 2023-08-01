package mx.edu.utez.voluntariapp_final.controllers.users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.user.Admin;
import mx.edu.utez.voluntariapp_final.models.user.DaoAdmin;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet(name = "admins", urlPatterns = {
        "/admin/main",
      //  "/admin/admins",
        "/admin/register",
        "/admin/admin-view",
        "/admin/save",
        "/admin/admin-view-update",
        "/admin/update",
        "/admin/delete",
       //Redirecciones de Administrador
        "/admin/administrators",
        "/admin/main-organ",
        "/admin/main-volunt",
        "/admin/organizations",
        "/admin/volunteers",
        "/admin/surveys",
        "/admin/stadist",
        "/admin/aprobe",
        "/admin/porfile",



})
public class ServletAdmin extends HttpServlet {
    private String action;
    private String redirect = "/admin/main";
    private String password;
    private String email;
    private boolean Active;
    private Admin admin;
    private String id;
    private String session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        action = request.getServletPath();
        System.out.println(action);
        switch (action) {
            case "/admin/main":
                List<Admin> admins = new DaoAdmin().findAll();
                request.setAttribute("admins", admins);
                redirect = "/pages/administrators/index_admin.jsp";
                break;
            case "/admin/admin-view":
                redirect = "/pages/accounts/admin.jsp";
                break;
            case "/admin/admin-view-update":
                id = request.getParameter("id");
                admin = new DaoAdmin().findOne(id != null ? Long.parseLong(id) : 0);
                if (admin != null) {
                    request.setAttribute("admin", admin);
                    redirect = "/pages/accounts/administrators/update_admin.jsp";
                } else {
                    redirect = "/admin/main?result" + false + "&message" + URLEncoder.encode("", StandardCharsets.UTF_8);
                }
                break;
            case "/admin/administrators":
                redirect = "/pages/administrators/administrators_admin.jsp";
                break;
            case "/admin/main-organ":
                redirect = "/pages/administrators/administrators_organization.jsp";
                break;

            case "/admin/main-volunt":
                redirect = "/pages/administrators/administrators_volun.jsp";
                break;
            case   "/admin/surveys":
                redirect = "/pages/administrators/administrators_surveys.jsp";
                break;
            case   "/admin/stadist":
                redirect = "/pages/administrators/administrators_stadist.jsp";
                break;
            case   "/admin/aprobe":
                redirect = "/pages/administrators/administrators_aprob.jsp";
                break;
            case   "/admin/porfile":
                redirect = "/pages/administrators/administrator_porfile.jsp";
                break;



            default:
                System.out.println(action);
        }
        request.getRequestDispatcher(redirect).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = request.getServletPath();
        switch (action) {
            case "/admin/admin-view-update":
                id = request.getParameter("id");
                Admin admin = new DaoAdmin().findOne(id != null ? Long.parseLong(id) : 0);
                if (admin != null) {
                    request.setAttribute("admin", admin);
                    redirect = "/pages/administrators/update_admin.jsp";
                } else {
                    redirect = "/admin/main?result" + false + "&message" + URLEncoder.encode("", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/save":
                Admin admin1 = new Admin();
                email = request.getParameter("email");
                password = request.getParameter("password");
                admin1.setId(0L);
                admin1.setEmail(email);
                admin1.setPassword(password);
                admin1.setEnable(Active);
                admin1.setRole(new Role(1, ""));
                if (new DaoAdmin().save(admin1)) {
                    redirect = "/index.jsp?result=true&message=" + URLEncoder.encode("Administrador guardado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/index.jsp?result=false&message=" + URLEncoder.encode("No se pudo guardar el administrador", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/update":
                id = request.getParameter("id");
                email = request.getParameter("email");
                password = request.getParameter("password");
                Active = Boolean.parseBoolean(request.getParameter("Active"));
                Admin admin2 = new Admin(Long.parseLong(id), email, password, Active);
                if (new DaoAdmin().update(admin2)) {
                    redirect = "/admin/main?result=" + true + "&message=" + URLEncoder.encode("Administrador actualizado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result=" + false + "&message=" + URLEncoder.encode("No se pudo actualizar el administrador", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/delete":
                id = request.getParameter("id");
                if (new DaoAdmin().delete(Long.parseLong(id))) {
                    redirect = "/admin/main?result=" + true + "&message=" + URLEncoder.encode("Administrador eliminado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result=" + false + "&message=" + URLEncoder.encode("No se pudo eliminar el administrador", StandardCharsets.UTF_8);
                }
                redirect = "/admin/admins";
                break;
            default:
                redirect = "/admin/admins";
        }
        response.sendRedirect(request.getContextPath() + redirect);
    }

}

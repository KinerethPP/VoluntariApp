package mx.edu.utez.voluntariapp_final.controllers.administrators;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.administrators.Admin;
import mx.edu.utez.voluntariapp_final.models.administrators.DaoAdmin;
import mx.edu.utez.voluntariapp_final.models.organization.DaoOrgan;
import mx.edu.utez.voluntariapp_final.models.organization.Organ;
import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.models.volunteer.DaoVolunteer;
import mx.edu.utez.voluntariapp_final.models.volunteer.Volunteer;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet(name = "admins", urlPatterns = {
        "/admin/main",
        "/admin/porfile",
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
        "/admin/aprobe"

})



public class ServletAdmin extends HttpServlet {
    public String action;
    private String redirect = "/admin/main";

    private Admin admin;


    private String email, password, id_admin, name;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        action = req.getServletPath();
        switch (action) {
            case "/admin/main":
                redirect = "/pages/administrators/index_admin.jsp";
                break;
            case "/admin/admin-view":
                redirect = "/pages/accounts/admin.jsp";
                break;
           /*case "/admin/admin-view-update":
                id = req.getParameter("id");
                admin = new DaoAdmin().findOne(id != null ? Long.parseLong(id) : 0);
                if (admin != null) {
                    req.setAttribute("admin", admin);
                    redirect = "/pages/accounts/administrators/update_admin.jsp";
                } else {
                    redirect = "/admin/main?result" + false + "&message" + URLEncoder.encode("", StandardCharsets.UTF_8);
                }
                break;*/
            case "/admin/administrators":
                List<Admin> admins = new DaoAdmin().findAll();
                req.setAttribute("admins", admins);
                System.out.println("Datos de la Vista"+admins);


                redirect = "/pages/administrators/administrators_admin.jsp";
                break;
            case "/admin/main-organ":
                List<Organ> organs = new DaoOrgan().findAll();
                req.setAttribute("organs", organs);
                System.out.println("Datos de la Vista"+organs);
                redirect = "/pages/administrators/administrators_organization.jsp";
                break;
            case "/admin/main-volunt":
                List<Volunteer> volunteers = new DaoVolunteer().findAll();
                req.setAttribute("volunteers", volunteers);
                System.out.println("Datos de la Vista"+volunteers);

                redirect = "/pages/administrators/administrators_volun.jsp";
                break;
            case   "/admin/surveys":
                redirect = "/pages/administrators/administrators_surveys.jsp";
                break;
            case   "/admin/stadist":
                redirect = "/pages/administrators/administrators_stadist.jsp";
                break;
            case   "/admin/aprobe":
                List<Volunteer> volunteer = new DaoVolunteer().findAllActive();
                req.setAttribute("volunteer", volunteer);
                System.out.println("Datos de la Vista"+volunteer);
                redirect = "/pages/administrators/administrators_aprob.jsp";
                break;

            case   "/admin/porfile":
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("user");
                admin = new DaoAdmin().findOneByUser(user.getId_user());
                System.out.println(admin);
                if (admin != null) {
                   req.setAttribute("admin",admin);

                   redirect =  "/pages/administrators/administrator_porfile.jsp";
                } else {
                    redirect = "/admin/main";
                }
                break;



            default:
                System.out.println(action);
        }
        req.getRequestDispatcher(redirect).forward(req, resp);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        action = req.getServletPath();

        switch (action) {
            case "/admin/save":
                email = req.getParameter("email");
                password = req.getParameter("password");
                name = req.getParameter("name");
                User user = new User();
                user.setEmail(email);
                user.setPassword(password);
                user.setStatus(false);

                Admin admin =new Admin();
                admin.setId_admin(0L);
                admin.setName(name);
                admin.setUser(user);

                admin.setRole(new Role(1, ""));
                if (new DaoAdmin().save(admin)) {
                    redirect = "/index.jsp?result=true&message=" + URLEncoder.encode("Administrador guardado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/index.jsp?result=false&message=" + URLEncoder.encode("No se pudo guardar el administrador", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/update":
                id_admin = req.getParameter("id_admin");
                name=req.getParameter("name");
                email = req.getParameter("email");
                password = req.getParameter("password");
                System.out.println(id_admin + " " + email + " " + password);

                Admin admin1=new Admin();
                admin1.setId_admin(Long.valueOf(id_admin));
                admin1.setName(name);

                User user1 = new User();
                user1.setEmail(email);
                user1.setPassword(password);
                admin1.setUser(user1);
                try {
                    // Guardar el objeto "Organ" en la base de datos
                    if (new DaoAdmin().update(admin1)) {
                        redirect = "/admin/main?result=" + true + "&message=" + URLEncoder.encode("Administrador actualizado correctamente", StandardCharsets.UTF_8);
                    } else {

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/admin/porfile?result=" + false + "&message=" + URLEncoder.encode("No se pudo actualizar el administrador", StandardCharsets.UTF_8);                }
                break;

           /* case "/admin/delete":
                id = request.getParameter("id");
                if (new DaoAdmin().delete(Long.parseLong(id))) {
                    redirect = "/admin/main?result=" + true + "&message=" + URLEncoder.encode("Administrador eliminado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result=" + false + "&message=" + URLEncoder.encode("No se pudo eliminar el administrador", StandardCharsets.UTF_8);
                }
                redirect = "/admin/admins";
                break;

                /*case "/admin/users":
                    DaoAdmin daoAdmin = new DaoAdmin();
                    int totalUsersCount = daoAdmin.getTotalUsersCount();
                    request.setAttribute("totalUsersCount", totalUsersCount);
                    break;

                 */


            default:
                redirect = "/admin/admins";
        }
        resp.sendRedirect(req.getContextPath() + redirect);

    }
}

package mx.edu.utez.voluntariapp_final.controllers.users;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.user.DaoUser;
import mx.edu.utez.voluntariapp_final.models.user.User;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;

import static java.lang.Long.parseLong;

@WebServlet(name = "users",urlPatterns = {
        "/user/login",
        "/user/main",
        "/user/main-admin",
        "/user/main-organ",
        "/user/main-volun",
        "/user/main-surveys",
        "/user/main-stadist",
        "/user/main-aprob",
        "/user/main-porfile",
        "/user/role",
        "/user/role-save-admin",
        //Redirecciones de Usuarios

        /*Redirecciones de los Logins*/

        "/create-accounts/administrators",
        "/create-accounts/organizations",
        "/create-accounts/volunteers",
        "/user/save",
        "/user/save-view",
        "/user/user-view-update",
        "/user/update",
        "/user/delete"
})

public class ServletUser extends HttpServlet {

    public String action;
    private String redirect = "/user/main";
    private User user;
    HttpSession session;
    private String id_role;
    private String email,password;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        action = req.getServletPath();
        switch (action){
            /*      =====       Redirecciones de la pagina      =======          */
            case "/user/main": //redirigir al inicio
                redirect = "/pages/administrators/index_admin.jsp";
                break;
            case "/user/main-admin":
                redirect = "/pages/administrators/administrators_admin.jsp";
                break;
            case "/user/main-organ":
                redirect = "/pages/administrators/administrators_organization.jsp";
                break;
            case "/user/main-volun":
                redirect = "/pages/administrators/administrators_volun.jsp";
                break;
            case "/user/main-surveys":
                redirect = "/pages/administrators/administrators_surveys.jsp";
                break;
            case "/user/main-stadist":
                redirect = "/pages/administrators/administrators_stadist.jsp";
                break;
            case "/user/main-aprob":
                redirect = "/pages/administrators/administrators_aprob.jsp";
                break;
            case "/user/main-porfile":
                redirect = "/pages/administrators/administrator_porfile.jsp";
                break;
            /*      =====      Fin Redirecciones de la pagina      =======          */
            case "/user/save-view":
                redirect = "/pages/create_administrator_account.jsp";
                break;
            case "/user/login":
                redirect = "/index.jsp";
                break;
            case "/user/role": //redirigir al inicio
                redirect = "/pages/register_login.jsp";
                break;
            case "/user/role-save-admin": //redirigir al inicio
                req.setAttribute("roles",new DaoUser().searchRole());
                redirect = "/pages/create_administrator_account.jsp";
                break;
        }
        req.getRequestDispatcher(redirect).forward(req, resp);
    }
    /*Termina el metodo DOGET*/

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        action = req.getServletPath();



        switch (action){
            case "/user/main":
                email = req.getParameter("email");
                password = req.getParameter("password");
                System.out.println(email+password);
                try {
                    user = new DaoUser().loadUserByEmailandPassword(email, password);
                    if (user != null) {
                        session = req.getSession();
                        session.setAttribute("user", user);
                        switch (user.getDescription().getDescription()) {
                            case "ADMIN":
                                redirect = "/admin/main";
                                break;
                            case "ORGANIZATION":
                                redirect = "/organ/main";
                                break;
                            case "VOLUNTEER":
                                redirect = "/volunteer/main";
                                break;
                        }
                    } else {
                        throw new Exception("Credentials mismatch");
                    }
                } catch (Exception e) {
                    redirect = "/user/login?result=false&message=" + URLEncoder
                            .encode("Email y/o contraseña incorrecta",
                                    StandardCharsets.UTF_8);
                }
                break;
            case "/user/login":
                // Código para cerrar sesión
                req.getSession().invalidate();
                // Redirigir al usuario a la página de inicio de sesión
                redirect = "/index.jsp";
                break;



            case "/user/save":
                email = req.getParameter("email");
                password = req.getParameter("password");

                id_role = req.getParameter("roleId");
                Role role = new Role();
                role.setId(Integer.parseInt(id_role));

                User user1 = new User(0L, email, password,"0", role);
                boolean result = false;
                try {
                    result = new DaoUser().save(user1);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                if (result) {
                    redirect = "/user/users?result= " + result + "&message=" + URLEncoder.encode("!Éxito! Usuario registrado correctamente.", StandardCharsets.UTF_8);
                } else {
                    redirect = "user/users?result= " + result + "&message=" + URLEncoder.encode("!No Éxito! Usuario no registrado correctamente.", StandardCharsets.UTF_8);
                }
                break;
        }
        resp.sendRedirect(req.getContextPath()
                + redirect);
    }
}

package mx.edu.utez.voluntariapp_final.controllers.volunteer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import mx.edu.utez.voluntariapp_final.models.Role.Role;

import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.models.volunteer.DaoVolunteer;
import mx.edu.utez.voluntariapp_final.models.volunteer.Volunteer;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

@WebServlet(name = "volunteers ", urlPatterns = {

        "/volunteer/register",
        "/volunteer/main",
        "/volunteer/volunteer-view",
        "/volunteer/save",
        "/volunteer/volunteer-view-update",
        "/volunteer/update",
        "/volunteer/delete",

        /*Redirecciones de los Voluntarios*/
        "/volunteer/events",
        "/volunteer/forms",
        "/volunteer/porfile",
        "/volunteer/postulates"

})
public class ServletVolun extends HttpServlet {
    private String action;
    private String redirect = "/volunteer/main";
    private String email, password, id, name, surname, lastanme, birthday, address, phone, curp;
    private Volunteer volunteer;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        action = req.getServletPath();
        switch (action) {
            case "/volunteer/main":
                redirect = "/pages/volunteers/index_volunt.jsp";
                break;
            /*Redirecciones de Voluntarios*/
            case "/volunteer/events":
                redirect = "/pages/volunteers/volunteer_events.jsp";
                break;
            case "/volunteer/forms":
                redirect = "/pages/volunteers/volunteer_forms.jsp";
                break;
            case "/volunteer/postulates":
                redirect = "/pages/volunteers/volunteer_postulates.jsp";
                break;
           /* case "/volunteer/volunteer-view-update":
                id = req.getParameter("id");
                volunteer = new DaoVolunteer().findOne(
                        id != null ? Long.parseLong(id) : 0
                );
                if (volunteer != null) {
                    req.setAttribute("volunteer", volunteer);
                    redirect = "/views/volunteer/volunteer_profile.jsp";
                } else {
                    redirect = "/volunteer/profile?result" + false +
                            "&message=" +
                            URLEncoder.encode("Recurso no encontrado", StandardCharsets.UTF_8);
                }
                break;*/
            case "/volunteer/porfile":
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("user");
                volunteer = new DaoVolunteer().findOneByUser(user.getId_user());
                System.out.println(volunteer);
                if (volunteer != null) {
                    req.setAttribute("volunteer", volunteer);
                    redirect = "/pages/volunteers/volunteer_porfile.jsp";
                } else {
                    redirect = "/volunteer/main";
                }
                break;

            default:
                System.out.println(action);
        }
        req.getRequestDispatcher(redirect).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = req.getServletPath();
        switch (action) {
            //case "/volunteer/volunteer-view-update":
            //  id = req.getParameter("id");
            //volunteer = new DaoVolunteer().findOne(
            //      id != null ? Long.parseLong(id) : 0
            //);
            //if (volunteer != null) {
            //   req.setAttribute("volunteer", volunteer);
            //  redirect = "/views/volunteer/volunteer_profile.jsp";
            //} else {
            //  redirect = "/volunteer/porfile?result" + false +
            //        "&message=" +
            //      URLEncoder.encode("Recurso no encontrado", StandardCharsets.UTF_8);
            //}
            //break;
            case "/volunteer/save":
                // Obtener los valores de los parámetros del formulario
                email = req.getParameter("email");
                password = req.getParameter("password");
                name = req.getParameter("name");
                surname = req.getParameter("surname");
                lastanme = req.getParameter("lastanme");
                birthday = req.getParameter("birthday");
                address = req.getParameter("address");
                phone = req.getParameter("phone");
                curp = req.getParameter("curp");

                // Crear y configurar el objeto "User"
                User user1 = new User();
                user1.setEmail(email);
                user1.setPassword(password);
                user1.setStatus(false);
                // Crear y configurar el objeto "Voluntario"S
                Volunteer volunteer1 = new Volunteer();
                volunteer1.setId(0L);
                volunteer1.setName(name);
                volunteer1.setSurname(surname);
                volunteer1.setLastanme(lastanme);
                volunteer1.setBirthday(birthday);
                volunteer1.setAddress(address);
                volunteer1.setPhone(phone);
                volunteer1.setCurp(curp);
                volunteer1.setUser(user1);
                // Configurar el rol (asumiendo que 3 es el ID del rol para voluntarios)
                volunteer1.setRole(new Role(3, ""));
                try {
                    // Guardar el objeto "Volunteer" en la base de datos
                    if (new DaoVolunteer().save(volunteer1)) {
                        redirect = "/index.jsp?result=true&message=" + URLEncoder.encode("Voluntario guardado correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/index.jsp?result=false&message=" + URLEncoder.encode("No se pudo guardar el voluntario", StandardCharsets.UTF_8);
                }
                break;
            case "/volunteer/update":

                    // Obtener los valores de los parámetros del formulario
                    id = req.getParameter("id");
                    address = req.getParameter("address");
                    phone = req.getParameter("phone");
                    email = req.getParameter("email");
                    password = req.getParameter("password");
                    System.out.println(id + address + phone + email + password);
                    // Crear y configurar el objeto "Voluntario"
                    Volunteer volunteer = new Volunteer();
                    volunteer.setId(Long.valueOf(id));
                    volunteer.setAddress(address);
                    volunteer.setPhone(phone);
                    // Crear y configurar el objeto "User"
                    User user = new User();
                    user.setEmail(email);
                    user.setPassword(password);
                    volunteer.setUser(user);
                try {
                    if (new DaoVolunteer().update(volunteer))
                        redirect = "/volunteer/main?result=false&message=" + URLEncoder.encode("¡Error! Acción no realizada correctamente.", StandardCharsets.UTF_8);
                    else{

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/volunteer/porfile?result=false&message=" + URLEncoder.encode("No se pudo guardar la organización", StandardCharsets.UTF_8);
                }
                break;

            default:
                redirect = "/volunteer/main";

        }

        response.sendRedirect(req.getContextPath() + redirect);
    }


}

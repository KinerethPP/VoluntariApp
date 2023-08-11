package mx.edu.utez.voluntariapp_final.controllers.organization;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.organization.DaoEvent;
import mx.edu.utez.voluntariapp_final.models.organization.DaoOrgan;
import mx.edu.utez.voluntariapp_final.models.organization.Event;
import mx.edu.utez.voluntariapp_final.models.organization.Organ;
import mx.edu.utez.voluntariapp_final.models.user.User;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet(name = "organs", urlPatterns = {
        "/organ/main",
        "/organ/register",
        "/organ/organ",
        "/organ/organ-view",
        "/organ/save",
        "/organ/organ-view-update",
        "/organ/update",
        "/organ/delete",
        "/event/events",

        /*Redirecciones de Organizaciones*/
        "/organ/events",
        "/organ/surveys",
        "/organ/postulations",
        "/organ/aprob",
        "/organ/porfile",

        /*======================================*/
        /*Redirecciones del Formulario y Eventos*/
        "/organ/create_event",                   /*Campos Temporales*/
        "/organ/create_forms"
        /*======================================*/


})
public class ServletOrgan extends HttpServlet {
    private String action;
    private String redirect = "/organ/main";

    private String email;
    private String password;
    private boolean Active;

    private String id;
    private String bussines_name;
    private String street;
    private String cologne;
    private String postal_code;
    private String municipality;
    private String state;
    private String rfc;
    private String phone;


    private Organ organ;
    private Event event;



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action = request.getServletPath();
        switch (action) {
            case "/organ/main":
                //List<Admin> admins = new DaoAdmin().findAll();
                // request.setAttribute("organs", admins);
                redirect = "/pages/organizations/index_organ.jsp";
                break;
            /*Redirecciones del Organizador*/
           case "/organ/events":
                redirect = "/pages/organizations/organizations_events.jsp";
                break;
            case "/organ/surveys":
                redirect = "/pages/organizations/organizations_surveys.jsp";
                break;
            case "/organ/postulations":
                redirect = "/pages/organizations/organizations_postulates.jsp";
                break;
            case "/organ/aprob":
                redirect = "/pages/organizations/organizations_aprob.jsp";
                break;
            case "/organ/porfile":
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                organ = new DaoOrgan().findOneByUser(user.getId_user());
                System.out.println(organ);
                if (organ != null) {
                    request.setAttribute("organ", organ);
                    redirect = "/pages/organizations/organizations_porfile.jsp";
                } else {
                    redirect = "/organ/main";
                }
                break;
            case "/organ/organ-view":
                redirect = "/pages/accounts/organization.jsp";
                break;
            case "/organ/organ-view-update":
                id = request.getParameter("id");
                organ = new DaoOrgan().findOne(id != null ? Long.parseLong(id) : 0);
                if (organ != null) {
                    request.setAttribute("organ", organ);
                    redirect = "/pages/accounts/organizations/update_organ.jsp";
                } else {
                    redirect = "/organ/organs?result" + false + "&message" + URLEncoder.encode("", StandardCharsets.UTF_8);
                }
                break;
                /*===================================*/
                   /*Eventos*/
            case "/event/events":
                List<Event> events = new DaoEvent().findAll();
                request.setAttribute("event", events);
                redirect="/organ/events";

                break;

            /*====================================================*/
            /*Redirecciones del Formulario y Eventos*/
            case "/organ/create_event":
                redirect = "/pages/organizations/create_event.jsp";
                break;
            case "/organ/create_forms":
                redirect = "/pages/organizations/create_forms.jsp";
                break;
            /*=====================================================*/
            default:
                System.out.println(action);
        }
        request.getRequestDispatcher(redirect).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = request.getServletPath();
        switch (action) {
           /* case "/organ/organ-view-update":
                id = request.getParameter("id");
                Admin admin = new DaoAdmin().findOne(id != null ? Long.parseLong(id) : 0);
                if (admin != null) {
                    request.setAttribute("organ", organ);
                    redirect = "/pages/organizations/update_organ.jsp";
                } else {
                    redirect = "/organ/organs?result" + false + "&message" + URLEncoder.encode("", StandardCharsets.UTF_8);
                }
                break;*/
            case "/organ/save":
                // Obtener los valores de los parámetros del formulario
                email = request.getParameter("email");
                password = request.getParameter("password");
                bussines_name = request.getParameter("bussines_name");
                street = request.getParameter("street");
                cologne = request.getParameter("cologne");
                postal_code = request.getParameter("postal_code");
                municipality = request.getParameter("municipality");
                state = request.getParameter("state");
                rfc = request.getParameter("rfc");
                phone = request.getParameter("phone");
                // Crear y configurar el objeto "User"
                User user1 = new User();
                user1.setEmail(email);
                user1.setPassword(password);
                user1.setStatus(false);
                // Crear y configurar el objeto "Organ"
                Organ organ1 = new Organ();
                organ1.setId(0L);
                organ1.setBussines_name(bussines_name);
                organ1.setStreet(street);
                organ1.setCologne(cologne);
                organ1.setPostal_code(postal_code);
                organ1.setMunicipality(municipality);
                organ1.setState(state);
                organ1.setRfc(rfc);
                organ1.setPhone(phone);
                organ1.setUser(user1);
                // Configurar el rol (asumiendo que 2 es el ID del rol para organizaciones)
                organ1.setRole(new Role(2, ""));
                try {
                    // Guardar el objeto "Organ" en la base de datos
                    if (new DaoOrgan().save(organ1)) {
                        redirect = "/organ/main?result=true&message=" + URLEncoder.encode("Organizacion guardada correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/organ/porfile?result=false&message=" + URLEncoder.encode("No se pudo guardar la organización", StandardCharsets.UTF_8);
                }
                break;
            case "/organ/update":
                    // Obtener los valores de los parámetros del formulario
                    id = request.getParameter("id");
                    bussines_name = request.getParameter("bussines_name");
                    municipality = request.getParameter("municipality");
                    state = request.getParameter("state");
                    postal_code = request.getParameter("postal_code");
                    cologne = request.getParameter("cologne");
                    street = request.getParameter("street");
                    phone = request.getParameter("phone");
                    email=request.getParameter("email");
                    password=request.getParameter("password");
                    System.out.println(id + bussines_name+street+cologne+postal_code+municipality+state + phone + email + password);
                    // Crear y configurar el objeto "Voluntario"
                    Organ organ = new Organ();
                    organ.setId(Long.valueOf(id));
                    organ.setBussines_name(bussines_name);
                    organ.setMunicipality(municipality);
                    organ.setState(state);
                    organ.setPostal_code(postal_code);
                    organ.setCologne(cologne);
                    organ.setStreet(street);
                    organ.setPhone(phone);

                    // Crear y configurar el objeto "User"
                    User user = new User();
                    user.setEmail(email);
                    user.setPassword(password);
                    organ.setUser(user);
                    try {
                        // Guardar el objeto "Organ" en la base de datos
                        if (new DaoOrgan().update(organ)) {
                            redirect = "/organ/main?result=true&message=" + URLEncoder.encode("Organizacion guardada correctamente", StandardCharsets.UTF_8);
                        } else {

                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        redirect = "/organ/porfile?result=false&message=" + URLEncoder.encode("No se pudo guardar la organización", StandardCharsets.UTF_8);
                    }
                    break;
           /* case "/organ/delete":
                id = request.getParameter("id");
                if (new DaoAdmin().delete(Long.parseLong(id))) {
                    redirect = "/organ/organs?result=" + true + "&message=" + URLEncoder.encode("Administrador eliminado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/organ/organs?result=" + false + "&message=" + URLEncoder.encode("No se pudo eliminar el administrador", StandardCharsets.UTF_8);
                }
                redirect = "/organ/organs";
                break;*/
            default:
                redirect = "/organ/organs";
        }
        response.sendRedirect(request.getContextPath() + redirect);
    }
}

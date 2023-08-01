package mx.edu.utez.voluntariapp_final.controllers.volunteer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.voluntariapp_final.models.Role.Role;

import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.models.volunteer.DaoVolunteer;
import mx.edu.utez.voluntariapp_final.models.volunteer.Volunteer;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

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

    private String email;
    private String password;

    private String id;
    private String name;
    private String surname;
    private String lastanme;
    private String  birthday ;
    private String address;
    private String phone;
    private String curp;


    private Volunteer volunteer;



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        action = req.getServletPath();
        switch (action){
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
            case "/volunteer/porfile":
                redirect = "/pages/volunteers/volunteer_porfile.jsp";
                /*id = req.getParameter("id");
                volunteer = new DaoVolunteer().findOne(
                        id != null ? Long.parseLong(id) : 0
                );
                if (volunteer != null) {
                    req.setAttribute("volunteer", volunteer);
                    redirect = "/pages/volunteers/volunteer_porfile.jsp";
                } else {
                    redirect = "/volunteer/porfile?result" + false +
                            "&message=" +
                            URLEncoder.encode("Recurso no encontrado", StandardCharsets.UTF_8);
                }

                id = req.getParameter("id");
                volunteer = new DaoVolunteer().findOne(
                        id != null ? Long.parseLong(id) : 0);
                if(volunteer != null){
                    req.setAttribute("volunteer", volunteer);
                    redirect = "/pages/volunteers/volunteer_porfile.jsp";
                }else{
                    redirect = "/user/user?result" + false + "&message=" + URLEncoder.encode("",StandardCharsets.UTF_8);
     }*/

                break;
            case "/volunteer/postulates":
                redirect = "/pages/volunteers/volunteer_postulates.jsp";
                break;
            case "/volunteer/volunteer-view-update":
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
                break;


            default:
                System.out.println(action);



        }

        req.getRequestDispatcher(redirect).forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = request.getServletPath();
        switch (action) {
            case "/volunteer/volunteer-view-update":
                id = request.getParameter("id");
                volunteer = new DaoVolunteer().findOne(
                        id != null ? Long.parseLong(id) : 0
                );
                if (volunteer != null) {
                    request.setAttribute("volunteer", volunteer);
                    redirect = "/views/volunteer/volunteer_profile.jsp";
                } else {
                    redirect = "/volunteer/profile?result" + false +
                            "&message=" +
                            URLEncoder.encode("Recurso no encontrado", StandardCharsets.UTF_8);
                }
                break;




            case  "/volunteer/save":
                // Obtener los valores de los parámetros del formulario
                email = request.getParameter("email");
                password = request.getParameter("password");
                name = request.getParameter("name");
                surname = request.getParameter("surname");
                lastanme = request.getParameter("lastanme");
                birthday = request.getParameter("birthday");
                address = request.getParameter("address");
                phone = request.getParameter("phone");
                curp= request.getParameter("curp");

                // Crear y configurar el objeto "User"
                User user1 = new User();
                user1.setEmail(email);
                user1.setPassword(password);
                user1.setStatus(false);
                // Crear y configurar el objeto "Voluntario"
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
                    if (new DaoVolunteer().save( volunteer1)) {
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
                id = request.getParameter("id");
                email = request.getParameter("email");
                password=request.getParameter("password");
                phone=request.getParameter("phone");

                volunteer = new Volunteer(Long.parseLong(id), email,password,phone);
                if (new DaoVolunteer().update(volunteer))
                    redirect = "/volunteer/porfile?result= " + true
                            + "&message="
                            + URLEncoder.encode("¡Éxito! Voluntario actualizado correctamente.", StandardCharsets.UTF_8);
                else
                    redirect = "/volunteer/porfile?result= "
                            + false + "&message="
                            + URLEncoder.encode("¡Error! Acción no realizada correctamente.", StandardCharsets.UTF_8);
                break;

            case "/user/delete":
                id = request.getParameter("id");
                if (new DaoVolunteer().delete(Long.parseLong(id)))
                    redirect = "/user/users?result= " + true
                            + "&message="
                            + URLEncoder.encode("¡Éxito! Usuario eliminado correctamente.",
                            StandardCharsets.UTF_8);
                else
                    redirect = "/user/users?result= "
                            + false + "&message="
                            + URLEncoder.encode("¡Error! Acción no realizada correctamente.",
                            StandardCharsets.UTF_8);
                break;
            default:
                redirect = "/user/users";
        }
        response.sendRedirect(request.getContextPath() + redirect);
    }


}

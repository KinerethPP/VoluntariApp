package mx.edu.utez.voluntariapp_final.controllers.organization;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.voluntariapp_final.models.organization.DaoEvent;
import mx.edu.utez.voluntariapp_final.models.organization.Event;
import mx.edu.utez.voluntariapp_final.models.organization.Organ;
import mx.edu.utez.voluntariapp_final.models.user.User;

import java.io.IOException;


@WebServlet(name = "events", urlPatterns = {
//        "/organ/create_event",
        "/event/save",
        "/event/all",
        "/event/porfile",
        //"/event/events"

})
public class ServletEvent extends HttpServlet {
    private String action;
    private String redirect = "/event/main";
    private String id;
    private String name;
    private String event_date;
    private String description;
    private String street;
    private String cologne;
    private String postal_code;
    private String municipality,state,user_id,category,organ_id;
    private String event_time;

    private Event event;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getServletPath();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        switch (action) {
            default:
                System.out.println(action);
        }
        request.getRequestDispatcher(redirect).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = request.getServletPath();
        switch (action) {

             /*case "/organ/organ-view-update":
                id = request.getParameter("id");
                Event event = new DaoEvent().findOne(id != null ? Long.parseLong(id) : 0);
                if (event != null) {
                    request.setAttribute("event", event);
                    redirect = "/pages/organizations/update_organ.jsp";
                } else {
                    redirect = "/organ/organs?result" + false + "&message" + URLEncoder.encode("", StandardCharsets.UTF_8);
                }
                break;*/
            case "/event/save":
                // Obtener los valores de los parámetros del formulario
                name = request.getParameter("name");
                event_date = request.getParameter("event_day");
                event_time = request.getParameter("event_time");
                description = request.getParameter("description");
                street = request.getParameter("street");
                cologne = request.getParameter("cologne");
                postal_code = request.getParameter("postal_code");
                municipality = request.getParameter("municipality");
                state=request.getParameter("state");
                category=request.getParameter("category");
                //System.out.println(category);
                user_id=request.getParameter("user_id");
                organ_id=request.getParameter("organ_id");

                //System.out.println(organ_id);
                System.out.println(name+"|"+event_date+"|"+event_time+"|"+description+"|"+street+"|"+cologne+
                        "|"+postal_code+"|"+municipality+"|"+state+"|"+category+"|"+user_id+"|"+organ_id+"|");


                // Crear y configurar el objeto "Organ"
                Event event = new Event();
               // event.setId(0L);
                event.setName(name);
                event.setEvent_date(event_date);
                event.setEvent_time(event_time);
                event.setDescription(description);
                event.setStreet(street);
                event.setCologne(cologne);
                event.setPostal_code(postal_code);
                event.setMunicipality(municipality);
                event.setState(state);
                event.setCategory(category);
                event.setStatus(false);

                User user  =new User();
                user.setId_user(Long.valueOf(user_id));
                event.setUser(user);
                System.out.println(event.getUser().getId_user());

                Organ organ =new Organ();
                organ.setId(Long.valueOf(organ_id));
                event.setOrgan(organ);
                System.out.println(event.getOrgan().getId());



                // Configurar el rol (asumiendo que 2 es el ID del rol para organizaciones)
                try {
                    // Guardar el objeto "Evento" en la base de datos
                    if (new DaoEvent().save(event)) {
                        // Redirigir con mensaje de éxito
                        response.sendRedirect("/event/events?result=true&message=Evento%20guardado%20correctamente");
                    } else {

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    // Redirigir con mensaje de error
                    response.sendRedirect("/organ/main?result=false&message=No%20se%20pudo%20guardar%20el%20evento");
                }
                break;
            case "/event/update":

                break;

        }
    }
}
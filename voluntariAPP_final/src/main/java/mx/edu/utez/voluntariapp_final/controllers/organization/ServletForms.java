package mx.edu.utez.voluntariapp_final.controllers.organization;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.voluntariapp_final.models.organization.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet(name = "forms", urlPatterns = {
        "/forms/create-question",
        "/forms/create-answer",
        "/forms/save",
        "/forms/save-question"
})
public class ServletForms extends HttpServlet {
    private String action;
    private String redirect = "/forms/create-question";
    private String id;
    private String name_form;
    private String instructions;
    private String event_id, organ_id;
    private Forms forms;
    private  Question question;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        action = req.getServletPath();
        req.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");

        switch (action) {
            case "/forms/create-question":
                //Recuperar el id
                id=req.getParameter("id");
                req.setAttribute("id", id);

                System.out.println("dentro del caso para la creacion de preguntas");
                redirect = "/pages/organizations/create_question.jsp";
                break;
           /* case "/forms/view-forms":
                redirect = "/pages/organizations/create_answer.jsp";
                break;*/
            default:
                System.out.println(action);
        }
        req.getRequestDispatcher(redirect).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = request.getServletPath();
        switch (action) {
            case "/forms/save":
                // Obtener los valores de los parámetros del formulario
                name_form = request.getParameter("name");
                instructions = request.getParameter("description");
                event_id = request.getParameter("eventId");
                organ_id = request.getParameter("organ_id");
                Forms forms = new Forms();
                forms.setId_forms(0L);
                forms.setName_form(name_form);
                forms.setInstructions(instructions);
                forms.setEvent_id(event_id);
                Event event = new Event();
                event.setOrganization_id(organ_id);
                forms.setEvent(event);
                // Configurar el rol (asumiendo que 2 es el ID del rol para organizaciones)
                try {
                    // Guardar el objeto "Evento" en la base de datos
                    if (new DaoForms().save(forms)) {
                        // Redirigir con mensaje de éxito
                        redirect = "/organ/surveys?result=true&message=" + URLEncoder.encode("Formulario rehistrado correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    // Redirigir con mensaje de error
                    redirect = "/organ/surveys?result=false&message=" + URLEncoder.encode("Ocurrió un error", StandardCharsets.UTF_8);
                }
                break;




        }
        response.sendRedirect(request.getContextPath() + redirect);
    }

}

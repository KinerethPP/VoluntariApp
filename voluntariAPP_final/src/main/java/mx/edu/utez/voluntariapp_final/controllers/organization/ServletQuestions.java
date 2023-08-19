package mx.edu.utez.voluntariapp_final.controllers.organization;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.voluntariapp_final.models.organization.*;
import mx.edu.utez.voluntariapp_final.models.user.User;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet
        (name = "question", urlPatterns = {
                "/questions/create-answer",
                "/questions/create-question",
                "/questions/save",
                "/question"


        })
public class ServletQuestions extends HttpServlet {
    private String action;
    private String redirect = "/questions";

    private String id_form,question,form_id;
    private Forms forms;
    private Question question1;
    private String id_question,answer1,answer2,answer3,questio_id,form_id_ans;

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


            case  "/questions/save":
                System.out.println("Bienvenido a tu lado servlt");
                question=request.getParameter("question");
                form_id=request.getParameter("formId");
                answer1=request.getParameter("answer1");
                answer2=request.getParameter("answer2");
                answer3=request.getParameter("answer3");
                System.out.println("Pregunta"+question+"id"+id_form+"answer1"+answer1+"answer2"+answer2+"answer3"+answer3);


                Question quest =new Question();
                quest.setId_question(0L);
                quest.setQuestion(question);
                quest.setForm_id(form_id);
                Answer ans =new Answer();
                ans.setId_answer(0L);
                ans.setAnswer1(answer1);
                ans.setAnswer2(answer2);
                ans.setAnswer3(answer3);
                quest.setAnswer(ans);

            try {
                // Guardar el objeto "Evento" en la base de datos
                if (new DaoQuestion().saveQuestions(quest)){
                    // Redirigir con mensaje de éxito
                    redirect = "/organ/surveys?result=true&message=" + URLEncoder.encode("Pregunta correctamente", StandardCharsets.UTF_8);
                } else {

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

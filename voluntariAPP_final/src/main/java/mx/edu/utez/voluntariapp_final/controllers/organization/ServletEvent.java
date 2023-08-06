package mx.edu.utez.voluntariapp_final.controllers.organization;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jdk.jfr.Event;

import java.io.IOException;


@WebServlet (name = "events", urlPatterns = {
//        "/organ/create_event",
//        "/organ/create_forms"
})

public class ServletEvent extends HttpServlet {
    private String action;
    private String redirect = "/organ/main";
    /*Declarar variables del evento*/
    private Event event;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        action = req.getServletPath();
        switch (action){
//            case "/organ/create_event":
//                redirect = "/pages/organizations/create_event.jsp";
//                break;
//            case "/organ/create_forms":
//                redirect = "/pages/organizations/create_forms.jsp";
//                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

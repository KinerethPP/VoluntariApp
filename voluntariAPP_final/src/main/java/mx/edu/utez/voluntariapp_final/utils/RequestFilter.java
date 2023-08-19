package mx.edu.utez.voluntariapp_final.utils;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter(urlPatterns = {"/*"})
public class RequestFilter implements Filter {

    List<String> whiteList = new ArrayList<>();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //Endpoints publicos
        whiteList.add("/user/main");//Redirecciona a index.jsp de inicio de sesión
        whiteList.add("/admin/register");//Redirecciona a index.jsp de inicio de sesión
        whiteList.add("/user/role");//Redirecciona al Registro de opciones
        whiteList.add("/user/save-view"); //redirecciona a la vista del formulario de administrador admin.jsp
        whiteList.add("/organ/organ-view");//Redirecciona a la vista del formulario de Organizaciones Organization.jsp
        whiteList.add("/pages/accounts/volunteer.jsp"); //Redirecciona añl formulario de Voluntarios Volunter.jsp
        whiteList.add("/pages/accounts/admin.jsp");
        whiteList.add("/pages/accounts/organization.jsp");
        whiteList.add("/admin/save");//Metodo de Registro de un nuevo usuario admin
        whiteList.add("/organ/save");//Metodo de Registiro de Organizacion.
        whiteList.add("/volunteer/save");//Metodo de Registro de Voluntario..
        whiteList.add("/api/auth/login");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String action = request.getServletPath();
        if (action.contains("/assets")) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            if (whiteList.contains(action)) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                HttpSession session = request.getSession();
                if (session.getAttribute("user") != null) {
                    filterChain.doFilter(servletRequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/user/main");
                }
            }
        }
    }

    @Override
    public void destroy() {

    }
}


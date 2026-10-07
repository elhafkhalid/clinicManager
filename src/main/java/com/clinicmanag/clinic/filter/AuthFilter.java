package com.clinicmanag.clinic.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*", "/doctor/*", "/patient/*", "/staff/*"})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  request  = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String contextPath = request.getContextPath();
        String uri = request.getRequestURI().substring(contextPath.length());

        HttpSession session = request.getSession(false);

        // 1. Pas de session → rediriger vers login
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(contextPath + "/login");
            return;
        }

        String role = (String) session.getAttribute("role");

        // 2. Vérifier le rôle selon la zone
        boolean autorise = false;

        if (uri.startsWith("/admin/")) {
            autorise = "Admin".equals(role);
        } else if (uri.startsWith("/doctor/")) {
            autorise = "Doctor".equals(role);
        } else if (uri.startsWith("/patient/")) {
            autorise = "Patient".equals(role);
        } else if (uri.startsWith("/staff/")) {
            autorise = "Staff".equals(role);
        }

        if (autorise) {
            chain.doFilter(req, resp);
        } else {
            response.sendRedirect(contextPath + "/login");
        }
    }
}
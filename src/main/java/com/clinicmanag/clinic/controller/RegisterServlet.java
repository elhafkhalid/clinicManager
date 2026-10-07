package com.clinicmanag.clinic.controller;

import com.clinicmanag.clinic.dto.RegisterDTO;
import com.clinicmanag.clinic.exception.BusinessException;
import com.clinicmanag.clinic.service.AuthService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String nom = req.getParameter("nom");
        String email = req.getParameter("email");
        String motDePasse = req.getParameter("motDePasse");
        String cin = req.getParameter("cin");

        try {
            RegisterDTO dto = new RegisterDTO(nom, email, motDePasse, cin);
            authService.register(dto);

            req.getSession().setAttribute("success", "Compte créé avec succès. Connectez-vous.");
            resp.sendRedirect(req.getContextPath() + "/login");

        } catch (BusinessException e) {
            req.setAttribute("error", e.getMessage());
            req.setAttribute("nom", nom);
            req.setAttribute("email", email);
            req.setAttribute("cin", cin);
            req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
        }
    }
}
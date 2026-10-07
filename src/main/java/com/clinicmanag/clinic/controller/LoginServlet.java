package com.clinicmanag.clinic.controller;

import com.clinicmanag.clinic.dto.LoginDTO;
import com.clinicmanag.clinic.exception.BusinessException;
import com.clinicmanag.clinic.model.Admin;
import com.clinicmanag.clinic.model.Doctor;
import com.clinicmanag.clinic.model.Patient;
import com.clinicmanag.clinic.model.Staff;
import com.clinicmanag.clinic.model.User;
import com.clinicmanag.clinic.service.AuthService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String motDePasse = req.getParameter("motDePasse");

        try {
            LoginDTO dto = new LoginDTO(email, motDePasse);
            User user = authService.login(dto);

            HttpSession session = req.getSession(true);

            session.setAttribute("userId", user.getId());
            session.setAttribute("userNom", user.getNom());
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("role", user.getClass().getSimpleName());

            redirectByRole(user, req, resp);

        } catch (BusinessException e) {
            req.setAttribute("error", e.getMessage());
            req.setAttribute("email", email);
            req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
        }
    }

    private void redirectByRole(User user, HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String ctx = req.getContextPath();
        if (user instanceof Patient) {
            resp.sendRedirect(ctx + "/patient/dashboard");
        } else if (user instanceof Doctor) {
            resp.sendRedirect(ctx + "/doctor/dashboard");
        } else if (user instanceof Admin) {
            resp.sendRedirect(ctx + "/admin/dashboard");
        } else if (user instanceof Staff) {
            resp.sendRedirect(ctx + "/staff/dashboard");
        } else {
            resp.sendRedirect(ctx + "/");
        }
    }
}
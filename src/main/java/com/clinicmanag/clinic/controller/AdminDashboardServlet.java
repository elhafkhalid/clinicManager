package com.clinicmanag.clinic.controller;

import com.clinicmanag.clinic.model.User;
import com.clinicmanag.clinic.service.DashboardService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private final DashboardService dashboardService = new DashboardService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Sécurité : rôle Admin
        String role = (String) req.getSession().getAttribute("role");
        if (!"Admin".equals(role)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Stats
        req.setAttribute("totalPatients", dashboardService.countPatients());
        req.setAttribute("totalDoctors", dashboardService.countDoctors());
        req.setAttribute("totalAppointmentsToday", dashboardService.countAppointmentsToday());
        req.setAttribute("totalDepartments", dashboardService.countDepartments());

        // Derniers utilisateurs
        List<User> derniers = dashboardService.findLatestUsers(5);
        req.setAttribute("derniersUsers", derniers);

        req.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp")
                .forward(req, resp);
    }
}
package com.clinicmanag.clinic.controller;

import com.clinicmanag.clinic.exception.BusinessException;
import com.clinicmanag.clinic.model.Availability;
import com.clinicmanag.clinic.service.AvailabilityService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/doctor/availabilities/*")
public class AvailabilityServlet extends HttpServlet {

    private final AvailabilityService availabilityService = new AvailabilityService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String pathInfo = req.getPathInfo();

        if ("/new".equals(pathInfo)) {
            req.getRequestDispatcher("/WEB-INF/views/doctor/availability-form.jsp")
                    .forward(req, resp);
            return;
        }


        Long doctorId = (Long) req.getSession().getAttribute("userId");
        List<Availability> availabilities = availabilityService.findByDoctor(doctorId);
        req.setAttribute("availabilities", availabilities);
        req.getRequestDispatcher("/WEB-INF/views/doctor/availabilities.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String pathInfo = req.getPathInfo();

        if ("/new".equals(pathInfo)) {
            handleCreate(req, resp);
            return;
        }

        // Fallback
        resp.sendRedirect(req.getContextPath() + "/doctor/availabilities");
    }

    private void handleCreate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {


        Long doctorId = (Long) req.getSession().getAttribute("userId");
        String jour = req.getParameter("jour");
        String heureDebut = req.getParameter("heureDebut");
        String heureFin = req.getParameter("heureFin");

        try {

            availabilityService.create(doctorId, jour, heureDebut, heureFin);


            req.getSession().setAttribute("success", "Disponibilité ajoutée avec succès");
            resp.sendRedirect(req.getContextPath() + "/doctor/availabilities");

        } catch (BusinessException e) {

            req.setAttribute("error", e.getMessage());
            req.setAttribute("jour", jour);
            req.setAttribute("heureDebut", heureDebut);
            req.setAttribute("heureFin", heureFin);
            req.getRequestDispatcher("/WEB-INF/views/doctor/availability-form.jsp")
                    .forward(req, resp);
        }
    }


}
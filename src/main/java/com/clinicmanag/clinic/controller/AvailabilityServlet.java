package com.clinicmanag.clinic.controller;

import com.clinicmanag.clinic.exception.BusinessException;
import com.clinicmanag.clinic.exception.ConflictException;
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

       if("/new".equals(pathInfo)) {
           req.getRequestDispatcher("/WEB-INF/views/doctor/availability-form.jsp")
                   .forward(req,resp);

           return;
       }


        if ("/edit".equals(pathInfo)) {
            handleEditForm(req, resp);
            return;
        }


       Long doctorId = (Long) req.getSession().getAttribute("userId");
       List<Availability> availabilities = availabilityService.findByDoctor(doctorId);

       req.setAttribute("availabilities",availabilities);
       req.getRequestDispatcher("/WEB-INF/views/doctor/availabilities.jsp").forward(req,resp);

    }

    private void handleEditForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            Long id = parseRequiredId(req);
            Availability availability = availabilityService.findById(id);

            // Sécurité : la dispo appartient bien au doctor connecté ?
            Long doctorId = (Long) req.getSession().getAttribute("userId");
            if (!availability.getDoctor().getId().equals(doctorId)) {
                req.getSession().setAttribute("error", "Accès refusé");
                resp.sendRedirect(req.getContextPath() + "/doctor/availabilities");
                return;
            }

            req.setAttribute("availability", availability);
            req.getRequestDispatcher("/WEB-INF/views/doctor/availability-form.jsp")
                    .forward(req, resp);

        } catch (BusinessException e) {
            req.getSession().setAttribute("error", e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/doctor/availabilities");
        }
    }

    private Long parseRequiredId(HttpServletRequest req) {

        String idParam = req.getParameter("id");
        if (idParam == null || idParam.isBlank()) {
            throw new ConflictException("L'id de la disponibilité est obligatoire");
        }
        try {
            return Long.parseLong(idParam);
        } catch (NumberFormatException e) {
            throw new ConflictException("L'id est invalide");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String pathInfo = req.getPathInfo();

        if ("/new".equals(pathInfo)) {
            handleCreate(req, resp);
            return;
        }

        if ("/edit".equals(pathInfo)) {
            handleUpdate(req, resp);
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

    private void handleUpdate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Long doctorId = (Long) req.getSession().getAttribute("userId");
        String jour = req.getParameter("jour");
        String heureDebut = req.getParameter("heureDebut");
        String heureFin = req.getParameter("heureFin");

        Long id = null;

        try {
            id = parseRequiredId(req);
            availabilityService.update(id, doctorId, jour, heureDebut, heureFin);

            req.getSession().setAttribute("success", "Disponibilité modifiée avec succès");
            resp.sendRedirect(req.getContextPath() + "/doctor/availabilities");
            return;

        } catch (BusinessException e) {
            req.setAttribute("error", e.getMessage());

            Availability obj = new Availability();
            obj.setId(id);

            try {
                if (jour != null && !jour.isBlank()) {
                    obj.setJour(java.time.DayOfWeek.valueOf(jour.toUpperCase()));
                }
                if (heureDebut != null && !heureDebut.isBlank()) {
                    obj.setHeureDebut(java.time.LocalTime.parse(heureDebut));
                }
                if (heureFin != null && !heureFin.isBlank()) {
                    obj.setHeureFin(java.time.LocalTime.parse(heureFin));
                }
            } catch (Exception ignore) {
                // Conversion échouée → on garde juste l'id
            }

            req.setAttribute("availability", obj);

            req.getRequestDispatcher("/WEB-INF/views/doctor/availability-form.jsp")
                    .forward(req, resp);
        }
    }
}
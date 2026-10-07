package com.clinicmanag.clinic.controller;

import com.clinicmanag.clinic.exception.BusinessException;
import com.clinicmanag.clinic.exception.ConflictException;
import com.clinicmanag.clinic.model.Doctor;
import com.clinicmanag.clinic.model.Specialty;
import com.clinicmanag.clinic.service.DoctorService;
import com.clinicmanag.clinic.service.SpecialtyService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import static java.lang.Long.parseLong;

@WebServlet("/admin/doctors/*")
public class DoctorServlet extends HttpServlet {
   private final DoctorService doctorService = new DoctorService();
   private final SpecialtyService specialtyService = new SpecialtyService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String pathInfo = req.getPathInfo();

        if ("/new".equals(pathInfo)) {
            showForm(req, resp, null);
            return;
        }

        if ("/edit".equals(pathInfo)) {
            handleEditForm(req, resp);
            return;
        }

        List<Doctor> doctors = doctorService.findAll();
        req.setAttribute("doctors", doctors);

        req.getRequestDispatcher("/WEB-INF/views/admin/doctors.jsp")
                .forward(req, resp);
    }

    private void showForm(HttpServletRequest req, HttpServletResponse resp, Doctor doctor)
            throws ServletException, IOException {

        List<Specialty> specialties = specialtyService.findAll();
        req.setAttribute("specialties", specialties);

        if (doctor != null) {
            req.setAttribute("doctor", doctor);
        }

        req.getRequestDispatcher("/WEB-INF/views/admin/doctor-form.jsp")
                .forward(req, resp);

    }

    private void handleEditForm(HttpServletRequest req, HttpServletResponse resp)
            throws IOException,ServletException {

        try {
            Long id = parseRequiredId(req);
            Doctor doctor = doctorService.findById(id);
            showForm(req, resp, doctor);

        } catch (BusinessException e) {
            req.getSession().setAttribute("error", e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
        }
    }

    private Long parseRequiredId(HttpServletRequest req) {
        String idParam = req.getParameter("id");

        if (idParam == null || idParam.isBlank()) {
            throw new ConflictException("L'id du médecin est obligatoire");
        }
        try {
            return Long.parseLong(idParam);
        } catch (NumberFormatException e) {
            throw new ConflictException("L'id du médecin est invalide");
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

        if ("/desactiver".equals(pathInfo)) {
            handleDesactiver(req, resp);
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/admin/doctors");

    }

    private void handleCreate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String nom = req.getParameter("nom");
        String email = req.getParameter("email");
        String motDePasse = req.getParameter("motDePasse");
        String matricule = req.getParameter("matricule");
        String titre = req.getParameter("titre");
        Long specialtyId = parseLong(req.getParameter("specialtyId"));

        try {
            doctorService.create(nom, email, motDePasse, matricule, titre, specialtyId);
            req.getSession().setAttribute("success", "Médecin créé avec succès");
            resp.sendRedirect( "/admin/doctors");

        } catch (BusinessException e) {
            req.setAttribute("error", e.getMessage());
            showForm(req, resp, null);
        }
    }

    private void handleUpdate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Long id = null;
        String nom = req.getParameter("nom");
        String email = req.getParameter("email");
        String motDePasse = req.getParameter("motDePasse");
        String matricule = req.getParameter("matricule");
        String titre = req.getParameter("titre");
        Long specialtyId = parseLong(req.getParameter("specialtyId"));

        try {
            id = parseRequiredId(req);
            doctorService.update(id, nom, email, motDePasse, matricule, titre, specialtyId);

            req.getSession().setAttribute("success", "Médecin modifié avec succès");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");

        } catch (BusinessException e) {
            req.setAttribute("error", e.getMessage());
            showForm(req, resp,null);
        }
    }

    private void handleDesactiver(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        try {

            Long id = parseRequiredId(req);
            doctorService.desactiver(id);

            req.getSession().setAttribute("success", "Médecin désactivé");

        } catch (BusinessException e) {
            req.getSession().setAttribute("error", e.getMessage());
        }

        resp.sendRedirect(req.getContextPath() + "/admin/doctors");
    }

}
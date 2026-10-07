package com.clinicmanag.clinic.controller;

import com.clinicmanag.clinic.exception.BusinessException;
import com.clinicmanag.clinic.exception.ConflictException;
import com.clinicmanag.clinic.model.Department;
import com.clinicmanag.clinic.model.Specialty;
import com.clinicmanag.clinic.service.DepartmentService;
import com.clinicmanag.clinic.service.SpecialtyService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/specialties/*")
public class SpecialtyServlet extends HttpServlet {

    private final SpecialtyService specialtyService = new SpecialtyService();
    private final DepartmentService departmentService = new DepartmentService();

    @Override
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

        // Sinon → liste
        List<Specialty> specialties = specialtyService.findAll();
        req.setAttribute("specialties", specialties);
        req.getRequestDispatcher("/WEB-INF/views/admin/specialties.jsp")
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

        if ("/edit".equals(pathInfo)) {
            handleUpdate(req, resp);
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/admin/specialties");
    }


    private void handleCreate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        Long departmentId = parseLong(req.getParameter("departmentId"));

        try {
            specialtyService.create(name, departmentId);
            req.getSession().setAttribute("success", "Spécialité créée avec succès");
            resp.sendRedirect(req.getContextPath() + "/admin/specialties");

        } catch (BusinessException e) {
            req.setAttribute("error", e.getMessage());
            // On reconstruit un faux objet pour pré-remplir le form
            Specialty fake = new Specialty();
            fake.setName(name);
            showForm(req, resp, fake);
        }
    }

    private void handleEditForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            Long id = parseRequiredId(req);
            Specialty spec = specialtyService.findById(id);
            showForm(req, resp, spec);

        } catch (BusinessException e) {
            req.getSession().setAttribute("error", e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/specialties");
        }
    }


    private void handleUpdate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Long id = null;
        String name = req.getParameter("name");
        Long departmentId = parseLong(req.getParameter("departmentId"));

        try {
            id = parseRequiredId(req);
            specialtyService.update(id, name, departmentId);

            req.getSession().setAttribute("success", "Spécialité modifiée avec succès");
            resp.sendRedirect(req.getContextPath() + "/admin/specialties");

        } catch (BusinessException e) {
            req.setAttribute("error", e.getMessage());
            Specialty fake = new Specialty();
            fake.setId(id);
            fake.setName(name);
            showForm(req, resp, fake);
        }
    }

    private void showForm(HttpServletRequest req, HttpServletResponse resp,
                          Specialty specialty)
            throws ServletException, IOException {


        List<Department> departments = departmentService.findAll();
        req.setAttribute("departments", departments);

        if (specialty != null) {
            req.setAttribute("specialty", specialty);
        }

        req.getRequestDispatcher("/WEB-INF/views/admin/specialty-form.jsp")
                .forward(req, resp);
    }

    private Long parseRequiredId(HttpServletRequest req) {
        String idParam = req.getParameter("id");
        if (idParam == null || idParam.isBlank()) {
            throw new ConflictException("L'id de la spécialité est obligatoire");
        }
        try {
            return Long.parseLong(idParam);
        } catch (NumberFormatException e) {
            throw new ConflictException("L'id de la spécialité est invalide");
        }
    }

    private Long parseLong(String value) {
        if (value == null || value.isBlank()) return null;
        try {
            return Long.parseLong(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }
}
package com.clinicmanag.clinic.controller;

import com.clinicmanag.clinic.exception.BusinessException;
import com.clinicmanag.clinic.model.Department;
import com.clinicmanag.clinic.service.DepartmentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/admin/departments/*")
public class DepartmentServlet extends HttpServlet {

    private final DepartmentService departmentService = new DepartmentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {

        String pathInfo = req.getPathInfo();

        if("/new".equals(pathInfo)) {
            req.getRequestDispatcher("/WEB-INF/views/admin/department-form.jsp")
                    .forward(req,resp);

            return;
        }

        if("/edit".equals(pathInfo)) {
            handleEditForm(req,resp);
            return;
        }

        List<Department> departments = departmentService.findAll();

        req.setAttribute("departments",departments);
        req.getRequestDispatcher("/WEB-INF/views/admin/departments.jsp")
                .forward(req,resp);
    }

    protected void doPost(HttpServletRequest req,HttpServletResponse resp)
        throws ServletException,IOException {
        String pathInfo = req.getPathInfo();

        if("/new".equals(pathInfo)) {
            handleCreate(req,resp);
            return;
        }

        if("/edit".equals(pathInfo)) {
            handleUpdate(req,resp);
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/admin/departments");
    }

    private void handleCreate(HttpServletRequest req,HttpServletResponse resp)
    throws ServletException,IOException{
        String name = req.getParameter("name");

        try {
            departmentService.create(name);

            req.getSession().setAttribute("success", "Département créé avec succès");
            resp.sendRedirect(req.getContextPath() + "/admin/departments");
        }catch(BusinessException e) {
            req.setAttribute("error",e.getMessage());
            req.setAttribute("name",name);
            req.getRequestDispatcher("/WEB-INF/views/admin/department-form.jsp")
                    .forward(req,resp);
        }

    }

    private void handleEditForm(HttpServletRequest req,HttpServletResponse resp)
        throws ServletException,IOException {

        try {
            Long id = parseId(req);
            Department dep = departmentService.findById(id);

            req.setAttribute("department",dep);
            req.getRequestDispatcher("/WEB-INF/views/admin/department-form.jsp")
                    .forward(req,resp);

        }catch(BusinessException e){
            req.getSession().setAttribute("error",e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/department");
        }
    }

    private void handleUpdate(HttpServletRequest req,HttpServletResponse resp)
        throws ServletException,IOException {

        Long id = null;
        String name = req.getParameter("name");

        try{
            id = parseId(req);
            departmentService.update(id,name);

            req.getSession().setAttribute("success", "Département modifié avec succès");
            resp.sendRedirect(req.getContextPath() + "/admin/departments" );
        } catch(BusinessException e){

            Department fake = new Department();
            fake.setId(id);
            fake.setName(name);

            req.setAttribute("error", e.getMessage());
            req.setAttribute("department", fake);
            req.getRequestDispatcher("/WEB-INF/views/admin/department-form.jsp")
                    .forward(req, resp);

        }
    }

    private Long parseId(HttpServletRequest req) {

        String idParam = req.getParameter("id");

        if (idParam == null || idParam.isBlank()) {
            throw new com.clinicmanag.clinic.exception.ConflictException(
                    "L'id du département est obligatoire");
        }
        try {
            return Long.parseLong(idParam);
        } catch (NumberFormatException e) {
            throw new com.clinicmanag.clinic.exception.ConflictException(
                    "L'id du département est invalide");
        }
    }
}
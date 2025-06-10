/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.department;

import dal.DepartmentDBContext;
import entity.Department;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author vinhnnpc
 */
@WebServlet(urlPatterns = {"/department/edit"})
public class editController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        DepartmentDBContext db = new DepartmentDBContext();
        Department d = db.get(id);
        request.setAttribute("d", d);
        request.getRequestDispatcher("../view/department/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");

        Department d = new Department();
        d.setId(id);
        d.setName(name);

        DepartmentDBContext db = new DepartmentDBContext();
        db.update(d);

        response.sendRedirect("list");
    }

}

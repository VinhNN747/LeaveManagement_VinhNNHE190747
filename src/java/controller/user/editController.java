/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.DepartmentDBContext;
import dal.UserDBContext;
import entity.Department;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author vinhnnpc
 */
@WebServlet(urlPatterns = {"/user/edit"})
public class editController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserDBContext udb = new UserDBContext();
        DepartmentDBContext ddb = new DepartmentDBContext();

        User user = udb.get(id);
        ArrayList<Department> depts = ddb.list();

        request.setAttribute("user", user);
        request.setAttribute("depts", depts);
        request.getRequestDispatcher("../view/user/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User u = new User();
        u.setId(Integer.parseInt(request.getParameter("id")));
        u.setName(request.getParameter("name"));
        u.setEmail(request.getParameter("email"));
        u.setPassword(request.getParameter("password"));
        u.setRole(request.getParameter("role"));

        String did = request.getParameter("did");
        if (did != null && !did.isEmpty()) {
            Department d = new Department();
            d.setId(Integer.parseInt(did));
            u.setDepartment(d);
        } else {
            u.setDepartment(null);
        }

        UserDBContext udb = new UserDBContext();
        udb.update(u);
        response.sendRedirect("list");
    }
}

package servlet;

import db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AddEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String designation = request.getParameter("designation");
        String department = request.getParameter("department");
        double basicSalary = Double.parseDouble(request.getParameter("basicSalary"));
        String hireDate = request.getParameter("hireDate");

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO employee (name, designation, department, basic_salary, hire_date) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, designation);
            stmt.setString(3, department);
            stmt.setDouble(4, basicSalary);
            stmt.setString(5, hireDate);
            stmt.executeUpdate();

            stmt.close();
            conn.close();

            response.sendRedirect("viewEmployees.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    // This handles GET requests to avoid 405 error
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirecting back to form
        response.sendRedirect("addEmployee.jsp");
    }
}

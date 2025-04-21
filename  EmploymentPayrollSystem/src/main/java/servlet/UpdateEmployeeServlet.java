package servlet;

import db.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class UpdateEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int empId = Integer.parseInt(request.getParameter("emp_id"));
        String name = request.getParameter("name");
        String designation = request.getParameter("designation");
        String department = request.getParameter("department");
        double basicSalary = Double.parseDouble(request.getParameter("basic_salary"));
        String hireDate = request.getParameter("hire_date");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE employee SET name=?, designation=?, department=?, basic_salary=?, hire_date=? WHERE emp_id=?");
            ps.setString(1, name);
            ps.setString(2, designation);
            ps.setString(3, department);
            ps.setDouble(4, basicSalary);
            ps.setDate(5, Date.valueOf(hireDate));
            ps.setInt(6, empId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("viewEmployees.jsp");
    }
}

package servlet;

import db.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class GeneratePayrollServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int empId = Integer.parseInt(request.getParameter("empId"));
        String month = request.getParameter("month");
        int year = Integer.parseInt(request.getParameter("year"));
        double grossSalary = Double.parseDouble(request.getParameter("grossSalary"));
        double deductions = Double.parseDouble(request.getParameter("deductions"));
        double netSalary = grossSalary - deductions;

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO payroll (emp_id, month, year, gross_salary, deductions, net_salary) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, empId);
            stmt.setString(2, month);
            stmt.setInt(3, year);
            stmt.setDouble(4, grossSalary);
            stmt.setDouble(5, deductions);
            stmt.setDouble(6, netSalary);
            stmt.executeUpdate();
            //response.sendRedirect("index.jsp");
            response.sendRedirect("viewPayroll.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

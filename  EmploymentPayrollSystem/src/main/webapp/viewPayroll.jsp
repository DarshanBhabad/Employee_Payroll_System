<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payroll List</title>
    <link rel="stylesheet" type="text/css" href="style.css">
   
</head>
<body>
    <h2>Payroll Records</h2>

    <table border="1" cellpadding="8">
        <tr>
            <th>Payroll ID</th>
            <th>Employee ID</th>
            <th>Month</th>
            <th>Year</th>
            <th>Gross Salary</th>
            <th>Deductions</th>
            <th>Net Salary</th>
        </tr>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/payroll_system", "root", "Darshan@123");

                String query = "SELECT * FROM payroll";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("payroll_id") %></td>
            <td><%= rs.getInt("emp_id") %></td>
            <td><%= rs.getString("month") %></td>
            <td><%= rs.getInt("year") %></td>
            <td><%= rs.getDouble("gross_salary") %></td>
            <td><%= rs.getDouble("deductions") %></td>
            <td><%= rs.getDouble("net_salary") %></td>
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>

    <br>
    <a href="index.jsp">Back to Home</a>
</body>
</html>

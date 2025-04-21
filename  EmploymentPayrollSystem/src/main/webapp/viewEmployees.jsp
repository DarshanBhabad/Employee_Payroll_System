<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Employees</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a.btn {
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            margin: 0 4px;
        }
        .edit {
            background-color: #4CAF50;
            color: white;
        }
        .delete {
            background-color: #f44336;
            color: white;
        }
        .back {
            margin: 20px auto;
            display: block;
            text-align: center;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Employee List</h2>
    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Designation</th>
            <th>Department</th>
            <th>Basic Salary</th>
            <th>Hire Date</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM employee");
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("emp_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("designation") %></td>
            <td><%= rs.getString("department") %></td>
            <td><%= rs.getDouble("basic_salary") %></td>
            <td><%= rs.getDate("hire_date") %></td>
            <td>
                <a href="editEmployee.jsp?empId=<%= rs.getInt("emp_id") %>" class="btn edit">Edit</a>
               <a href="deleteEmployee?empId=<%= rs.getInt("emp_id") %>"
   class="btn delete"
   onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>
               
            </td>
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
    <div class="back">
        <a href="index.jsp">← Back to Home</a>
    </div>
</body>
</html>

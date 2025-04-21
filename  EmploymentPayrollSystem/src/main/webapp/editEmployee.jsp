<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnection" %>
<%
    int empId = Integer.parseInt(request.getParameter("empId"));
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM employee WHERE emp_id=?");
    ps.setInt(1, empId);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2>Edit Employee</h2>

<form action="updateEmployee" method="post">
    <input type="hidden" name="emp_id" value="<%= rs.getInt("emp_id") %>">
    Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br>
    Designation: <input type="text" name="designation" value="<%= rs.getString("designation") %>"><br>
    Department: <input type="text" name="department" value="<%= rs.getString("department") %>"><br>
    Basic Salary: <input type="text" name="basic_salary" value="<%= rs.getDouble("basic_salary") %>"><br>
    Hire Date: <input type="date" name="hire_date" value="<%= rs.getDate("hire_date") %>"><br>
    <input type="submit" value="Update">
</form>
</body>
</html>

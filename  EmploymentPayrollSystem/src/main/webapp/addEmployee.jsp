<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    
</head>
<body>
    <h2>Add New Employee</h2>
    <form action="addEmployee" method="post">
        <label>Name:</label><br>
        <input type="text" name="name" required><br><br>

        <label>Designation:</label><br>
        <input type="text" name="designation" required><br><br>

        <label>Department:</label><br>
        <input type="text" name="department" required><br><br>

        <label>Basic Salary:</label><br>
        <input type="number" name="basicSalary" step="0.01" required><br><br>

        <label>Hire Date:</label><br>
        <input type="date" name="hireDate" required><br><br>

        <input type="submit" value="Add Employee">
    </form>
    <br>
    <a href="index.jsp">Back to Home</a>
</body>
</html>

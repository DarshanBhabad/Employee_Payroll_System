<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Payroll</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    
</head>
<body>
    <h2>Generate Payroll</h2>
    <form action="generatePayroll" method="post">
        <label>Employee ID:</label><br>
        <input type="number" name="empId" required><br><br>

        <label>Month:</label><br>
        <input type="text" name="month" required><br><br>

        <label>Year:</label><br>
        <input type="number" name="year" required><br><br>

        <label>Gross Salary:</label><br>
        <input type="number" name="grossSalary" step="0.01" required><br><br>

        <label>Deductions:</label><br>
        <input type="number" name="deductions" step="0.01" required><br><br>

        <input type="submit" value="Generate Payroll">
    </form>
    <br>
    <a href="index.jsp">Back to Home</a>
</body>
</html>

package model;

public class Payroll {
    private int payrollId;
    private int empId;
    private String month;
    private int year;
    private double grossSalary;
    private double deductions;
    private double netSalary;

    // Getters and setters
    public int getPayrollId() { return payrollId; }
    public void setPayrollId(int payrollId) { this.payrollId = payrollId; }
    public int getEmpId() { return empId; }
    public void setEmpId(int empId) { this.empId = empId; }
    public String getMonth() { return month; }
    public void setMonth(String month) { this.month = month; }
    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }
    public double getGrossSalary() { return grossSalary; }
    public void setGrossSalary(double grossSalary) { this.grossSalary = grossSalary; }
    public double getDeductions() { return deductions; }
    public void setDeductions(double deductions) { this.deductions = deductions; }
    public double getNetSalary() { return netSalary; }
    public void setNetSalary(double netSalary) { this.netSalary = netSalary; }
}

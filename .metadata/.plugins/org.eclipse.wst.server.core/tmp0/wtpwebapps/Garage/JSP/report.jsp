<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.database.dbconn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invoice Report</title>
    <link rel="stylesheet" href="../CSS/report.css">
</head>
<body>
    <%@ include file="adminNav.jsp"%>
    <div class="content">
        <form action="" method="post">
            <div class="form-group">
                <label class="label" for="startDate">Start Date</label>
                <input type="date" class="input" id="startDate" name="startDate" placeholder="Start Date">
            </div>
            <div class="form-group">
                <label class="label" for="endDate">End Date</label>
                <input type="date" class="input" id="endDate" name="endDate">
            </div>
            <div class="form-group">
                <input type="submit" class="btn" value="Generate Report">
            </div>
        </form>
    
    
    <% 
        if (request.getMethod().equalsIgnoreCase("post")) {
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            
            int totalInvoices = 0;
            int totalTimeTaken = 0;
            
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Connection conn = dbconn.getConnection();
                Statement st = conn.createStatement();
                
                // Construct and execute the SQL query
                String query = "SELECT * FROM invoice WHERE mechanicID = " + id + 
                               " AND invoice_date BETWEEN '" + startDate + "' AND '" + endDate + "'";
                ResultSet rs = st.executeQuery(query);
                
                while (rs.next()) {
                    
                    
            %>
   <div class="table-container">
    <table class="table">
            <tr>
                <th>Invoice ID</th>
                <th>Invoice Date</th>
                <!-- Add more columns as needed -->
            </tr>
            <%
               
                while (rs.next()) {
            %>
            <tr>
           <% totalInvoices++;
           Time timeTaken = rs.getTime("timeTaken"); // Assuming column name is "time_taken"
                    totalTimeTaken += timeTaken.toLocalTime().toSecondOfDay();%>
                <td><%= rs.getInt("invoice_id") %></td>
                <td><%= rs.getDate("invoice_date") %></td>
                <!-- Add more columns as needed -->
            </tr>
            <%
                }
                
            } }catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </table>
    </div>
    <div class="summary">
        <p>Total Jobs: <%= totalInvoices %></p>
        <p>Total Time Worked: <%= formatTime(totalTimeTaken) %></p>
    </div>
    <%
        }
    %>
    </div>
    
</body>
</html>

<%!
    public String formatTime(int seconds) {
        int hours = seconds / 3600;
        int minutes = (seconds % 3600) / 60;
        return hours + "h " + minutes + "m";
    }
%>

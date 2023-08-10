<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.database.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Completion</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    .container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    label {
        font-weight: bold;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group input,
    .form-group select {
        width: 100%;
        padding: 8px;
        font-size: 16px;
        border: 1px solid #ddd;
    }

    .form-group textarea {
        width: 100%;
        padding: 8px;
        font-size: 16px;
        border: 1px solid #ddd;
        resize: vertical;
    }

    .btn {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #ff6600;
        color: #fff;
        border: none;
        cursor: pointer;
    }
</style>
</head>
<body style="margin:0px;">
<jsp:include page="nav.jsp"></jsp:include>
<div class="container">
    <h2>Job Completion</h2>
    <form action="save_completion.jsp" method="post">
        <% int id = Integer.parseInt(request.getParameter("id"));
            Connection conn = dbconn.getConnection();
            Statement stmt = conn.createStatement();
            //Sets the order status as completed
            String updateQuery = "UPDATE order_list SET status = 'completed' WHERE order_id = " + id;
            stmt.executeUpdate(updateQuery);
            String query = "SELECT * FROM order_list WHERE order_id=" + id;
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                String customerName = rs.getString("customer_name");
                String vehicleNumber = rs.getString("vehicle_no");
                String repairs = rs.getString("repairs");
//                 int timeTaken = Integer.parseInt(request.getParameter("timeTaken"));
//                 int amount = (timeTaken / 30) * 50;
        %>
        <div class="form-group">
            <label for="order_id">Order Id</label>
            <input type="text" id="order_id" name="order_id" value="<%= +id %>" readonly>
        </div>
        <div class="form-group">
            <label for="customerName">Customer Name</label>
            <input type="text" id="customerName" name="customerName" value="<%= customerName %>" readonly>
        </div>
        <div class="form-group">
            <label for="vehicleNumber">Vehicle Number</label>
            <input type="text" id="vehicleNumber" name="vehicleNumber" value="<%= vehicleNumber %>" readonly>
        </div>
        <div class="form-group">
            <label for="completedTime">Completed Time</label>
            <input type="text" id="completedTime" name="completedTime" value="<%= request.getParameter("timeTaken") %>" readonly>
        </div>
<!--          <div class="form-group"> -->
<!--             <label for="amount">Total Amount</label> -->
<%--                <input type="text" id="amount" name="amount" value="<%= amount %>" readonly> --%>
<!--         </div> -->
        <div class="form-group">
            <label for="mechanic">Mechanic</label>
            <input type="text" id="mechanic" name="mechanic" value="<%= session.getAttribute("username") %>" readonly>
           
        </div>
        <div class="form-group">
            <label for="repairs">Repairs</label>
            <textarea id="repairs" name="repairs" rows="5" readonly><%= repairs %></textarea>
        </div>
        <div class="form-group">
            <button type="submit" class="btn">Save</button>
        </div>
        <% } %>
        
        
    </form>
    <!-- Button to redirect to email.jsp -->
    <div class="form-group">
        <a href="email.jsp?id=<%= id %>"><button class="btn">Send Email</button></a>
    </div>
</div>
</body>
</html>
 
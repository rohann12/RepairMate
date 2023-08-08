<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.database.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Repair</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
}

.container {
    display: flex;
    max-width: 600px;
    margin: 60px auto 0; /* Adjust the top margin to make space for the navigation bar */
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
}

input[type="checkbox"] {
    margin-right: 5px;
}

/* Apple website inspired effects */
.content {
    overflow: hidden;
    max-height: 0;
    transition: max-height 0.3s ease-out;
}

.container.expanded .content {
    max-height: 1000px;
    transition: max-height 0.3s ease-in;
}

.time-taken {
    position: fixed;
    top: 100px; /* Adjust the top position to make space for the navigation bar */
    right: 20px;
    z-index: 1; /* Set a higher z-index to make it appear above the content but below the navigation bar */
    padding: 10px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    animation: slide-in 0.5s ease-out;
}

@keyframes slide-in {
    from {
        transform: translateX(100%);
    }
    to {
        transform: translateX(0);
    }
}
</style>
</head>
<body style="margin:0px;">
<jsp:include page="nav.jsp" />
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = dbconn.getConnection();
    Statement stmt = conn.createStatement();
    //Sets the order status as ongoing
    String updateQuery = "UPDATE order_list SET status = 'ongoing' WHERE order_id = " + id;
    stmt.executeUpdate(updateQuery);
    
    String query = "SELECT * FROM order_list WHERE order_id=" + id;
    ResultSet rs = stmt.executeQuery(query);
%>
<%
    while (rs.next()) {
        String repairs = rs.getString("repairs");
        String[] repairsArray = repairs.split("\\. "); // Split repairs into an array

        // Helper function to check if all repairs are completed
        boolean allRepairsCompleted = true;
        for (String repair : repairsArray) {
            if (!repair.endsWith("(Completed)")) {
                allRepairsCompleted = false;
                break;
            }
        }
%>
<div class="time-taken">
    <strong>Time taken:</strong> <br><br> <span id="time_taken">00:00:00</span>
</div>

<div class="container">
    <table>
        <tr>
            <th>Customer Name</th>
            <td><%=rs.getString("customer_name")%></td>
        </tr>
        <tr>
            <th>Vehicle Number</th>
            <td><%=rs.getString("vehicle_no")%></td>
        </tr>
        <tr>
            <th>Start Time</th>
            <td><%=rs.getString("start_time")%></td>
        </tr>
        <tr>
            <th>Estimated Cost</th>
            <td><%=rs.getString("estimated_cost")%></td>
        </tr>
        <tr>
            <th>Repairs</th>
            <td>
                <%-- Add checkboxes for each repair --%>
                <% for (String repair : repairsArray) { %>
                    <label>
                        <input type="checkbox" name="repairCheckbox" value="<%= repair %>" disabled> <%= repair %><br>
                    </label>
                <% } %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button id="start_btn" onclick="startStopwatch()">Start</button>
                <button id="stop_btn" onclick="stopStopwatch()" disabled>Stop</button>
                <%-- Show the "Complete" button only when all repairs are not completed (i.e., not all checkboxes are checked) --%>
                <% if (!allRepairsCompleted) { %>
                    <button id="complete_btn" onclick="complete()" disabled>Complete</button>
                <% } %>
            </td>
        </tr>
    </table>
</div>

<script>
    var startTime = 0;
    var elapsedTime = 0;
    var stopwatchInterval;
    var startBtn = document.getElementById("start_btn");
    var stopBtn = document.getElementById("stop_btn");
    var completeBtn = document.getElementById("complete_btn");
    var repairCheckboxes = document.getElementsByName("repairCheckbox");
    var timeTakenElement = document.getElementById("time_taken");

    function startStopwatch() {
        startTime = new Date().getTime();
        startBtn.disabled = true;
        stopBtn.disabled = false;
        completeBtn.disabled = true;
        enableCheckboxes(true);
        stopwatchInterval = setInterval(updateElapsedTime, 1000);
    }

    function stopStopwatch() {
        clearInterval(stopwatchInterval);
        startBtn.disabled = false;
        stopBtn.disabled = true;
        enableCheckboxes(false);
    }

    function enableCheckboxes(enabled) {
        for (var i = 0; i < repairCheckboxes.length; i++) {
            repairCheckboxes[i].disabled = !enabled;
        }
    }

    function updateElapsedTime() {
        var currentTime = new Date().getTime();
        elapsedTime += currentTime - startTime;
        startTime = currentTime;

        var hours = Math.floor(elapsedTime / (1000 * 60 * 60));
        var minutes = Math.floor((elapsedTime % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((elapsedTime % (1000 * 60)) / 1000);

        var timeString = formatTime(hours) + ":" + formatTime(minutes) + ":" + formatTime(seconds);
        time_taken.innerText = timeString;
        checkCompleteButton();
    }

    function formatTime(time) {
        return time < 10 ? "0" + time : time;
    }

    // Function to check if all repair checkboxes are checked and enable the "Complete" button
    function checkCompleteButton() {
        var allChecked = true;
        for (var i = 0; i < repairCheckboxes.length; i++) {
            if (!repairCheckboxes[i].checked) {
                allChecked = false;
                break;
            }
        }
        completeBtn.disabled = !allChecked;
    }

    // Add an event listener to each repair checkbox to call the checkCompleteButton function
    for (var i = 0; i < repairCheckboxes.length; i++) {
        repairCheckboxes[i].addEventListener("change", checkCompleteButton);
    }

    function complete() {
        var timeTaken = time_taken.innerText;
        var id = <%= id %>; // Get the 'id' value from JSP
        var url = "complete.jsp?id=" + id + "&timeTaken=" + encodeURIComponent(timeTaken);
        window.location.href = url;
    }

</script>

<%
    }
%>
</body>
</html>

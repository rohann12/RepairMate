<!DOCTYPE html>
<html>
<head>
  <title>Order Form</title>
  <link rel="stylesheet" href="../CSS/orders.css"/>
</head>
<body style="margin:0px;">
<%
	HttpSession s = request.getSession(false);
	if (s != null && Boolean.TRUE.equals(s.getAttribute("isAdmin"))) {
	%>
	<jsp:include page="adminNav.jsp" />
	<%
	} else if (s != null && Boolean.FALSE.equals(s.getAttribute("isAdmin"))) {
	%>
	<jsp:include page="nav.jsp" />
	<%
	}
	%>
<div class="content">
  <h2>Order Form</h2>
  <form action="orderInsert.jsp" method="post">
    
    
    <label for="hidden">Customer ID:</label>
    <input type="text" id="customer_id" name="customer_id" value="0" placeholder="0" >
    
    <label for="customer_name">Customer Name:</label>
    <input type="text" id="customer_name" name="customer_name" required>
    
    <label for="email">Email</label>
    <input type="text" id="email" name="email" >
    
    <label for="vehicle_no">Vehicle Number:</label>
    <input type="text" id="vehicle_no" name="vehicle_no" required>
    
    <input type="hidden" id="start_time" name="start_time">    
  
    
    <label for="estimated_completed">Estimated Completion Time:</label>
    <input type="datetime-local" id="estimated_completed" name="estimated_completed" required>
    
    <label for="estimated_cost">Estimated Cost:</label>
    <input type="number" id="estimated_cost" name="estimated_cost" required>
    
   <label for="jobs">Jobs:</label>
	<div id="jobsContainer">
    <textarea name="jobs[]" required></textarea>
  </div>
  <button type="button" onclick="addJob()">Add Job</button>
    
    <button type="submit">Submit</button>
  </form>
  </div>
  <!--Insert current time  -->
     <script>
      function setStartTime() {
        var currentTime = new Date().toISOString().slice(0, 16);
        document.getElementById("start_time").value = currentTime;
      }
      // Call setStartTime() when the form is submitted
      document.querySelector("form").addEventListener("submit", setStartTime);
      var jobCount = 1;

      function addJob() {
        var jobsContainer = document.getElementById("jobsContainer");
        var newJobInput = document.createElement("textarea");
        newJobInput.setAttribute("name", "jobs[]");
        newJobInput.setAttribute("required", "true");
        newJobInput.setAttribute("id", "job" + jobCount);
        jobsContainer.appendChild(newJobInput);
        jobCount++;
      }
     
    </script>
</body>
</html>

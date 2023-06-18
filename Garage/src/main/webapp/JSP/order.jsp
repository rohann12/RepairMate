<!DOCTYPE html>
<html>
<head>
  <title>Order Form</title>
  <link rel="stylesheet" href="../CSS/order.css"/>
</head>
<body>
<jsp:include page="nav.jsp" />

  <h2>Order Form</h2>
  <form action="orderInsert.jsp" method="post">
    
    
    <label for="customer_id">Customer ID:</label>
    <input type="text" id="customer_id" name="customer_id" value="0" placeholder="0" >
    
    <label for="customer_name">Customer Name:</label>
    <input type="text" id="customer_name" name="customer_name" required>
    
    <label for="vehicle_no">Vehicle Number:</label>
    <input type="text" id="vehicle_no" name="vehicle_no" required>
    
    <input type="hidden" id="start_time" name="start_time">
    
  
    
    <label for="estimated_completed">Estimated Completion Time:</label></br>
    <input type="datetime-local" id="estimated_completed" name="estimated_completed" required></br>
    
    <label for="estimated_cost">Estimated Cost:</label>
    <input type="number" id="estimated_cost" name="estimated_cost" required>
    
    <label for="repairs">Repairs:</label>
    <textarea id="repairs" name="repairs" required></textarea>
    
    <button type="submit">Submit</button>
  </form>
  <!--Insert current time  -->
     <script>
      function setStartTime() {
        var currentTime = new Date().toISOString().slice(0, 16);
        document.getElementById("start_time").value = currentTime;
      }
      // Call setStartTime() when the form is submitted
      document.querySelector("form").addEventListener("submit", setStartTime);
    </script>
</body>
</html>

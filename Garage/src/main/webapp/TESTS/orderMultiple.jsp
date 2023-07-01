<!DOCTYPE html>
<html>
<head>
<title>Order Form</title>
<link rel="stylesheet" href="../CSS/order.css" />
</head>
<body>
	<jsp:include page="../JSP/nav.jsp" />

	<h2>Order Form</h2>
	<form action="ordermul.jsp" method="post">

		<label for="customer_name">Customer Name:</label> <input type="text"
			id="customer" name="customer_name" required> <label
			for="jobs">Jobs:</label>
		<div id="jobsContainer">
			<textarea name="jobs[]" required></textarea>
		</div>
		<button type="button" onclick="addJob()">Add Job</button>

		<button type="submit">Submit</button>
	</form>

	<script>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.container {
	margin: 0 auto;
	max-width: 800px;
	padding: 20px;
}

.form-group {
	margin-bottom: 20px;
}

.label {
	display: block;
	font-weight: bold;
}

.input {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.btn {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
</style>

</head>
<body>
		<jsp:include page="adminNav.jsp" />
<div class="content">
	<div class="container">
		<div class="card">
			<div class="card-title">
				<!-- Empty content in the card title -->
			</div>
			<div id="add-brand-messages"></div>
			<div class="card-body">
				<div class="input-states">
					<form action="getOrderReport.jsp" method="post"
						id="getOrderReportForm">
						<div class="form-group">
							<label class="label" for="startDate">Start Date</label> <input
								type="date" class="input" id="startDate" name="startDate"
								placeholder="Start Date">
						</div>
						<div class="form-group">
							<label class="label" for="endDate">End Date</label> <input
								type="date" class="input" id="endDate" name="endDate">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>

</body>
</html>
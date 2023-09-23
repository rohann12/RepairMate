<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.database.dbconn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invoice Bill</title>
<style>
/* Reset some default styles for printing */
@media print {
	body {
		margin: 0;
		padding: 0;
	}
	.print-button {
        display: none; /* Hide the print button in the final print */
    }
	
}

/* Styles for the invoice */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
}

.invoice-container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	background-color: #fff;
}

.invoice-header {
	text-align: center;
	margin-bottom: 20px;
}

.invoice-header h1 {
	color: #333;
}

.bill-details {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.bill-details div {
	flex: 1;
}

.bill-items {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.bill-items th, .bill-items td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

.total {
	margin-top: 20px;
	text-align: right;
	font-weight: bold;
}

/* Lines */
.line {
	border-top: 1px solid #ccc;
	margin-top: 10px;}
	/* Signature Section */
	
.signature-section {
    margin-top: 40px;
    text-align: left;
}

.signature {
	
    display: inline-block;
    border-top:1px solid #000;
    width: 150px;
    margin-top: 20px;
}

/* Print Button */
.print-button {
    text-align: center;
    margin-top: 20px;
}

.print-button button {
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    border: none;
    cursor: pointer;
}
}
</style>
</head>
<body>
	<%
	Connection conn = dbconn.getConnection();
	Statement stmt = conn.createStatement();
	int invoiceId = Integer.parseInt(request.getParameter("id"));
	String query = "SELECT * FROM invoice WHERE invoice_id = " + invoiceId;
	ResultSet rs = stmt.executeQuery(query);

	double totalAmount = 0.0; // Initialize total amount

	while (rs.next()) {
		String[] partsArray = rs.getString("parts").split("\\, ");
		String[] pricesArray = rs.getString("prices").split("\\, ");
		//since the concatenated files are separated by comma ()
		// Initialize an array to hold the parsed prices as integers
		int[] priceArray = new int[pricesArray.length];
		// Get the timeTaken in HH:MM:SS format
        String timeTakenStr = rs.getString("timeTaken");
        
        // Split the timeTaken into hours, minutes, and seconds
        String[] timeParts = timeTakenStr.split(":");
        
        // Calculate the total time taken in minutes
        int timeTakenMinutes = Integer.parseInt(timeParts[0]) * 60 + Integer.parseInt(timeParts[1]);
        
        // Calculate the labor cost based on 30 minutes intervals
        int laborCost = (timeTakenMinutes / 30) * 50;

	%>
	<div class="invoice-container">
		<div class="invoice-header">
			<h1>Invoice</h1>
		</div>
		<div class="bill-details">
			<div>
				<strong>Bill To:</strong><br>
				<%=rs.getString("customer_name")%><br>

			</div>
			<div>
				<strong>Invoice Number:</strong><%=rs.getInt("invoice_id")%><br>
				<strong>Invoice Date:</strong><%=rs.getString("invoice_date")%><br>

			</div>
		</div>
		<table class="bill-items">
			<thead>
				<tr>
					<th>Parts</th>

					<th>Price</th>

				</tr>
			</thead>
			<tbody>

				<%
				int j= pricesArray.length;
				int count=0;
				for (int i = 0; i < j; i++) {
// 					priceArray[i] = Integer.parseInt(pricesArray[i]);
				%>
				<tr>
					<td><%=partsArray[i]%></td>
					<td><%=pricesArray[i]%></td>
					<% count=count+Integer.parseInt(pricesArray[i]); %>
					
				</tr>
				<%
				}
				%>
				<tr>
					<th>Labor cost</th>
					<th><%=laborCost %>
					<%count=count+laborCost; %>

			</tbody>
		</table>
		<div class="total">
			<strong>Total Amount:Rs.<%=count %></strong> 
		</div>
		 <!-- Signature Section -->
        <div class="signature-section">
            <div class="signature">
            
                   Signature
            </div>
        </div>
        <!-- Print Button -->
        
		<!-- Lines -->
		<div class="line"></div>
		<div class="line"></div>
		<div class="line"></div>
		<div class="line"></div>
	</div>
	<div class="print-button">
            <button onclick="window.print()">Print</button>
        </div>
	<%
	}
	%>
</body>
</Html>

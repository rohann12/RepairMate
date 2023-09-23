<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.database.dbconn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invoice List</title>
    <style>
        body {
            font-family: "Helvetica Neue", Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #f5f5f5;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .content {
            max-width: 740px;
            margin: 20px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 0;
            font-size: 24px;
        }

        .invoice-table-container {
            overflow: auto;
            max-height: 400px;
            /* Hide the scrollbar */
            scrollbar-width: thin;
            scrollbar-color: transparent transparent;
        }

        /* Hide scrollbar for Chrome, Safari, and Opera */
        .invoice-table-container::-webkit-scrollbar {
            width: 6px;
        }

        .invoice-table-container::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .invoice-table-container::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 4px;
        }

        .invoice-table-container::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        /* Hide scrollbar for Firefox */
        .invoice-table-container {
            scrollbar-width: thin;
            scrollbar-color: transparent transparent;
        }

        .invoice-table-container::-moz-scrollbar {
            width: 6px;
        }

        .invoice-table-container::-moz-scrollbar-track {
            background-color: transparent;
        }

        .invoice-table-container::-moz-scrollbar-thumb {
            background-color: transparent;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>

    <jsp:include page="adminNav.jsp" />

    <div class="container">
        <div class="content">
            <h2>Invoices:</h2>
            <h3>Unpaid</h3>
            <div class="invoice-table-container">
                <table class="invoice-table">
                    <tr>
                        <th>Invoice ID</th>
                        <th>Customer Name</th>
                        <th>Mechanic</th>
                        <th>Invoice Date</th>
                        <th>Total Amount</th>
                        <th>Paid Amount</th>
                        <th>Payment Status</th>
                        <th>Bill</th>
                    </tr>
                    <%
                    Connection conn = dbconn.getConnection();
                    Statement stmt = conn.createStatement();

                    // Retrieve data from the invoice table
                    String query = "SELECT * FROM invoice ORDER BY payment_status DESC";

                    ResultSet rs = stmt.executeQuery(query);

                    while (rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getInt("invoice_id")%></td>
                        <td><%=rs.getString("customer_name")%></td>
                        <td><%=rs.getString("mechanic")%></td>
                        <td><%=rs.getDate("invoice_date")%></td>
                        <td><%=rs.getDouble("total_amount")%></td>
                        <td><%=rs.getDouble("paid_amount")%></td>
                        <td><%=rs.getString("payment_status")%></td>
                        <td><a href="invoicePrint.jsp?id=<%=rs.getInt("invoice_id")%>"><button>Print</button></a></td>
                    </tr>
                    <%
                    }
                    %>
                </table>
            </div>
        </div>
    </div>

</body>
</html>

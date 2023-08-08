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
        /* Your existing CSS styles here */

        /* Additional styles for the invoice table */
        .invoice-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .invoice-table th, .invoice-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .invoice-table th {
            background-color: #f2f2f2;
        }

        .invoice-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .invoice-table tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>

    <jsp:include page="adminNav.jsp" />

    <div style="display: grid; place-items: center">
        <div class="content" style="margin-top: 20px;">
            <h2>Invoices:</h2>

            <div class="scrollable-table">
                <table class="invoice-table">
                    <tr>
                        <th>Invoice ID</th>
                        <th>Customer Name</th>
                        <th>Mechanic</th>
                        <th>Invoice Date</th>
                        <th>Total Amount</th>
                        <th>Paid Amount</th>
                        <th>Payment Status</th>
                    </tr>
                    <%
                    Connection conn = dbconn.getConnection();
                    Statement stmt = conn.createStatement();

                    // Retrieve data from the invoice table
                    String query = "SELECT * FROM invoice ORDER BY invoice_date DESC";
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

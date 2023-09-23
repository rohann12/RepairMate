<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice Bill</title>
    <style>
        /* Reset some default styles for printing */
        @media print {
            body {
                margin: 0;
                padding: 0;
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
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="invoice-container">
        <div class="invoice-header">
            <h1>Invoice</h1>
        </div>
        <div class="bill-details">
            <div>
                <strong>Bill To:</strong><br>
                Customer Name<br>
                Address<br>
                City, Zip Code<br>
            </div>
            <div>
                <strong>Invoice Number:</strong> 12345<br>
                <strong>Invoice Date:</strong> September 22, 2023<br>
                <strong>Due Date:</strong> October 6, 2023<br>
            </div>
        </div>
        <table class="bill-items">
            <thead>
                <tr>
                    <th>Parts</th>
                    
                    <th> Price</th>
                    
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Item 1</td>
                    <td>2</td>
                    
                </tr>
                <tr>
                    <td>Item 2</td>
                    <td>3</td>
                    
                </tr>
            </tbody>
        </table>
        <div class="total">
            <strong>Total Amount:</strong> $190.00
        </div>
        <!-- Lines -->
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>
</body>
</html>

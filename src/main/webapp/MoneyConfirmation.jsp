<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Confirmation</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .confirmation-container {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        img {
            width: 200px;
            margin-bottom: 20px;
        }

        button {
            background: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: #0056b3;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="confirmation-container">
    <h2>Payment of Rs.<%= session.getAttribute("tempAmount") %> is being processed</h2>
    <img src="assets/QR.jpg" alt="QR Code">
    <form action="ConfirmPaymentServlet" method="post">
        <button type="submit">Paid</button>
    </form>
    <a href="index.jsp#portfolio">Go back to Home</a>
</div>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative; /* Allow absolute positioning inside body */
        }
        .container {
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .logout-button {
            background-color: #dc3545;
            position: absolute; /* Position the logout button in the top-right */
            top: 20px;
            right: 20px;
        }
        .logout-button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, Admin!</h1>
        <h2>@Sujal Pattewar</h2>
        <p>Manage your application from this dashboard.</p>
        <form action="adminshowuser.jsp" method="get">
            <button class="button">Show Users</button>
        </form>
    </div>
    <!-- Logout Button (positioned at the top-right corner) -->
    <form action="login.jsp" method="post">
        <button type="submit" class="button logout-button">Logout</button>
    </form>
</body>
</html>





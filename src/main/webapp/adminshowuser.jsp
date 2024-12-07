<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View and Manage Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .update-form input[type="password"] {
            padding: 5px;
        }
        .update-form button {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .update-form button:hover {
            background-color: #45a049;
        }
        .back-button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            margin-top: 20px;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <a href="admin.jsp" class="back-button">Back to Home</a>
    <h1>All Users</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Update Password</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carenet", "root", "sujal@123A");

                    String sql = "SELECT id, uname, upwd, uemail, umobile FROM users";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String uname = rs.getString("uname");
                        String upwd = rs.getString("upwd");
                        String uemail = rs.getString("uemail");
                        String umobile = rs.getString("umobile");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= uname %></td>
                <td><%= upwd %></td>
                <td><%= uemail %></td>
                <td><%= umobile %></td>
                <td>
                    <form class="update-form" action="updatePassword.jsp" method="POST">
                        <input type="hidden" name="id" value="<%= id %>">
                        <input type="password" name="newPassword" placeholder="New Password" required>
                        <button type="submit">Update</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </tbody>
    </table>
</body>
</html>

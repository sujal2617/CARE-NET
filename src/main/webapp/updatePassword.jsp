<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String newPassword = request.getParameter("newPassword");

    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carenet", "root", "sujal@123A");

        String sql = "UPDATE users SET upwd = ? WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, newPassword);
        stmt.setInt(2, id);

        int rowsUpdated = stmt.executeUpdate();
        if (rowsUpdated > 0) {
            response.getWriter().println("Password updated successfully!");
        } else {
            response.getWriter().println("Failed to update password.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
<a href="adminshowuser.jsp">Back to User List</a>

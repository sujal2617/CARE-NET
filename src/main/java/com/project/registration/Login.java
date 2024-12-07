package com.project.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uemail = request.getParameter("username");
        String upwd = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        if (uemail == null || uemail.equals("")) {
            request.setAttribute("status", "invalidemail");
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        } else if (upwd == null || upwd.equals("")) {
            request.setAttribute("status", "invalidUpwd");
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carenet?useSSL=false", "root", "sujal@123A");
                PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE uemail = ? AND upwd = ?");
                pst.setString(1, uemail);
                pst.setString(2, upwd);

                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    // Set the session attribute for the user
                    session.setAttribute("name", rs.getString("uname"));

                    // Check if the email matches the admin email
                    if ("sujalpattewar26@gmail.com".equals(uemail)) {
                        dispatcher = request.getRequestDispatcher("admin.jsp");  // Redirect to admin page
                    } else {
                        dispatcher = request.getRequestDispatcher("index.jsp"); // Redirect to default page
                    }
                } else {
                    request.setAttribute("status", "failed");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                }
                dispatcher.forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

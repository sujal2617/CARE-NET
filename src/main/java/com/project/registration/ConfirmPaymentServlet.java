package com.project.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ConfirmPaymentServlet")
public class ConfirmPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the temporary payment amount
        double amount = (Double) request.getSession().getAttribute("tempAmount");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Establish connection with the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carenet?useSSL=false", "root", "sujal@123A");

            // Prepare SQL query to insert the payment details into the money table
            String query = "INSERT INTO money (amount) VALUES (?)";
            pst = con.prepareStatement(query);

            // Set values for the PreparedStatement
            pst.setDouble(1, amount);

            // Execute the update
            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                // Successful payment record insertion
                request.setAttribute("status", "paymentSuccess");
            } else {
                // Failure in insertion
                request.setAttribute("status", "paymentFailed");
            }

            // Forward to the Money.jsp page for feedback
            request.getRequestDispatcher("Money.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print error to logs (better to log instead)
            request.setAttribute("status", "error");
            request.getRequestDispatcher("Money.jsp").forward(request, response);
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

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

@WebServlet("/TransportServlet")
public class TransportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form data
        String vehicleType = request.getParameter("vehicle_type");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        int members = Integer.parseInt(request.getParameter("members"));
        String helpRequired = request.getParameter("help_required");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Establish connection with the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carenet?useSSL=false", "root", "sujal@123A");

            // Prepare SQL query to insert the data into the transport table
            String query = "INSERT INTO transporty (vehicle_type, capacity, members, help_required) VALUES (?, ?, ?, ?)";
            pst = con.prepareStatement(query);

            // Set values for the PreparedStatement
            pst.setString(1, vehicleType);
            pst.setInt(2, capacity);
            pst.setInt(3, members);
            pst.setString(4, helpRequired);

            // Execute the update
            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                // Successful insertion
                request.setAttribute("status", "donationSuccess");
            } else {
                // Failure in insertion
                request.setAttribute("status", "donationFailed");
            }

            // Forward to the JSP page for feedback
            request.getRequestDispatcher("Transport.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print error to logs (better to log instead)
            request.setAttribute("status", "error");
            request.getRequestDispatcher("Transport.jsp").forward(request, response);
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

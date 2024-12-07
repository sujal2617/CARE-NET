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

@WebServlet("/FoodServlet")
public class FoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form data
        String foodName = request.getParameter("food_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String donorName = request.getParameter("donor_name");
        String contactNumber = request.getParameter("contact_number");
        String donationDate = request.getParameter("donation_date");
        String expiryDate = request.getParameter("expiry_date");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Establish connection with the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carenet?useSSL=false", "root", "sujal@123A");

            // Prepare SQL query to insert the data into the food table
            String query = "INSERT INTO food (food_name, quantity, donor_name, contact_number, donation_date, expiry_date) VALUES (?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);

            // Set values for the PreparedStatement
            pst.setString(1, foodName);
            pst.setInt(2, quantity);
            pst.setString(3, donorName);
            pst.setString(4, contactNumber);
            pst.setString(5, donationDate);
            pst.setString(6, expiryDate);

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
            request.getRequestDispatcher("Food.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print error to logs (better to log instead)
            request.setAttribute("status", "error");
            request.getRequestDispatcher("Food.jsp").forward(request, response);
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
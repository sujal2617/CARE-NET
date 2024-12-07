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

@WebServlet("/HouseholdServlet")
public class HouseholdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form data
        String itemName = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String condition = request.getParameter("item_condition"); // changed to item_condition
        String donorName = request.getParameter("donor_name");
        String contactNumber = request.getParameter("contact_number");
        String donationDate = request.getParameter("donation_date");
        
        Connection con = null;
        PreparedStatement pst = null;
        
        try {
            // Establish connection with the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carenet?useSSL=false", "root", "sujal@123A");
            
            // Prepare SQL query to insert the data into the household table
            String query = "INSERT INTO household (item_name, quantity, item_condition, donor_name, contact_number, donation_date) VALUES (?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);
            
            // Set values for the PreparedStatement
            pst.setString(1, itemName);
            pst.setInt(2, quantity);
            pst.setString(3, condition);
            pst.setString(4, donorName);
            pst.setString(5, contactNumber);
            pst.setString(6, donationDate);
            
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
            request.getRequestDispatcher("Household.jsp").forward(request, response);
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print error to logs (better to log instead)
            request.setAttribute("status", "error");
            request.getRequestDispatcher("Household.jsp").forward(request, response);
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

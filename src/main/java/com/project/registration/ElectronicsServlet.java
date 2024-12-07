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

@WebServlet("/ElectronicsServlet")
public class ElectronicsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form data
        String itemName = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String donorName = request.getParameter("donor_name");
        String contactNumber = request.getParameter("contact_number");
        String donationDate = request.getParameter("donation_date");
        String condition = request.getParameter("itom_condition");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Establish connection with the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carenet?useSSL=false", "root", "sujal@123A");

            // Prepare SQL query to insert the data into the electronics table
            String query = "INSERT INTO electronics (item_name, quantity, donor_name, contact_number, donation_date, itom_condition) VALUES (?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);

            // Set values for the PreparedStatement
            pst.setString(1, itemName);
            pst.setInt(2, quantity);
            pst.setString(3, donorName);
            pst.setString(4, contactNumber);
            pst.setString(5, donationDate);
            pst.setString(6, condition);

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
            request.getRequestDispatcher("Electronics.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print error to logs (better to log instead)
            request.setAttribute("status", "error");
            request.getRequestDispatcher("Electronics.jsp").forward(request, response);
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

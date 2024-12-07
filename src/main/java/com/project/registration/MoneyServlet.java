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

@WebServlet("/MoneyServlet")
public class MoneyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        double amount = Double.parseDouble(request.getParameter("amount"));

        // Store the payment information temporarily
        request.getSession().setAttribute("tempAmount", amount);

        // Redirect to the confirmation page with the amount
        response.sendRedirect("MoneyConfirmation.jsp");
    }
}

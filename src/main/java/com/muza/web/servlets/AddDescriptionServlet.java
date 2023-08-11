package com.muza.web.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddDescriptionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection connection = (Connection) session.getAttribute("connection");
        
        String description = request.getParameter("description");
        String name = (String) session.getAttribute("band_name");

        try {
        	String addQuery = "UPDATE band SET description = ? WHERE name = ?";
            PreparedStatement add = connection.prepareStatement(addQuery);
            add.setString(1, description);
            add.setString(2, name);
            add.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }


        response.sendRedirect("Primal");
    }

}

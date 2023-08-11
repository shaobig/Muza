package com.muza.web.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muza.web.entities.Band;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection connection = (Connection) session.getAttribute("connection");

        String name = request.getParameter("name");
        int foundedYear = Integer.parseInt(request.getParameter("founded"));
        String country = request.getParameter("country");
        String genre = request.getParameter("genre");

        Band oldBand = (Band) session.getAttribute("old_band");
        Band newBand = new Band(name, foundedYear, country, genre);

        try {
            String editQuery = "UPDATE band SET name = ?, founded = ?, origin = ?, genre = ? WHERE name = ?";
            PreparedStatement edit = connection.prepareStatement(editQuery);
            edit.setString(1, (oldBand.getName() == newBand.getName()) || (newBand.getName() == null) ? oldBand.getName() : newBand.getName());
            edit.setInt(2, (oldBand.getFoundedYear() == newBand.getFoundedYear()) || (newBand.getFoundedYear() == 0) ? oldBand.getFoundedYear() : newBand.getFoundedYear());
            edit.setString(3, (oldBand.getCountry() == newBand.getCountry()) || (newBand.getCountry() == null) ? oldBand.getCountry() : newBand.getCountry());
            edit.setString(4, (oldBand.getGenre() == newBand.getGenre()) || (newBand.getGenre() == null) ? oldBand.getGenre() : newBand.getGenre());
            edit.setString(5, oldBand.getName());
            edit.executeUpdate();

        } catch (SQLException e) {

        }


        response.sendRedirect("/Muza/main");
    }

}

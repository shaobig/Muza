package com.muza.web.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muza.web.entities.Band;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

public class AddServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int foundedYear = Integer.parseInt(request.getParameter("founded"));
        String country = request.getParameter("country");
        String genre = request.getParameter("genre");
        Band band = new Band(name,foundedYear,country,genre);


        request.setAttribute("new_band", band);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/main");
        dispatcher.forward(request, response);
    }

}

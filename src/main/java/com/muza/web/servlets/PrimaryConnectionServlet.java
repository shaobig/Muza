package com.muza.web.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class PrimaryConnectionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String URL = "jdbc:postgresql://localhost:5432/muzadb";
        String name = "postgres";
        String password = "postgres";

        PrintWriter writer = response.getWriter();

        try {
            Class.forName("org.postgresql.Driver");

        } catch (ClassNotFoundException e) {
            writer.println("Could not download the database driver!");
        }

        Connection connection = null;

        try {
            connection = DriverManager.getConnection(URL, name, password);

        } catch (SQLException e) {
            writer.println("Could not connect to the database!");
        }

        Statement statement = null;

        try {
            statement = connection.createStatement();

        } catch (SQLException e) {
            writer.println("Could not connect to the database!");
        }

        try {
            statement.executeUpdate("CREATE TABLE IF NOT EXISTS band("
                    + " id SERIAL PRIMARY KEY,"
                    + " name VARCHAR(50),"
                    + " founded INT,"
                    + " origin VARCHAR(50),"
                    + " genre VARCHAR(30),"
                    + " description TEXT"
                    + " );");
        } catch (SQLException e) {
            writer.println("Could not refer to the database!");
        }


        HttpSession session = request.getSession();
        session.setAttribute("connection", connection);
        session.setAttribute("statement", statement);
        response.sendRedirect("main");
    }

}

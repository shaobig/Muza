<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <style type="text/css">
         <%@include file="css/index.css"%>
      </style>
      <title>Edit <%=request.getParameter("band")%> info</title>
   </head>
   <body>
      <%
      Connection connection = (Connection)session.getAttribute("connection");
      Statement statement = (Statement)session.getAttribute("statement");
      
      ResultSet oldBandQuery = statement.executeQuery("SELECT * FROM band WHERE name = '" + request.getParameter("band") + "'");
      oldBandQuery.next();
         
      String oldName = oldBandQuery.getString(2); int oldYearFounded = oldBandQuery.getInt(3); String oldCountry = oldBandQuery.getString(4); String oldGenre = oldBandQuery.getString(5);
      session.setAttribute("old_band",	new Band(oldName,oldYearFounded,oldCountry,oldGenre));		
      %>
      <a href = "/Muza/main">Main page</a>
      <form action = "edit_band" method = "get">
         <table id = "add_table">
            <tr>
               <td>Band name: <input type = "text" name = "name" required pattern = "[a-zA-Zа-яА-Я0-9 ]*"></td>
            </tr>
            <tr>
               <td>Founded in: <input type = "number" name = "founded" pattern = "[0-9]*"></td>
            </tr>
            <tr>
               <td>Country: <input type = "text" name = "country" pattern = "[a-zA-Z ]*"></td>
            </tr>
            <tr>
               <td>Genre: <input type = "text" name = "genre" pattern = "[a-zA-Z0-9 ]*"></td>
            </tr>
            <tr>
               <td><input type = "submit" value = "Send data"></td>
            </tr>
         </table>
      </form>
   </body>
   
   
   <%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%@ page import = "java.sql.*" %>
   <%@ page import = "com.muza.web.entities.Band" %>
   
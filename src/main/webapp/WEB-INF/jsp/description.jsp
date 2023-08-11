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
         Statement statement = (Statement)session.getAttribute("statement"); 
         ResultSet description = statement.executeQuery("SELECT description FROM band WHERE name = '" + request.getParameter("band") + "'");
         session.setAttribute("band_name", request.getParameter("band"));
         description.next();
      %>
      <a href = "/Muza/main">Main page</a>
      <form action = "add_description" method = "get">
         <table id = "add_table">
            <tr>
               <td><textarea name = "description" rows = '20' cols = '125'><%=description.getString(1)%></textarea></td>
            </tr>
            <tr>
               <td><input type = "submit" value = "Send data"></td>
            </tr>
         </table>
      </form>
   </body>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ page import = "java.sql.*" %>
   <%@ page import = "com.muza.web.entities.Band" %>
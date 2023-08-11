<!DOCTYPE html>
<html lang="ru">
   <head>
      <meta charset="utf-8" />
      <style type="text/css">
         <%@include file="css/band.css"%>
      </style>
      <title><%=request.getParameter("name")%></title>
   </head>
   <body>
      <div id="wrapper">
         <div id="header">
            <h1><%=request.getParameter("name").toUpperCase()%></h1>
         </div>
         <div id="sidebar">
            <a href = "/Muza/main">Main page</a><br>
            <a href = "/Muza/edit?band=<%=request.getParameter("name")%>">Edit info</a>
         </div>
         <div id="content">
         <%
            Statement statement = (Statement)session.getAttribute("statement"); 
            ResultSet description = statement.executeQuery("SELECT description FROM band WHERE name = '" + request.getParameter("name") + "'");
            description.next();
            
            if (description.getString(1) != null) {
            	
            	out.println("<p>" + description.getString(1) + "</p>");
            	
            }
            else {
            	
            	out.println("<i>Oops, looks like there's no band's description</i><br>");
               
               }
               
               out.println("<a href = \"/Muza/description?band=" + request.getParameter("name") + "\">Add a description</a>");
  
         %>
         </div>
         <div class="clear"></div>
         <div id="footer">
            <p class="vip"><strong>AI-171 is a power!</strong></p>
            <p class="name"><strong>Roman B. Sergey K. Alexander P.</strong></p>
         </div>
      </div>
   </body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.muza.web.entities.Band" %>


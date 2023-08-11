<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <style type="text/css">
         <%@include file="css/index.css"%>
      </style>
      <title>Muza</title>
   </head>
   <body>
      <div id = "table">
         <a href = "/Muza/add">Add new band</a>
         <table>
            <tr>
               <th>No.</th>
               <th>Band</th>
               <th>Founded</th>
               <th>Origin</th>
               <th>Genre</th>
            </tr>
            <%
	           Connection connection = (Connection)session.getAttribute("connection");
	           Statement statement = (Statement)session.getAttribute("statement");
            
               if (request.getAttribute("new_band") != null) {
               
               Band band = (Band)request.getAttribute("new_band");
               
               String dublicateQuery = "SELECT * FROM band WHERE name = ?";
               
               PreparedStatement dublicate = connection.prepareStatement(dublicateQuery,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
               dublicate.setString(1,band.getName());
                   
               
               ResultSet count = dublicate.executeQuery();
               
               if (!count.first()) {
	               String queryPattern = "INSERT INTO band (name,founded,origin,genre) VALUES (?,?,?,?)";
	          
	               PreparedStatement restat = connection.prepareStatement(queryPattern);         
	               restat.setString(1, band.getName());       
	               restat.setInt(2, band.getFoundedYear());     
	               restat.setString(3, band.getCountry());      
	               restat.setString(4, band.getGenre()); 
	               restat.executeUpdate();
	               
	               
	               request.setAttribute("new_band", null);  
               }
               
               else {
               
               	out.println("<i>This band has already been added to the database!<i>");
               
               }
               
               }
               
               
               ResultSet entire = statement.executeQuery("SELECT * FROM band ORDER BY name");
               
               if (entire == null) {
               
               out.println("There's no data in the table. Please, add more bands' info!");
               
               }
               
               else {
               
	               int i = 1;
	               
	               while (entire.next()) {
		               out.println("<tr>");
		               out.println("<td>" + i + "</td>");
		               out.println
		               ("<td><a href = \"/Muza/band?name=" + entire.getString("name") + 
		               "\">" + entire.getString("name") + "</a></td>"); 
		               out.println("<td>" + entire.getString("founded") + "</td>");
		               out.println("<td>" + entire.getString("origin") + "</td>"); 
		               out.println("<td>" + entire.getString("genre") + "</td>");
		               out.println("</tr>");
		               i++;
	               }
	               
	               }
               
               %>
         </table>
      </div>
   </body>
</html>


<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.muza.web.entities.Band" %>
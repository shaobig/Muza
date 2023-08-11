<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <style type="text/css">
         <%@include file="css/index.css"%>
      </style>
      <title>Add new band</title>
   </head>
   <body>
      <a href = "/Muza/main">Main page</a>
      <form action = "add_band" method = "get">
         <table id = "add_table">
            <tr>
               <td>Band name: <input type = "text" name = "name" required pattern = "[a-zA-Zа-яА-Я0-9 ]{1,50}"></td>
            </tr>
            <tr>
               <td>Founded in: <input type = "number" name = "founded" pattern = "[0-9]{4}"></td>
            </tr>
            <tr>
               <td>Country: <input type = "text" name = "country" pattern = "[a-zA-Z ]{1,50}"></td>
            </tr>
            <tr>
               <td>Genre: <input type = "text" name = "genre" pattern = "[a-zA-Z0-9 ]{1,30}"></td>
            </tr>
            <tr>
               <td><input type = "submit" value = "Send data"></td>
            </tr>
         </table>
      </form>
   </body>
   <%@ page import = "java.sql.*" %>
   
   
   <%
   
   Statement statement = (Statement)session.getAttribute("statement");
   
   %>
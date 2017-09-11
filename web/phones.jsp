<%-- 
    Document   : phones
    Created on : Apr 2, 2017, 12:08:35 PM
    Author     : toshiba
--%>

<%@page import = "java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phones List</title>
    </head>
    <body>
            <center>

        <h1>Phones List</h1>
        <%!
            public class Actor{
                String URL = "jdbc:mysql://localhost:3306/hani";
                String USERNAME = "root";
                String PASSWORD = "Ray-07767767";
                
                Connection connection = null;
                PreparedStatement selectActors = null;
                ResultSet resultSet = null;
                
                public Actor(){
                    try{
                        connection = DriverManager.getConnection(URL, USERNAME,PASSWORD);
                        selectActors = connection.prepareStatement("SELECT ph_id,ph_name,ph_type,ph_memory,ph_color,price FROM phones");
                        
                    }catch(SQLException e){
                        e.printStackTrace();
                    }
                }
                
                public ResultSet getActors(){
                    
                    try{
                        resultSet = selectActors.executeQuery();
                    }catch(SQLException e){
                        e.printStackTrace();
                        
                }
                    return resultSet;
                        
            }
            }
        %>
        <%
            Actor actor = new Actor();
            ResultSet actors = actor.getActors();
        %>
        <table border="1">
            
            <tbody>
                <tr>
                    <td>Phone ID </td>
                    <td>Phone name </td>
                    <td>Phone type </td>
                    <td>Phone memory </td>
                    <td>Phone color </td>
                    <td>Phone price </td>
                    
                    
                </tr>
                <% while (actors.next()) { %>
                <tr>
                    <td><%= actors.getInt("ph_id")%></td>
                    <td><%= actors.getString("ph_name")%></td>
                    <td><%= actors.getString("ph_type")%></td>
                    <td><%= actors.getString("ph_memory")%></td>
                    <td><%= actors.getString("ph_color")%></td>
                    <td><%= actors.getString("price")%></td>
                    
                    <td><a href="buyph.jsp">Buy </a></td>
                    
                    
                    
                </tr>
                <% } %>
                
            </tbody>
        </table><br><br>
            
    </center>
    </body>
</html>

<%-- 
    Document   : buyacce2
    Created on : Apr 2, 2017, 11:48:10 AM
    Author     : toshiba
--%>

<%@page import = "java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accessories List</title>
    </head>
    <body>
            <center>

        <h1>Accessories List</h1>
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
                        selectActors = connection.prepareStatement("SELECT a_id,a_name,a_type,a_color,price FROM acce");
                        
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
                    <td>Accessories ID </td>
                    <td>Accessories name </td>
                    <td>Accessories type </td>
                    <td>Accessories color </td>
                    <td>price </td>
                    
                    
                </tr>
                <% while (actors.next()) { %>
                <tr>
                    <td><%= actors.getInt("a_id")%></td>
                    <td><%= actors.getString("a_name")%></td>
                    <td><%= actors.getString("a_type")%></td>
                    <td><%= actors.getString("a_color")%></td>
                    <td><%= actors.getString("price")%></td>
                    
                   
                    
                    
                    
                </tr>
                <% } %>
                
            </tbody>
        </table><br>
        <form action="buyacce3" method="POST">
            <h2>Please complete the following:</h2><br><br>
            <h2>Accessories ID</h2> <input type="text" name="aid" value="" size="50" /><br>
        <h2>Accessories Name</h2> <input type="text" name="cname" value="" size="50" /><br>
        <h2>Accessories Price</h2> <input type="text" name="aprice" value="" size="50" /><br>
        <h2>Customer Name</h2> <input type="text" name="name" value="" size="50" /><br>
        <h2>Quantity</h2> <input type="text" name="num" value="" size="50" /><br><br>
        
            <input type="submit" value="Buy now!" />
        </form>
    </center>
    </body>
</html>

<%-- 
    Document   : buyph2
    Created on : Apr 2, 2017, 12:28:16 PM
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
                    
                    
                    
                    
                    
                </tr>
                <% } %>
                
            </tbody>
        </table><br>
        <form action="buyph3" method="POST">
            <h2>Please complete the following:</h2><br><br>
            <h2>Phone ID</h2> <input type="text" name="pid" value="" size="50" /><br>
        <h2>Phone Name</h2> <input type="text" name="cname" value="" size="50" /><br>
        <h2>Phone Price</h2> <input type="text" name="pprice" value="" size="50" /><br>
        <h2>Phone Type</h2> <input type="text" name="ctype" value="" size="50" /><br>
        <h2>Customer Name</h2> <input type="text" name="name" value="" size="50" /><br>
        <h2>Quantity</h2> <input type="text" name="num" value="" size="50" /><br><br>
        
            <input type="submit" value="Buy now!" />
        </form>
    </center>
    </body>
</html>


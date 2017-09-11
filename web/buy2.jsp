<%-- 
    Document   : buy2
    Created on : Apr 1, 2017, 12:38:18 PM
    Author     : toshiba
--%>

<%@page import = "java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Computer List</title>
    </head>
    <body>
            <center>

        <h1>Computer List</h1>
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
                        selectActors = connection.prepareStatement("SELECT pc_id,pc_name,memory,harddisk,cpu,price FROM comp");
                        
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
                    <td>Computer ID </td>
                    <td>Computer name </td>
                    <td>Memory </td>
                    <td>Hard disk </td>
                    <td>Cpu </td>
                    <td>Price </td>
                   
                    
                    
                </tr>
                <% while (actors.next()) { %>
                <tr>
                    <td><%= actors.getInt("pc_id")%></td>
                    <td><%= actors.getString("pc_name")%></td>
                    <td><%= actors.getString("memory")%></td>
                    <td><%= actors.getString("harddisk")%></td>
                    <td><%= actors.getString("cpu")%></td>
                    <td><%= actors.getInt("price")%></td>
                    
                    
                    
                </tr>
                <% } %>
                
            </tbody>
        </table><br>
        <form action="buy3" method="POST">
            <h2>Please complete the following:</h2><br><br>
            <h2>Computer ID</h2> <input type="text" name="cid" value="" size="50" /><br>
        <h2>Computer Name</h2> <input type="text" name="cname" value="" size="50" /><br>
        <h2>Computer Price</h2> <input type="text" name="cprice" value="" size="50" /><br>
        <h2>Customer Name</h2> <input type="text" name="name" value="" size="50" /><br>
        <h2>Quantity</h2> <input type="text" name="num" value="" size="50" /><br><br>
        
            <input type="submit" value="Buy now!" />
        </form>
    </center>
    </body>
</html>
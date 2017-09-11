<%-- 
    Document   : computer
    Created on : Apr 1, 2017, 11:10:09 AM
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
                    <td>Select </td>
                    
                    
                </tr>
                <% while (actors.next()) { %>
                <tr>
                    <td><%= actors.getInt("pc_id")%></td>
                    <td><%= actors.getString("pc_name")%></td>
                    <td><%= actors.getString("memory")%></td>
                    <td><%= actors.getString("harddisk")%></td>
                    <td><%= actors.getString("cpu")%></td>
                    <td><%= actors.getInt("price")%></td>
                    <td><a href="buy.jsp">Buy </a></td>
                    
                    
                    
                </tr>
                <% } %>
                
            </tbody>
        </table><br><br>
            
    </center>
    </body>
</html>
<%-- 
    Document   : index
    Created on : Apr 8, 2017, 3:24:09 PM
    Author     : toshiba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <body>
        <h2 align="center" style="color:red;">
        <%
              
            if(request.getParameter("mode")!=null){
                if(request.getParameter("mode").equals("invalid_login")){
                    out.println("Login Failed check your username and password | Try again!");
                }
            }
               
        %>
        </h2>
        <form action="Login" method="POST">
            <table border="2" cellpadding="5" cellspacing="6" width="40%" align="center">
                   <tr>
                       <th colspan="6" align="center" style="color: white;background: indianred"><h1>Admin Login Form</h1></th>
                </tr>
                <tr> 
                    <th align ="right">Username:</th>
                    <td><input type ="text" name="txtuser"></td>
                </tr>
                <tr> 
                    <th align ="right">Password:</th>
                    <td><input type ="password" name="txtpass"> </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Login" name="submit" />
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class insert_ph extends HttpServlet {
Connection connection = null;
     String URL = "jdbc:mysql://localhost:3306/hani";
     String USERNAME = "root";
     String PASSWORD = "Ray-07767767";
     PreparedStatement pst = null;
     String phid = null;
     String phname = null;
     String phtype = null;
     String phmemory = null;
     String phcolor = null;
     String price = null;
     
     public void init(){
       try{
           Class.forName("com.mysql.jdbc.Driver");
           connection = DriverManager.getConnection(URL, USERNAME,PASSWORD);
       }catch(Exception e){
           System.out.println("Error");
       }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
            phid =  request.getParameter("ph_id");
            phname = request.getParameter("ph_name");
            phtype = request.getParameter("ph_type");
            phmemory = request.getParameter("ph_memory");
            phcolor = request.getParameter("ph_color");
            price = request.getParameter("ph_price");
            
            
            String strQuery = ("insert into phones (ph_id,ph_name,ph_type,ph_memory,ph_color,price)"
        + " values (?, ?, ?,?,?,?)");
                                            pst = connection.prepareStatement(strQuery);
                                            pst.setString(1, phid);
                                            pst.setString(2, phname);
                                            pst.setString(3, phtype);
                                            pst.setString(4, phmemory);
                                            pst.setString(5, phcolor);          
                                            
                                            
                                            pst.setString(6, price);
                                             pst.executeUpdate();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet pc_insert</title>");            
            out.println("</head>");
            out.println("<body>");
           out.println("<center>");
            out.println("<h1>Congratulations!</h1><br><br>");
            out.println("<h2>Dear " +request.getParameter("u_name")+",<br><br>You have chosen  to sell " +request.getParameter("ph_name")+" phone " +request.getParameter("ph_type")+" type " +request.getParameter("ph_memory")+" memory size ,  and " +request.getParameter("ph_color")+ " color .<br>\n" +
"        Your request has been finalized.Kindly settle the total amount of " +request.getParameter("ph_price")+"$ .Thank you for using our Web application to sold your items!<br> We will let you know if some one is interested in your post!</h2>");
            out.println("<form action=menu.html method=POST>");
            out.println("<input type=submit value= Menu />");
            out.println("</center>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
            
            } catch (SQLException ex) {
            Logger.getLogger(insert_ph.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

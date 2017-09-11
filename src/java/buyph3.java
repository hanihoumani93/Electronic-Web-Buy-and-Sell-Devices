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
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class buyph3 extends HttpServlet {

    Connection connection = null;
     String URL = "jdbc:mysql://localhost:3306/hani";
     String USERNAME = "root";
     String PASSWORD = "Ray-07767767";
     PreparedStatement pst = null;
     String pricee = null;
     String id=null;
      public void init(){
       try{
           Class.forName("com.mysql.jdbc.Driver");
           connection = DriverManager.getConnection(URL, USERNAME,PASSWORD);
           
       }catch(Exception e){
           System.out.println("Error");
       }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         int qnt = Integer.parseInt(request.getParameter("num"));
         int price = Integer.parseInt(request.getParameter("pprice"));
       int total = 0;
        try  {
            
            id= request.getParameter("pid");
            Statement stmt = connection.createStatement();
            stmt.execute("DELETE FROM phones WHERE ph_id='"+id+"'");
            
            if(request.getParameter("cname").equals("iphone")){
       total = price * qnt;
       HttpSession sess = request.getSession(); 
       sess.setAttribute("total", total);
       
       
    }
            if(request.getParameter("cname").equals("Samsung")){
       total = price * qnt;
       HttpSession sess = request.getSession(); 
       sess.setAttribute("total", total);
       
       
    }
            if(request.getParameter("cname").equals("Nokia")){
       total = price * qnt;
       HttpSession sess = request.getSession(); 
       sess.setAttribute("total", total);
       
       
    }
            if(request.getParameter("cname").equals("LG")){
       total = price * qnt;
       HttpSession sess = request.getSession(); 
       sess.setAttribute("total", total);
      
       
    }
                         
                       
                       
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            
            out.println("</head>");
            out.println("<body>");
            
            
            
            out.println("<tbody>");
            out.println("<center>");
            out.println("<h1>Billing Information</h1><br><br>");
            out.println("<h2>Dear " +request.getParameter("name")+",<br><br>You have chosen to go to buy " +request.getParameter("num")+" " +request.getParameter("cname")+" " +request.getParameter("ctype")+" Phone(s).<br>\n" +
"        Your request has been finalized.Kindly settle the total amount of " +total+"$ .Thank you for Shopping on our Web application!</h2>");
            out.println("<form action=menu.html method=POST>");
            out.println("<input type=submit value= Menu />");
            out.println("</form>");
            out.println("</center>");
            out.println("</body>");
            out.println("</html>");
            
            
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(buyph3.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(buyph3.class.getName()).log(Level.SEVERE, null, ex);
        }
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

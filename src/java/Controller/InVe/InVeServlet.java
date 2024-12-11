/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.InVe;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class InVeServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InVeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InVeServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        
          request.getRequestDispatcher("inVe.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);

        String malt = request.getParameter("malt");
        String ga_kh = request.getParameter("ga_kh");
        String ga_den = request.getParameter("ga_den");
        String name = request.getParameter("namekh");
        String cmt = request.getParameter("cmt");
        String ngay_kh = request.getParameter("ngay_kh");
        String time_kh = request.getParameter("time_kh");
        String loai_ve = request.getParameter("loai_ve");
        String soghe = request.getParameter("soghe");
        String giave = request.getParameter("giave");
        
        request.setAttribute("matau", malt);
        request.setAttribute("ga_kh", ga_kh);
        request.setAttribute("ga_den", ga_den);
        request.setAttribute("namekh", name);
        request.setAttribute("cmt", cmt);
        request.setAttribute("ngay_kh", ngay_kh);
        request.setAttribute("time_kh", time_kh);
        request.setAttribute("loai_ve", loai_ve);
        request.setAttribute("soghe", soghe);
        request.setAttribute("giave", giave);
        
        request.getRequestDispatcher("inVe.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

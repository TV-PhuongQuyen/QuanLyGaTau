/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.LichTrinh;

import Model.LichTrinh;
import DAO.LichTrinhDAO;
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
public class SuaLichTrinh extends HttpServlet {
   
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
            out.println("<title>Servlet SuaLichTrinh</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SuaLichTrinh at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
        LichTrinhDAO dao = new LichTrinhDAO();
        String idLichTrinh = request.getParameter("id_lt");
        int malt = 0;
        malt = Integer.parseInt(idLichTrinh);
        String idTau = request.getParameter("idTauSua");
          int maTau = 0;
        maTau = Integer.parseInt(idTau);
        String gaKH = request.getParameter("gaKhoiHanh");
        String gaDen = request.getParameter("gaDen");
        String timeKH = request.getParameter("timeKhoiHanh");
        String timeDen = request.getParameter("timeDen");
        String ngayKH = request.getParameter("ngayKhoiHanh");
        String ngayDen = request.getParameter("ngayDen");
        String trangThai = request.getParameter("trangThaiSua");
        
        LichTrinh lt = new LichTrinh(malt, maTau, gaKH, gaDen, timeKH, timeDen, ngayKH, ngayDen, trangThai);
        boolean success = dao.suaLichTrinh(lt);
        response.sendRedirect("QuanLyLichTrinhServlet");
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

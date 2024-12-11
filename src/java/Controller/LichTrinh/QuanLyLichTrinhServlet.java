/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.LichTrinh;

import DAO.LichTrinhDAO;
import Model.LichTrinh;
import Model.Tau;

import DAO.LichTrinhDAO;
import DAO.TauDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class QuanLyLichTrinhServlet extends HttpServlet {
   
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
            out.println("<title>Servlet QuanLyLichTrinhServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuanLyLichTrinhServlet at " + request.getContextPath () + "</h1>");
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
        LichTrinhDAO dao = new LichTrinhDAO();
        List<LichTrinh> list = dao.LayDuLieuDaDuyet();
        request.setAttribute("getDuLieu", list);
   
        List<LichTrinh> list1 = dao.LayDuLieuChuaDuyet();
        request.setAttribute("getDuLieu1", list1);
   
        TauDAO daoTau = new TauDAO();
        List<Tau> listTau = daoTau.LayDuLieuTauDaDuyet();
        request.setAttribute("getTauDuyet", listTau);
        
        request.getRequestDispatcher("QuanLyLichTrinh.jsp").forward(request, response);
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
      String[] idTauArray = request.getParameterValues("lichtrinhid");
        LichTrinhDAO dao = new LichTrinhDAO();
        if (idTauArray != null && idTauArray.length > 0) {
            
            ArrayList<String> idTauList = new ArrayList<>();
            
            // Chuyển mảng sang ArrayList
            for (String id : idTauArray) {
                idTauList.add(id);
            }
            
            // Gọi hàm xóa tàu
            boolean xoaThanhCong = dao.XoaNhieuLichTrinh(idTauList);
           if (xoaThanhCong) {
            request.getSession().setAttribute("successMessage", "Xóa thành công các tàu đã chọn!");
        } else {
            request.getSession().setAttribute("errorMessage", "Không thể xóa các tàu. Vui lòng thử lại!");
        }
    } else {
        request.getSession().setAttribute("errorMessage", "Vui lòng chọn ít nhất một tàu để xóa!");
    }

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

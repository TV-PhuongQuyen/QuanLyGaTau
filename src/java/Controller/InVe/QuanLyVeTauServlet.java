/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.InVe;

import DAO.KhachHangDAO;
import Model.KhachHang;
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
public class QuanLyVeTauServlet extends HttpServlet {
   
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
            out.println("<title>Servlet QuanLyVeTauServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuanLyVeTauServlet at " + request.getContextPath () + "</h1>");
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
        KhachHangDAO kh = new KhachHangDAO();
        List<KhachHang> list = kh.HienThiVeDaDuyet();
        List<KhachHang> list1 = kh.HienThiVeCho();
 
         request.setAttribute("daDuyetList", list);
        request.setAttribute("choduyet", list1);
        request.getRequestDispatcher("QuanLyVeTau.jsp").forward(request, response);
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
         String[] idTauArray = request.getParameterValues("veTauid");
       
        KhachHangDAO dao = new KhachHangDAO();
        if (idTauArray != null && idTauArray.length > 0) {
            
            ArrayList<String> idTauList = new ArrayList<>();
            
            // Chuyển mảng sang ArrayList
            for (String id : idTauArray) {
                idTauList.add(id);
            }
            
            // Gọi hàm xóa tàu
            boolean xoaThanhCong = dao.XoaNhieuVeTau(idTauList);
           if (xoaThanhCong) {
            request.getSession().setAttribute("successMessage", "Xóa thành công các tàu đã chọn!");
        } else {
            request.getSession().setAttribute("errorMessage", "Không thể xóa các tàu. Vui lòng thử lại!");
        }
    } else {
        request.getSession().setAttribute("errorMessage", "Vui lòng chọn ít nhất một tàu để xóa!");
    }

            response.sendRedirect("QuanLyVeTauServlet");
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

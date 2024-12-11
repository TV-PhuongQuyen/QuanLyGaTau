/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.DangNhapDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
public class User_Serlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet User_Serlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet User_Serlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DangNhapDAO dangnhapDao = new DangNhapDAO();
        User user = dangnhapDao.dangNhap(email, password);
        if(user != null){
             request.getRequestDispatcher("TrangChu.jsp").forward(request, response);
        }
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
         String email = request.getParameter("email_dk");
        String password = request.getParameter("password_dk");
        DangNhapDAO dangNhapDao = new DangNhapDAO();

        // Kiểm tra xem email đã tồn tại hay chưa
        User existingUser = dangNhapDao.KiemTraEmail(email);
        if (existingUser != null) {
            // Nếu email đã tồn tại, hiển thị thông báo lỗi
            request.setAttribute("errorMessage", "Email đã tồn tại! Vui lòng sử dụng email khác.");
            request.getRequestDispatcher("DangKy.jsp").forward(request, response);
        } else {
            // Nếu email chưa tồn tại, tiến hành đăng ký
            boolean isRegistered = dangNhapDao.dangKy(email, password);
            if (isRegistered) {
                
                response.sendRedirect("DangNhap.jsp");
            } else {
                // Đăng ký thất bại, hiển thị thông báo lỗi
                request.setAttribute("errorMessage", "Đăng ký thất bại! Vui lòng thử lại.");
                request.getRequestDispatcher("DangKy.jsp").forward(request, response);
            }
        }
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.SoGhe;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.SoGheDAO;
import DAO.TauDAO;
import Model.SoGhe;
import Model.Tau;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class SoGheTauServlet extends HttpServlet {
    SoGheDAO dao = new SoGheDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SoGheTauServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SoGheTauServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("id_tau");
        TauDAO daos = new TauDAO();
        
        List<Tau> taulist  = daos.LayDuLieuTauDaDuyet();
        request.setAttribute("getTau", taulist);
        
        List<SoGhe> listSoGhe = dao.SoGheTau(id);
        request.setAttribute("getGhe", listSoGhe);
        
        List<SoGhe> list = dao.LayDuLieuGhe();
        request.setAttribute("getSoGhe", list);
        
        
        request.getRequestDispatcher("QuanLyGhe.jsp").forward(request, response);
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         String[] idGheArray = request.getParameterValues("idGhe");
          String idTau = request.getParameter("idTau"); // ID tàu để hiển thị ghế

        if (idGheArray != null && idGheArray.length > 0) {
            // Nếu có checkbox được chọn, thực hiện xóa ghế
            ArrayList<String> idSoList = new ArrayList<>();
            
            // Chuyển mảng sang danh sách
            for (String id : idGheArray) {
                idSoList.add(id);
            }
            
            // Gọi hàm DAO để xóa ghế
            boolean xoaThanhCong = dao.XoaNhieuGhe(idSoList);
            if (xoaThanhCong) {
                request.getSession().setAttribute("successMessage", "Xóa thành công các ghế đã chọn!");
            } else {
                request.getSession().setAttribute("errorMessage", "Không thể xóa các ghế. Vui lòng thử lại!");
            }
                } else if (idTau != null && !idTau.isEmpty()) {
                    // Nếu có `idTau`, hiển thị danh sách số ghế theo tàu
                    
                } else {
                    // Trường hợp không chọn checkbox hoặc không cung cấp idTau
                    request.getSession().setAttribute("errorMessage", "Vui lòng chọn ít nhất một ghế để xóa hoặc cung cấp tàu để xem ghế!");
                }

                // Chuyển hướng về trang quản lý ghế
        
                request.getRequestDispatcher("QuanLyGhe.jsp").forward(request, response);
            }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

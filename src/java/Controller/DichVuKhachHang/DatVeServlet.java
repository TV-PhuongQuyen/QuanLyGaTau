/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.DichVuKhachHang;

import DAO.KhachHangDAO;
import DAO.SoGheDAO;
import Model.KhachHang;
import Model.SoGhe;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author PC
 */
public class DatVeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
     
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
    String name = request.getParameter("name");
    String gioitinh = request.getParameter("options");
    String sdt = request.getParameter("sdt");
    String cccd = request.getParameter("cccd");
    String email = request.getParameter("email");
    String id_ghe = request.getParameter("soghe");
    int maGhe = 0;
    maGhe = Integer.parseInt(id_ghe);
    String id_lichtrinh = request.getParameter("lichtrinh");
    int malt = 0;
    malt = Integer.parseInt(id_lichtrinh);
    String TrangThai = "ChoDuyet";  

    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String date_now = now.format(formatter);
    
   

    KhachHangDAO dao = new KhachHangDAO();
    SoGheDAO daoghe = new SoGheDAO();
    request.setAttribute("thanhcong", "Đặt vé thành công");
    daoghe.chuyenTrangThaiHet(maGhe);
    dao.DatVeDichVu(name, gioitinh, email, cccd, sdt, id_ghe, id_lichtrinh, date_now, TrangThai);

    response.sendRedirect("DichVuKhachHangServlet");
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
          String id_tau = request.getParameter("id_tau");
          String id_lichtrinh = request.getParameter("lichtrinh");
          SoGheDAO sg = new SoGheDAO();
          List<SoGhe> list_sg = sg.HienThiSoGheDaDuyetCuaMotTau(id_tau);
          request.setAttribute("id_tau", id_tau);
          request.setAttribute("id_lichtrinh", id_lichtrinh);
          request.setAttribute("getSoGheDuyet", list_sg);
          request.getRequestDispatcher("DatVe.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

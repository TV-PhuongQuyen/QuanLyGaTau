/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.KhachHang;

import Model.KhachHang;
import DAO.KhachHangDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


/**
 *
 * @author PC
 */
public class XuatExcelServlet extends HttpServlet {
   
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
            out.println("<title>Servlet XuatExcelServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet XuatExcelServlet at " + request.getContextPath () + "</h1>");
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
       String nam = request.getParameter("xuat_excel");

    KhachHangDAO dao = new KhachHangDAO();
    List<KhachHang> danhSachKhach = dao.HienThiKhachTheoNam(nam);

    // Đường dẫn thư mục lưu trữ
    String folderPath = "D:\\xuat"; // Đặt đường dẫn thư mục phù hợp
    String fileName = "danh_sach_khach_" + nam + ".xlsx";
    String filePath = folderPath + "\\" + fileName;

try (Workbook workbook = new XSSFWorkbook()) {
    Sheet sheet = workbook.createSheet("Danh sách khách hàng");
    int rowIndex = 0;

    // Tạo tiêu đề
    Row headerRow = sheet.createRow(rowIndex++);
    String[] headers = {"ID", "Tên", "Giới Tính", "Email", "CCCD", "SĐT", "Ga Khởi Hành", "Ga Đến",
                        "Ngày Khởi Hành", "Ngày Đến", "Số Ghế", "Hạng Ghế", "Giá Vé", "Ngày Đặt Vé", "Trạng Thái"};
    for (int i = 0; i < headers.length; i++) {
        Cell cell = headerRow.createCell(i);
        cell.setCellValue(headers[i]);
    }

    // Thêm dữ liệu
    for (KhachHang kh : danhSachKhach) {
        Row row = sheet.createRow(rowIndex++);
        row.createCell(0).setCellValue(kh.getId_kh());
        row.createCell(1).setCellValue(kh.getName());
        row.createCell(2).setCellValue(kh.getGioi_tinh());
        row.createCell(3).setCellValue(kh.getEmail());
        row.createCell(4).setCellValue(kh.getCccd());
        row.createCell(5).setCellValue(kh.getNumber());
        row.createCell(6).setCellValue(kh.getLichtrinh().getGa_kh());
        row.createCell(7).setCellValue(kh.getLichtrinh().getGa_den());
        row.createCell(8).setCellValue(kh.getLichtrinh().getNgay_kh());
        row.createCell(9).setCellValue(kh.getLichtrinh().getNgay_den());
        row.createCell(10).setCellValue(kh.getSoghe().getSoGhe());
        row.createCell(11).setCellValue(kh.getSoghe().getHangGhe());
        row.createCell(12).setCellValue(kh.getSoghe().getGiaVe());
        row.createCell(13).setCellValue(kh.getNgay_dk());
        row.createCell(14).setCellValue(kh.getTrangThai());
    }

    // Ghi vào file trên server
    try (FileOutputStream fileOut = new FileOutputStream(filePath)) {
        workbook.write(fileOut);
        System.out.println("File đã lưu tại: " + filePath);

        // Gửi thông báo thành công về servlet quản lý
        String successMessage = "File Excel đã được lưu tại: " + filePath;
        response.sendRedirect("QuanLyVeTauServlet?status=success&message=" + URLEncoder.encode(successMessage, "UTF-8"));
    }

    } catch (Exception e) {
        e.printStackTrace();

        // Gửi thông báo lỗi về servlet quản lý
        String errorMessage = "Lỗi khi tạo file Excel: " + e.getMessage();
        response.sendRedirect("QuanLyVeTauServlet?status=error&message=" + URLEncoder.encode(errorMessage, "UTF-8"));
    }

            
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

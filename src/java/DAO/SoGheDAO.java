/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import DAO.DBConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Model.Tau;
import java.util.ArrayList;
import Model.SoGhe;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
/**
 *
 * @author PC
 */
public class SoGheDAO {
       DBConnection db = new DBConnection();
    public PreparedStatement st;
    public ResultSet rs;
    
    public ArrayList<SoGhe> LayDuLieuGhe(){
        ArrayList<SoGhe> list = new ArrayList<>();
      
        String sql = "SELECT soghetau.id_SoGhe, tau.id_tau, tau.so_hieu_tau, soghetau.SoChoNgoi, soghetau.HangGhe, soghetau.gia_ve, soghetau.TrangThai " +
             "FROM soghetau " +
             "INNER JOIN tau ON soghetau.id_tau = tau.id_tau";

        try {
            st = db.getConnection().prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                SoGhe sg = new SoGhe();
                Tau t = new Tau();
                sg.setId_soghe(rs.getInt("id_SoGhe"));
                t.setId_tau(rs.getInt("id_tau"));
                t.setSo_hieu_tau(rs.getString("so_hieu_tau"));
                sg.setSoGhe(rs.getInt("SoChoNgoi"));
                sg.setHangGhe(rs.getString("HangGhe"));
                sg.setGiaVe(rs.getInt("gia_ve"));
                sg.setTrangThai(rs.getString("TrangThai"));
                sg.setTau(t);
                list.add(sg);
            }
        } catch (Exception e) {
             e.printStackTrace();  // In ra chi tiết lỗi
        }
        return list;
    }
    public ArrayList<SoGhe> SoGheTau(String id_tau){
        ArrayList<SoGhe> list = new ArrayList<>();
        String sql = "SELECT * FROM soghetau WHERE id_tau = ?";
        
        
        
        try {
            st = db.getConnection().prepareStatement(sql);
            st.setString(1, id_tau);
            rs = st.executeQuery();
            while(rs.next()){
                 SoGhe sg = new SoGhe();
                Tau t = new Tau();
                sg.setId_soghe(rs.getInt("id_SoGhe"));
                t.setId_tau(rs.getInt("id_tau"));
                sg.setSoGhe(rs.getInt("SoChoNgoi"));
                sg.setTrangThai(rs.getString("TrangThai"));
                sg.setTau(t);
                list.add(sg);
            }
        } catch (Exception e) {
             e.printStackTrace();
        }
        return list;
    }
    public ArrayList<SoGhe> HienThiSoGheDaDuyetCuaMotTau(String id_tau){
        ArrayList<SoGhe> list = new ArrayList<>();
        String sql ="SELECT * FROM soghetau WHERE id_tau=? AND TrangThai='con' ORDER BY SoChoNgoi ASC";
        try {
            st = db.getConnection().prepareStatement(sql);
            st.setString(1, id_tau);
            rs= st.executeQuery();
            while(rs.next()){
                SoGhe sg = new SoGhe();
                sg.setId_soghe(rs.getInt("id_SoGhe"));
                sg.setTrangThai(rs.getString("TrangThai"));
                list.add(sg);
            }
        } catch (Exception e) {
                  e.printStackTrace();
        }
        return list;
    }
    public boolean XoaNhieuGhe(ArrayList<String> idGheList) {
        if (idGheList == null || idGheList.isEmpty()) {
            return false; // Không có tàu nào để xóa
        }
        // Tạo câu lệnh SQL động với mệnh đề IN
        String placeholders = String.join(",", idGheList.stream().map(id -> "?").toArray(String[]::new));
        String sql = "DELETE FROM soghetau WHERE id_SoGhe IN (" + placeholders + ")";

        try {
            st = db.getConnection().prepareStatement(sql);

            // Gán giá trị cho các tham số
            for (int i = 0; i < idGheList.size(); i++) {
                st.setString(i + 1, idGheList.get(i));
            }

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất một hàng bị xóa
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Trả về false nếu xảy ra lỗi
        }
    }
     public void ThemSoGhe(int maTau, int soGhe, String hangGhe,int giaVe, String trangThai) {
        // Câu lệnh SQL để thêm dữ liệu vào bảng soghetau
        String sql = "INSERT INTO soghetau (id_tau, SoChoNgoi, HangGhe, gia_ve, TrangThai) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = db.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            // Thiết lập các tham số cho câu lệnh SQL
            st.setInt(1, maTau);
            st.setInt(2, soGhe);
            st.setString(3, hangGhe);
            st.setInt(4, giaVe);
            st.setString(5, trangThai);

            // Thực thi lệnh SQL
            int rowsInserted = st.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Đã thêm ghế mới thành công!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Lỗi khi thêm số ghế: " + e.getMessage());
        }
    }

  
    public boolean kiemTraSoGheTonTai(int maTau, int soGhe) {
        String sql = "SELECT COUNT(*) AS count FROM soghetau WHERE id_tau = ? AND SoChoNgoi = ?";

        try (Connection conn = db.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            // Thiết lập các tham số
            st.setInt(1, maTau);
            st.setInt(2, soGhe);

            // Thực thi câu lệnh truy vấn
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt("count");
                    return count > 0; // Trả về true nếu tồn tại
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi kiểm tra số ghế: " + e.getMessage());
            e.printStackTrace();
        }

        return false; // Trả về false nếu có lỗi hoặc không tồn tại
    }
  
    public boolean suaSoGhe(SoGhe sg) {
      String sql = "UPDATE soghetau SET id_tau = ?, SoChoNgoi = ?, HangGhe = ?, gia_ve = ?, TrangThai = ? WHERE id_SoGhe = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {

            // Thiết lập tham số cho câu lệnh SQL
            st.setInt(1, sg.getMaTau());
            st.setInt(2, sg.getSoGhe());
            st.setString(3, sg.getHangGhe());
            st.setInt(4, sg.getGiaVe());
            st.setString(5, sg.getTrangThai());
            st.setInt(6, sg.getId_soghe());

            // Thực thi câu lệnh SQL
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Lỗi khi sửa số ghế: " + e.getMessage());
        }

        return false; // Trả về false nếu có lỗi
    }
    public boolean chuyenTrangThaiHet(int idSoGhe) {
        String sql = "UPDATE soghetau SET TrangThai = 'het' WHERE id_SoGhe = ?";
        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {

            // Thiết lập tham số cho câu lệnh SQL
            st.setInt(1, idSoGhe);

            // Thực thi câu lệnh SQL
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Lỗi khi chuyển trạng thái ghế: " + e.getMessage());
        }

        return false; // Trả về false nếu có lỗi
    }

}

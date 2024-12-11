/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Model.Tau;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class TauDAO {
    DBConnection db = new DBConnection();
    public PreparedStatement st;
    public ResultSet rs;
    
    public ArrayList<Tau> LayDuLieuTay(){
        ArrayList<Tau> list = new ArrayList<>();
        String sql  = "SELECT * FROM tau";
        try {
            st = db.getConnection().prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {                
                Tau tau = new Tau();
                tau.setId_tau(rs.getInt(1));
                tau.setTen_tau(rs.getString(2));
                tau.setSo_hieu_tau(rs.getString(3));
                tau.setTrangThai(rs.getString(4));
                list.add(tau);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return list;
    }
  
    public boolean XoaNhieuTau(ArrayList<String> idTauList) {
        if (idTauList == null || idTauList.isEmpty()) {
            return false; // Không có tàu nào để xóa
        }
        // Tạo câu lệnh SQL động với mệnh đề IN
        String placeholders = String.join(",", idTauList.stream().map(id -> "?").toArray(String[]::new));
        String sql = "DELETE FROM tau WHERE id_tau IN (" + placeholders + ")";

        try {
            st = db.getConnection().prepareStatement(sql);

            // Gán giá trị cho các tham số
            for (int i = 0; i < idTauList.size(); i++) {
                st.setString(i + 1, idTauList.get(i));
            }

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất một hàng bị xóa
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Trả về false nếu xảy ra lỗi
        }
    }

  
       public boolean ThemTau(String tenTau, String soHieuTau, String trangThai){
        if (kiemTraSoHieuTau(soHieuTau)) {
            System.out.println("Số hiệu tàu đã tồn tại. Không thể thêm tàu mới.");
            return false;
        }
        String sql = "INSERT INTO tau (ten_tau, so_hieu_tau, TrangThai) VALUES(?, ?, ?)";

        try (Connection conn = db.getConnection()) {
            st = conn.prepareStatement(sql);
            st.setString(1, tenTau);
            st.setString(2, soHieuTau);
            st.setString(3, trangThai);

            int rowsInserted = st.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Nếu có lỗi, trả về false
        }
    }

    // Phương thức kiểm tra số hiệu tàu đã tồn tại
    public boolean kiemTraSoHieuTau(String soHieuTau) {
        String sql = "SELECT COUNT(*) FROM tau WHERE so_hieu_tau = ?";
        try (Connection conn = db.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, soHieuTau);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0; // Nếu có ít nhất 1 bản ghi, trả về true
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu không có bản ghi hoặc xảy ra lỗi
    }
    public boolean SuaTau(Tau tau) {
        String sql = "UPDATE tau SET ten_tau = ?, so_hieu_tau = ?, TrangThai = ? WHERE id_tau = ?";
        try (Connection conn = db.getConnection()) {
            st = conn.prepareStatement(sql);
            st.setString(1, tau.getTen_tau());
            st.setString(2, tau.getSo_hieu_tau());
            st.setString(3, tau.getTrangThai());
            st.setInt(4, tau.getId_tau());

            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu có ít nhất một bản ghi được cập nhật
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu xảy ra lỗi
        }
    }
    public ArrayList<Tau> LayDuLieuTauDaDuyet() {
        ArrayList<Tau> list = new ArrayList<>();
        String sql = "SELECT * FROM tau WHERE TrangThai = 'HoatDong'";

        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Tau tau = new Tau();
                tau.setId_tau(rs.getInt("id_tau"));
                tau.setTen_tau(rs.getString("ten_tau"));
                tau.setSo_hieu_tau(rs.getString("so_hieu_tau"));
                tau.setTrangThai(rs.getString("TrangThai"));
                list.add(tau);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Lỗi khi lấy danh sách tàu đã duyệt: " + e.getMessage());
        }

        return list;
    }

}

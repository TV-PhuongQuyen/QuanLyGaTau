package DAO;
import java.util.ArrayList;
import Model.Tau;
import Model.LichTrinh;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author PC
 */
public class LichTrinhDAO {
    DBConnection db = new DBConnection();
    public PreparedStatement st;
    public ArrayList<LichTrinh> LayDuLieuDaDuyet() {
        ArrayList<LichTrinh> list = new ArrayList<>();
        String sql = "SELECT lichtrinh.id_lich_trinh, tau.id_tau, tau.so_hieu_tau, lichtrinh.ga_kh, lichtrinh.ga_den, "
                   + "lichtrinh.time_kh, lichtrinh.time_den, lichtrinh.ngay_kh, lichtrinh.ngay_den, lichtrinh.TrangThai "
                   + "FROM lichtrinh "
                   + "INNER JOIN tau ON lichtrinh.id_tau = tau.id_tau "
                   + "WHERE lichtrinh.TrangThai = 'DaDuyet'";

        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                LichTrinh lt = new LichTrinh();
                Tau t = new Tau();
                
                lt.setId_lich_trinh(rs.getInt("id_lich_trinh"));
                t.setId_tau(rs.getInt("id_tau"));
                t.setSo_hieu_tau(rs.getString("so_hieu_tau"));
                lt.setGa_kh(rs.getString("ga_kh"));
                lt.setGa_den(rs.getString("ga_den"));
                lt.setTime_kh(rs.getString("time_kh"));
                lt.setTime_den(rs.getString("time_den"));
                lt.setNgay_kh(rs.getString("ngay_kh"));
                lt.setNgay_den(rs.getString("ngay_den"));
                lt.setTrangThai(rs.getString("TrangThai")); // Đảm bảo lấy cột `TrangThai`
                lt.setTau(t);
                
                list.add(lt);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Lỗi khi truy vấn dữ liệu đã duyệt: " + e.getMessage());
        }
        return list;
    }
  public boolean XoaNhieuLichTrinh(ArrayList<String> idLTList) {
        if (idLTList == null || idLTList.isEmpty()) {
            return false; // Không có tàu nào để xóa
        }
        // Tạo câu lệnh SQL động với mệnh đề IN
        String placeholders = String.join(",", idLTList.stream().map(id -> "?").toArray(String[]::new));
        String sql = "DELETE FROM lichtrinh WHERE id_lich_trinh IN (" + placeholders + ")";

        try {
            st = db.getConnection().prepareStatement(sql);

            // Gán giá trị cho các tham số
            for (int i = 0; i < idLTList.size(); i++) {
                st.setString(i + 1, idLTList.get(i));
            }

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất một hàng bị xóa
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Trả về false nếu xảy ra lỗi
        }
    }
    public boolean suaLichTrinh(LichTrinh lichTrinh) {
 

      String sql = """
          UPDATE lichtrinh
          SET id_tau = ?, 
              ga_kh = ?, 
              ga_den = ?, 
              time_kh = ?, 
              time_den = ?, 
              ngay_kh = ?, 
              ngay_den = ?, 
              TrangThai = ?
          WHERE id_lich_trinh = ?
      """;

      try (Connection conn = db.getConnection();
           PreparedStatement st = conn.prepareStatement(sql)) {

          st.setInt(1, lichTrinh.getId_tau());
          st.setString(2, lichTrinh.getGa_kh());
          st.setString(3, lichTrinh.getGa_den());
          st.setString(4, lichTrinh.getTime_kh());
          st.setString(5, lichTrinh.getTime_den());
          st.setString(6, lichTrinh.getNgay_kh());
          st.setString(7, lichTrinh.getNgay_den());
          st.setString(8, lichTrinh.getTrangThai());
          st.setInt(9, lichTrinh.getId_lich_trinh());

          int rowsUpdated = st.executeUpdate();
          return rowsUpdated > 0; // Trả về true nếu có ít nhất một dòng bị ảnh hưởng.
      } catch (SQLException e) {
          e.printStackTrace();
          System.err.println("Lỗi khi sửa thông tin lịch trình: " + e.getMessage());
          return false;
      }
  }
    public ArrayList<LichTrinh> LayDuLieuChuaDuyet() {
        ArrayList<LichTrinh> list = new ArrayList<>();
        String sql = "SELECT lichtrinh.id_lich_trinh, tau.id_tau, tau.so_hieu_tau, lichtrinh.ga_kh, lichtrinh.ga_den, "
                   + "lichtrinh.time_kh, lichtrinh.time_den, lichtrinh.ngay_kh, lichtrinh.ngay_den, lichtrinh.TrangThai "
                   + "FROM lichtrinh "
                   + "INNER JOIN tau ON lichtrinh.id_tau = tau.id_tau "
                   + "WHERE lichtrinh.TrangThai = 'ChuaDuyet'";

        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                LichTrinh lt = new LichTrinh();
                Tau t = new Tau();
                
                lt.setId_lich_trinh(rs.getInt("id_lich_trinh"));
                t.setId_tau(rs.getInt("id_tau"));
                t.setSo_hieu_tau(rs.getString("so_hieu_tau"));
                lt.setGa_kh(rs.getString("ga_kh"));
                lt.setGa_den(rs.getString("ga_den"));
                lt.setTime_kh(rs.getString("time_kh"));
                lt.setTime_den(rs.getString("time_den"));
                lt.setNgay_kh(rs.getString("ngay_kh"));
                lt.setNgay_den(rs.getString("ngay_den"));
                lt.setTrangThai(rs.getString("TrangThai")); // Đảm bảo lấy cột `TrangThai`
                lt.setTau(t);
                
                list.add(lt);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Lỗi khi truy vấn dữ liệu chưa duyệt: " + e.getMessage());
        }
        return list;
    }
    public boolean SuaTrangThaiLichTrinh(int id_lich_trinh, String trangThaiMoi) {
        String sql = "UPDATE lichtrinh SET TrangThai = ? WHERE id_lich_trinh = ?";
        boolean ketQua = false;

        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {

            // Thiết lập các tham số cho câu lệnh SQL
            st.setString(1, trangThaiMoi);
            st.setInt(2, id_lich_trinh);

            // Thực thi cập nhật và kiểm tra số hàng bị ảnh hưởng
            int rowsUpdated = st.executeUpdate();
            if (rowsUpdated > 0) {
                ketQua = true;
                System.out.println("Cập nhật trạng thái thành công cho id_lich_trinh: " + id_lich_trinh);
            } else {
                System.out.println("Không tìm thấy id_lich_trinh: " + id_lich_trinh);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Lỗi khi cập nhật trạng thái lịch trình: " + e.getMessage());
        }

        return ketQua;
    }
    public void ThemLichTrinh(int idtau, String ga_kh, String ga_den, String time_kh, String time_den, String ngay_kh, String ngay_den, String trangthai) {
        String sql = "INSERT INTO lichtrinh (id_tau, ga_kh, ga_den, time_kh, time_den, ngay_kh, ngay_den, TrangThai) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = db.getConnection(); 
             PreparedStatement st = conn.prepareStatement(sql)) {

            st.setInt(1, idtau);
            st.setString(2, ga_kh);
            st.setString(3, ga_den);
            st.setString(4, time_kh);
            st.setString(5, time_den);
            st.setString(6, ngay_kh);
            st.setString(7, ngay_den);
            st.setString(8, trangthai);

            // Thực thi lệnh SQL
            int rowsInserted = st.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Lịch trình mới đã được thêm thành công.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Lỗi khi thêm lịch trình mới: " + e.getMessage());
        }
    }


}

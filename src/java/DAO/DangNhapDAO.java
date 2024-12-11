package DAO;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DangNhapDAO {
    
    public User dangNhap(String email, String password) {
       String query = "SELECT * FROM user WHERE email = ? AND password = ?";
       try (Connection conn = new DBConnection().getConnection();
            PreparedStatement ps = conn.prepareStatement(query)) {

           // Gán giá trị cho các tham số truy vấn
           ps.setString(1, email);
           ps.setString(2, password);

           // Thực hiện truy vấn và xử lý kết quả
           try (ResultSet rs = ps.executeQuery()) {
               if (rs.next()) {
                   // Đăng nhập thành công, tạo đối tượng User và trả về
                   System.out.println("Đăng nhập thành công! Chào mừng, " + email);
                   return new User(email, password);
               } else {
                   // Đăng nhập thất bại
                   System.out.println("Đăng nhập thất bại! Vui lòng kiểm tra lại email hoặc mật khẩu.");
               }
           }

       } catch (SQLException e) {
           // Xử lý ngoại lệ khi có lỗi xảy ra với cơ sở dữ liệu
           e.printStackTrace();
       }
       return null; // Trả về null nếu đăng nhập thất bại
    }
   public User KiemTraEmail(String email) {
    String query = "SELECT * FROM user WHERE email = ?";
    try (Connection conn = new DBConnection().getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {

        // Gán giá trị cho tham số truy vấn
        ps.setString(1, email);

        // Thực hiện truy vấn và xử lý kết quả
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                // Nếu email tồn tại, tạo đối tượng User và trả về
                String password = rs.getString("matkhau"); // Lấy mật khẩu từ kết quả truy vấn (nếu cần)
                return new User(email, password);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null; // Trả về null nếu email không tồn tại
    }
   
    public boolean dangKy(String email, String password) {
        String query = "INSERT INTO user (email, password) VALUES (?, ?)";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            ps.setString(2, password);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu thêm thành công

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu có lỗi
    }


}

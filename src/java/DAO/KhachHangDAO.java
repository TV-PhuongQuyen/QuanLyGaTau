    package DAO;

    import java.sql.Connection;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.sql.SQLException;
    import Model.KhachHang;
    import Model.LichTrinh;
    import Model.SoGhe;
    import java.util.ArrayList;
import java.util.HashMap;
    import java.util.List;
import java.util.Map;

    public class KhachHangDAO {
        DBConnection db = new DBConnection();
        public PreparedStatement st;
        public ResultSet rs;

        public List<KhachHang> HienThiVeDaDuyet(){
            ArrayList<KhachHang> list = new ArrayList<>();
            String sql = "SELECT khachhang.id_kh, lichtrinh.id_lich_trinh, soghetau.id_SoGhe, "
                  + "khachhang.name, khachhang.gioi_tinh, khachhang.email, lichtrinh.ga_kh, lichtrinh.ga_den, "
                  + "lichtrinh.time_kh, lichtrinh.time_den, lichtrinh.ngay_kh, lichtrinh.ngay_den, "
                  + "soghetau.SoChoNgoi, soghetau.HangGhe, soghetau.gia_ve, "
                  + "khachhang.cccd, khachhang.number, khachhang.ngay_dat_ve, khachhang.TrangThai "
                  + "FROM khachhang "
                  + "INNER JOIN lichtrinh ON khachhang.id_lich_trinh = lichtrinh.id_lich_trinh "
                  + "INNER JOIN soghetau ON khachhang.id_SoGhe = soghetau.id_SoGhe "
                  + "WHERE khachhang.TrangThai = 'DaDuyet'";

             try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    KhachHang kh = new KhachHang();
                    LichTrinh lt = new LichTrinh();
                    SoGhe sg = new SoGhe();

                    // Thiết lập dữ liệu cho KhachHang
                    kh.setId_kh(rs.getInt("id_kh"));
                    kh.setName(rs.getString("name"));
                    kh.setGioi_tinh(rs.getString("gioi_tinh"));
                    kh.setEmail(rs.getString("email"));
                    kh.setCccd(rs.getString("cccd"));
                    kh.setNumber(rs.getString("number"));
                    kh.setNgay_dk(rs.getString("ngay_dat_ve"));
                    kh.setTrangThai(rs.getString("TrangThai"));

                    // Thiết lập dữ liệu cho LichTrinh
                    lt.setId_lich_trinh(rs.getInt("id_lich_trinh"));
                    lt.setGa_kh(rs.getString("ga_kh"));
                    lt.setGa_den(rs.getString("ga_den"));
                    lt.setTime_kh(rs.getString("time_kh"));
                    lt.setTime_den(rs.getString("time_den"));
                    lt.setNgay_kh(rs.getString("ngay_kh"));
                    lt.setNgay_den(rs.getString("ngay_den"));

                    // Thiết lập dữ liệu cho SoGhe
                    sg.setId_soghe(rs.getInt("id_SoGhe"));
                    sg.setSoGhe(rs.getInt("SoChoNgoi"));
                    sg.setHangGhe(rs.getString("HangGhe"));
                    sg.setGiaVe(rs.getInt("gia_ve"));

                    // Gắn LichTrinh và SoGhe vào KhachHang
                    kh.setLichtrinh(lt);
                    kh.setSoghe(sg);

                    // Thêm KhachHang vào danh sách
                    list.add(kh);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.err.println("Lỗi khi truy vấn vé đã duyệt: " + e.getMessage());
            }
            return list;
        }
        public List<KhachHang> HienThiVeCho(){
            ArrayList<KhachHang> list = new ArrayList<>();
            String sql = "SELECT khachhang.id_kh, lichtrinh.id_lich_trinh, soghetau.id_SoGhe, "
                  + "khachhang.name, khachhang.gioi_tinh, khachhang.email, lichtrinh.ga_kh, lichtrinh.ga_den, "
                  + "lichtrinh.time_kh, lichtrinh.time_den, lichtrinh.ngay_kh, lichtrinh.ngay_den, "
                  + "soghetau.SoChoNgoi, soghetau.HangGhe, soghetau.gia_ve, "
                  + "khachhang.cccd, khachhang.number, khachhang.ngay_dat_ve, khachhang.TrangThai "
                  + "FROM khachhang "
                  + "INNER JOIN lichtrinh ON khachhang.id_lich_trinh = lichtrinh.id_lich_trinh "
                  + "INNER JOIN soghetau ON khachhang.id_SoGhe = soghetau.id_SoGhe "
                  + "WHERE khachhang.TrangThai = 'ChoDuyet'";

             try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    KhachHang kh = new KhachHang();
                    LichTrinh lt = new LichTrinh();
                    SoGhe sg = new SoGhe();

                    // Thiết lập dữ liệu cho KhachHang
                    kh.setId_kh(rs.getInt("id_kh"));
                    kh.setName(rs.getString("name"));
                    kh.setGioi_tinh(rs.getString("gioi_tinh"));
                    kh.setEmail(rs.getString("email"));
                    kh.setCccd(rs.getString("cccd"));
                    kh.setNumber(rs.getString("number"));
                    kh.setNgay_dk(rs.getString("ngay_dat_ve"));
                    kh.setTrangThai(rs.getString("TrangThai"));

                    // Thiết lập dữ liệu cho LichTrinh
                    lt.setId_lich_trinh(rs.getInt("id_lich_trinh"));
                    lt.setGa_kh(rs.getString("ga_kh"));
                    lt.setGa_den(rs.getString("ga_den"));
                    lt.setTime_kh(rs.getString("time_kh"));
                    lt.setTime_den(rs.getString("time_den"));
                    lt.setNgay_kh(rs.getString("ngay_kh"));
                    lt.setNgay_den(rs.getString("ngay_den"));

                    // Thiết lập dữ liệu cho SoGhe
                    sg.setId_soghe(rs.getInt("id_SoGhe"));
                    sg.setSoGhe(rs.getInt("SoChoNgoi"));
                    sg.setHangGhe(rs.getString("HangGhe"));
                    sg.setGiaVe(rs.getInt("gia_ve"));

                    // Gắn LichTrinh và SoGhe vào KhachHang
                    kh.setLichtrinh(lt);
                    kh.setSoghe(sg);

                    // Thêm KhachHang vào danh sách
                    list.add(kh);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.err.println("Lỗi khi truy vấn vé đã duyệt: " + e.getMessage());
            }
            return list;
        }
        public void DatVeDichVu(String name, String gioi_tinh, String email, String cccd, String number, String id_SoGhe, String id_lich_trinh, String ngay_dat_ve, String trangThai) {
            String sql = "INSERT INTO khachhang (name, gioi_tinh, email, cccd, number, id_SoGhe, id_lich_trinh, ngay_dat_ve, TrangThai) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

          try (Connection conn = db.getConnection(); 
                 PreparedStatement st = conn.prepareStatement(sql)) {


                st.setString(1, name);
                st.setString(2, gioi_tinh);
                st.setString(3, email);
                st.setString(4, cccd);
                st.setString(5, number);
                st.setString(6, id_SoGhe);
                st.setString(7, id_lich_trinh);
                st.setString(8, ngay_dat_ve);
                st.setString(9, trangThai);

                // Execute the SQL statement
                int rowsInserted = st.executeUpdate();
                if (rowsInserted > 0) {
                    // Retrieve the generated ID
                    try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            int newIdKh = generatedKeys.getInt(1);
                            System.out.println("Thêm bản ghi thành công với ID: " + newIdKh);
                        }
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.err.println("Lỗi khi thêm khách hàng: " + e.getMessage());
            }
        }

        public List<KhachHang> hienThiKhachHangChuaDuyet() {
            List<KhachHang> khachHangList = new ArrayList<>();
            String sql = "SELECT * FROM khachhang WHERE TrangThai = 'ChoDuyet'";

            try (Connection conn = db.getConnection(); 
                 PreparedStatement st = conn.prepareStatement(sql); 
                 ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    KhachHang kh = new KhachHang();
                    kh.setId_kh(rs.getInt("id_kh"));
                    kh.setName(rs.getString("name"));
                    kh.setGioi_tinh(rs.getString("gioi_tinh"));
                    kh.setEmail(rs.getString("email"));
                    kh.setCccd(rs.getString("cccd"));
                    kh.setNumber(rs.getString("number"));
                    kh.setId_soghe(rs.getString("id_SoGhe"));
                    kh.setId_lich_trinh(rs.getString("id_lich_trinh"));
                    kh.setNgay_dk(rs.getString("ngay_dat_ve"));
                    kh.setTrangThai(rs.getString("TrangThai"));

                    khachHangList.add(kh);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return khachHangList;
        }
        public List<KhachHang> hienThiKhachHangDuyet() {
            List<KhachHang> khachHangList = new ArrayList<>();
            String sql = "SELECT * FROM khachhang WHERE TrangThai = 'DaDuyet'";

            try (Connection conn = db.getConnection(); 
                 PreparedStatement st = conn.prepareStatement(sql); 
                 ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    KhachHang kh = new KhachHang();
                    kh.setId_kh(rs.getInt("id_kh"));
                    kh.setName(rs.getString("name"));
                    kh.setGioi_tinh(rs.getString("gioi_tinh"));
                    kh.setEmail(rs.getString("email"));
                    kh.setCccd(rs.getString("cccd"));
                    kh.setNumber(rs.getString("number"));
                    kh.setId_soghe(rs.getString("id_SoGhe"));
                    kh.setId_lich_trinh(rs.getString("id_lich_trinh"));
                    kh.setNgay_dk(rs.getString("ngay_dat_ve"));
                    kh.setTrangThai(rs.getString("TrangThai"));

                    khachHangList.add(kh);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return khachHangList;
        }
        public void suaTrangThaiKhachHang(int idKh, String trangThaiMoi) {
            String sql = "UPDATE khachhang SET TrangThai = ? WHERE id_kh = ?";
            try (Connection conn = db.getConnection(); 
                 PreparedStatement st = conn.prepareStatement(sql)) {

                st.setString(1, trangThaiMoi); 
                st.setInt(2, idKh);      

                int rowsUpdated = st.executeUpdate();
                if (rowsUpdated > 0) {
                    System.out.println("Cập nhật trạng thái thành công cho khách hàng ID: " + idKh);
                } else {
                    System.out.println("Không tìm thấy khách hàng với ID: " + idKh);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
      
        public List<KhachHang> ThongTinKhachHang() {
            ArrayList<KhachHang> list = new ArrayList<>();
            String sql = "SELECT khachhang.id_kh, khachhang.name, khachhang.gioi_tinh, "
                       + "khachhang.email, khachhang.cccd, khachhang.number, "
                       + "SUM(soghetau.SoChoNgoi) AS tong_so_cho "
                       + "FROM khachhang "
                       + "INNER JOIN lichtrinh ON khachhang.id_lich_trinh = lichtrinh.id_lich_trinh "
                       + "INNER JOIN soghetau ON khachhang.id_SoGhe = soghetau.id_SoGhe "
                       + "WHERE khachhang.TrangThai = 'DaDuyet' "
                       + "GROUP BY khachhang.id_kh, khachhang.name, khachhang.gioi_tinh, "
                       + "khachhang.email, khachhang.cccd, khachhang.number";

            try (Connection conn = db.getConnection();
                 PreparedStatement st = conn.prepareStatement(sql);
                 ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    KhachHang kh = new KhachHang();

                    // Thiết lập dữ liệu cho KhachHang
                    kh.setId_kh(rs.getInt("id_kh"));
                    kh.setName(rs.getString("name"));
                    kh.setGioi_tinh(rs.getString("gioi_tinh"));
                    kh.setEmail(rs.getString("email"));
                    kh.setCccd(rs.getString("cccd"));
                    kh.setNumber(rs.getString("number"));

                    // Lấy tổng số ghế
                    int tongSoCho = rs.getInt("tong_so_cho");
                    kh.setTongSoCho(tongSoCho);  // Đảm bảo có getter và setter cho thuộc tính này

                    // Thêm KhachHang vào danh sách
                    list.add(kh);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.err.println("Lỗi khi truy vấn vé đã duyệt: " + e.getMessage());
            }
            return list;
        }
        public List<Map<String, Object>> thongKeDoanhThuTheoThang(int nam) {
            List<Map<String, Object>> thongKe = new ArrayList<>();

            // Cập nhật truy vấn SQL để lấy doanh thu theo tháng từ bảng soghetau
            String sql = "SELECT MONTH(kh.ngay_dat_ve) AS thang, SUM(st.gia_ve) AS tong_doanh_thu " +
                         "FROM khachhang kh " +
                         "INNER JOIN soghetau st ON kh.id_SoGhe = st.id_SoGhe " +
                         "WHERE YEAR(kh.ngay_dat_ve) = ? AND kh.TrangThai = 'DaDuyet' " +
                         "GROUP BY MONTH(kh.ngay_dat_ve) " +
                         "ORDER BY thang";

            try (Connection conn = db.getConnection();
                 PreparedStatement st = conn.prepareStatement(sql)) {

                // Gán tham số năm vào câu lệnh SQL
                st.setInt(1, nam);
                ResultSet rs = st.executeQuery();

                // Duyệt qua các kết quả trả về
                while (rs.next()) {
                    // Tạo một map để lưu trữ thông tin tháng và tổng doanh thu
                    Map<String, Object> thongKeThang = new HashMap<>();
                    thongKeThang.put("thang", rs.getInt("thang"));  // Lưu tháng
                    thongKeThang.put("doanhThu", rs.getDouble("tong_doanh_thu"));  // Lưu tổng doanh thu

                    // Thêm map vào danh sách thống kê
                    thongKe.add(thongKeThang);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.err.println("Lỗi khi thống kê doanh thu theo tháng: " + e.getMessage());
            }

            return thongKe;
        }

        public List<Map<String, Object>> thongKeKhachTheoThang(int nam) {
               List<Map<String, Object>> thongKe = new ArrayList<>();
               String sql = "SELECT MONTH(ngay_dat_ve) AS thang, COUNT(id_kh) AS so_luong_khach " +
                            "FROM khachhang " +
                            "WHERE YEAR(ngay_dat_ve) = ? AND TrangThai = 'DaDuyet' " +
                            "GROUP BY MONTH(ngay_dat_ve) " +
                            "ORDER BY thang";

               try (Connection conn = db.getConnection();
                    PreparedStatement st = conn.prepareStatement(sql)) {

                   // Gán tham số năm
                   st.setInt(1, nam);
                   ResultSet rs = st.executeQuery();

                   while (rs.next()) {
                       // Tạo một map để lưu thông tin tháng và số lượng khách
                       Map<String, Object> thongKeThang = new HashMap<>();
                       thongKeThang.put("thang", rs.getInt("thang"));
                       thongKeThang.put("soLuong", rs.getInt("so_luong_khach"));

                       thongKe.add(thongKeThang);
                   }
               } catch (SQLException e) {
                   e.printStackTrace();
                   System.err.println("Lỗi khi thống kê số lượng khách theo tháng: " + e.getMessage());
               }

               return thongKe;
        }
        public boolean XoaNhieuVeTau(ArrayList<String> idLTList) {
            if (idLTList == null || idLTList.isEmpty()) {
                return false; // Không có tàu nào để xóa
            }
            // Tạo câu lệnh SQL động với mệnh đề IN
            String placeholders = String.join(",", idLTList.stream().map(id -> "?").toArray(String[]::new));
            String sql = "DELETE FROM khachhang WHERE id_kh IN (" + placeholders + ")";

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
                return false; 
            }
        }

        public List<KhachHang> HienThiKhachTheoNam(String nam) {
            ArrayList<KhachHang> list = new ArrayList<>();
            String sql = "SELECT khachhang.id_kh, lichtrinh.id_lich_trinh, soghetau.id_SoGhe, "
                       + "khachhang.name, khachhang.gioi_tinh, khachhang.email, lichtrinh.ga_kh, lichtrinh.ga_den, "
                       + "lichtrinh.time_kh, lichtrinh.time_den, lichtrinh.ngay_kh, lichtrinh.ngay_den, "
                       + "soghetau.SoChoNgoi, soghetau.HangGhe, soghetau.gia_ve, "
                       + "khachhang.cccd, khachhang.number, khachhang.ngay_dat_ve, khachhang.TrangThai "
                       + "FROM khachhang "
                       + "INNER JOIN lichtrinh ON khachhang.id_lich_trinh = lichtrinh.id_lich_trinh "
                       + "INNER JOIN soghetau ON khachhang.id_SoGhe = soghetau.id_SoGhe "
                       + "WHERE YEAR(khachhang.ngay_dat_ve) = ?";

            try (Connection conn = db.getConnection();
                 PreparedStatement st = conn.prepareStatement(sql)) {

                // Thiết lập giá trị cho tham số nam
                st.setString(1, nam);

                try (ResultSet rs = st.executeQuery()) {
                    while (rs.next()) {
                        KhachHang kh = new KhachHang();
                        LichTrinh lt = new LichTrinh();
                        SoGhe sg = new SoGhe();

                        // Thiết lập dữ liệu cho KhachHang
                        kh.setId_kh(rs.getInt("id_kh"));
                        kh.setName(rs.getString("name"));
                        kh.setGioi_tinh(rs.getString("gioi_tinh"));
                        kh.setEmail(rs.getString("email"));
                        kh.setCccd(rs.getString("cccd"));
                        kh.setNumber(rs.getString("number"));
                        kh.setNgay_dk(rs.getString("ngay_dat_ve"));
                        kh.setTrangThai(rs.getString("TrangThai"));

                        // Thiết lập dữ liệu cho LichTrinh
                        lt.setId_lich_trinh(rs.getInt("id_lich_trinh"));
                        lt.setGa_kh(rs.getString("ga_kh"));
                        lt.setGa_den(rs.getString("ga_den"));
                        lt.setTime_kh(rs.getString("time_kh"));
                        lt.setTime_den(rs.getString("time_den"));
                        lt.setNgay_kh(rs.getString("ngay_kh"));
                        lt.setNgay_den(rs.getString("ngay_den"));

                        // Thiết lập dữ liệu cho SoGhe
                        sg.setId_soghe(rs.getInt("id_SoGhe"));
                        sg.setSoGhe(rs.getInt("SoChoNgoi"));
                        sg.setHangGhe(rs.getString("HangGhe"));
                        sg.setGiaVe(rs.getInt("gia_ve"));

                        // Gắn LichTrinh và SoGhe vào KhachHang
                        kh.setLichtrinh(lt);
                        kh.setSoghe(sg);

                        // Thêm KhachHang vào danh sách
                        list.add(kh);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.err.println("Lỗi khi truy vấn khách hàng theo năm: " + e.getMessage());
            }
            return list;
        }

    }

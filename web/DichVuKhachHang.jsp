<%-- 
    Document   : DichVuKhachHang
    Created on : Nov 14, 2024, 12:22:58 AM
    Author     : PC
--%>
<%@page import ="Model.Tau"%>
<%@page import ="java.util.List"%>
<%@page import ="Model.LichTrinh"%>
<%@page import ="Model.SoGhe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="SuKien/CSS/trangchu.css">
    <link rel="stylesheet" href="SuKien/CSS/khanhhang.css">
    <link rel="stylesheet" href="SuKien/CSS/tau.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <style>
  
    </style>
</head>
<body>
    <div id="body">
        <div style="display: flex; align-items: center; justify-content: space-between; padding: 0px 40px;">
            <div>
                <a href="#"><img src="SuKien/image/Brown and Yellow Vintage Train Travel Logo.png" alt="" style="width: 70px;height: 50px;"></a>
            </div>
            <div id="name">
                <div>ỨNG DỤNG QUẢN LÝ TÀU MR.QK</div>
            </div>
            <div>

            </div>
        </div>
        <div style="font-family: 'Montserrat', Courier, monospace; font-weight: bold; font-size: 18px;text-align: center; padding: 20px 0px; border-top: 2px solid; border-bottom: 2px solid;">
            Lịch Trình Chuyến Tàu
        </div>
        <div id="container_kh">
            <div>
                <div>
                    <div id="top2" style="display:flex; justify-content: center;">
                        <div id="top2_container" class="search-box ">
                            <div>
                                <input type="search" style="width: 400px;" id="search-input" placeholder="Tìm kiếm...">
                            </div>
                        </div>
                    </div>
            
                    <form action="DatVeServlet" method="post" style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                        <input type="hidden" id="lichtrinh" name="lichtrinh">
                        <input type="hidden" id="id_tau" name="id_tau">
                        <button type="submit" class="btn_chon" id="btn_datve">Đặt vé</button>
                    </form>
                    <div id="top3">
                        <div style="max-height: 300px; overflow-y: auto;">
                            <form action="DichVuKhachHangServlet" method="post">
                                <table border="3px white">
                                    <thead>
                                        <tr style="background-color: rgb(59, 57, 57)">
                                            <th style="color: white; width: 70px; padding: 10px 0px;">id_lt</th>
                                                  <th style="color: white; width: 70px; padding: 10px 0px;">id_tau</th>
                                            <th style="color: white; width: 120px;">Số hiệu tàu</th>
                                            <th style="color: white; width: 120px;">Ga khởi hành</th>
                                            <th style="color: white; width: 120px;">Ga đến</th>
                                            <th style="color: white; width: 120px;">Thời gian khởi hành</th>
                                            <th style="color: white; width: 120px;">Thời gian đến</th>
                                            <th style="color: white; width: 120px;">Ngày khởi hành</th>
                                            <th style="color: white; width: 120px;">Ngày đến</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<LichTrinh> lt = (List<LichTrinh>) request.getAttribute("getDuLieuLich");
                                            if (lt != null) {
                                                for (LichTrinh i : lt) {
                                                
                                        %>
                                        <tr style="background-color: rgb(174, 177, 177)" >
                                            <th style="color: white; width: 70px; padding: 10px 0px;"><%= i.getId_lich_trinh()%></th>
                                            <th style="color: white; width: 70px; padding: 10px 0px;"><%= i.getTau().getId_tau()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getTau().getSo_hieu_tau()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getGa_kh()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getGa_den()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getTime_kh()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getTime_den() %></th>
                                            <th style="color: white; width: 120px;"><%= i.getNgay_kh()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getNgay_den()%></th>
                                            <th style="width: 40px;"><input type="radio" id="checkbox-accept"  value="<%= i.getId_lich_trinh()%>" class="custom-checkbox"></th>
                                        </tr>
                                        <%
                                                }
                                            }
                                         %>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="SuKien/JS/sukien.js"></script>
    <script>
    // Lấy tất cả các checkbox
     
        const seatIcons = document.querySelectorAll('.seat-icon');
        const inputSoGhe = document.querySelector('input[name="soghe"]');
        const btnHuy = document.getElementById("btn_huy");
       
        
        const checkboxes = document.querySelectorAll('.custom-checkbox');
        const inputLichTrinh = document.querySelector('input[name="lichtrinh"]');
        const inputIdTau = document.querySelector('input[name="id_tau"]');

        // Lắng nghe sự kiện thay đổi trạng thái của các checkbox
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                if (this.checked) {
                    // Nếu checkbox được chọn
                    inputLichTrinh.value = this.value;

                    // Lấy hàng cha (tr) của checkbox
                    const parentRow = this.closest('tr');

                    // Lấy giá trị id_tau từ cột tương ứng (thứ 2)
                    const idTau = parentRow.querySelector('th:nth-child(2)').innerText.trim();
                    inputIdTau.value = idTau;

                    // Bỏ chọn các checkbox khác
                    checkboxes.forEach(cb => {
                        if (cb !== this) cb.checked = false;
                    });
                } else {
                    // Nếu checkbox bị bỏ chọn
                    inputLichTrinh.value = '';
                    inputIdTau.value = '';
                }
            });
        });

        // Kiểm tra trước khi gửi form
        document.querySelector('form').addEventListener('submit', function (event) {
            const selectedRadio = document.querySelector('.custom-checkbox:checked');
            if (!selectedRadio) {
                alert('Vui lòng chọn một lịch trình trước khi đặt vé!');
                event.preventDefault();
            }
        });

         document.addEventListener("DOMContentLoaded", function() {
            const searchInput = document.getElementById('search-input');
            const tableRows = document.querySelectorAll('#top3 table tbody tr');

            searchInput.addEventListener('input', function() {
                const filter = searchInput.value.toLowerCase();

                tableRows.forEach(row => {
                    const gaKh = row.children[4].innerText.toLowerCase(); // Lấy cột "Ga khởi hành"
                    const gaDen = row.children[5].innerText.toLowerCase(); // Lấy cột "Ga đến"

                    if (gaKh.includes(filter) || gaDen.includes(filter)) {
                        row.style.display = ''; // Hiển thị hàng
                    } else {
                        row.style.display = 'none'; // Ẩn hàng
                    }
                });
            });
        });
    </script>

</body>
</html>

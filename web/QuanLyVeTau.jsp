<%-- 
    Document   : QuanLyKhachHang
    Created on : Nov 14, 2024, 12:21:43 AM
    Author     : PC
--%>
<%@page import ="Model.KhachHang"%>
<%@page import ="java.util.List"%>
<%@page import ="Model.LichTrinh"%>
<%@page import ="Model.SoGhe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="SuKien/CSS/trangchu.css">
    <link rel="stylesheet" href="SuKien/CSS/khanhhang.css">
    <link rel="icon" href="SuKien/image/Brown and Yellow Vintage Train Travel Logo.png" type="image/x-icon">

    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <style>
        #fromDatVe{
            display: none;
        }
        td{
            text-align: center;
        }
        
    </style>
</head>
<body>
       <script>
        // Hiển thị thông báo nếu có tham số status
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const status = urlParams.get('status');
            const message = urlParams.get('message');
            
          

            if (status && message) {
                if (status === "success") {
                    alert("Thành công: " + message); // Hiển thị thông báo thành công
                } else {
                    alert("Lỗi: " + message); // Hiển thị thông báo lỗi
                }
            }
        };
    </script>
    <div id="body">
        <div style="display: flex; align-items: center; justify-content: space-between; padding: 0px 40px;">
            <div>
                <a href="TrangChu.html"><img src="SuKien/image/Brown and Yellow Vintage Train Travel Logo.png" alt="" style="width: 70px;height: 50px;"></a>
            </div>
            <div id="name">
                <div>ỨNG DỤNG QUẢN LÝ TÀU MR.QK</div>
            </div>
            <div>

            </div>
        </div>
        <div >
            <ul >
                <li class="menu">Menu
                    <ul class="submenu">
                        <li style="--delay: 0.1s;"><a href="KhachHangServlet">Quản lý khách hàng</a></li>
                        <li style="--delay: 0.2s;"><a href="TauServlet">Quản lý tàu</a></li>
                        <li style="--delay: 0.3s;"><a href="SoGheTauServlet">Quản lý số ghế</a></li>
                        <li style="--delay: 0.4s;"><a href="QuanLyLichTrinhServlet">Quản lý lịch trình</a></li>
                        <li style="--delay: 0.5s;"><a href="QuanLyVeTauServlet">Quản lý vé</a></li>
                        <li style="--delay: 0.6s;"><a href="ThongKeKhachServlet">Báo cáo thống kê</a></li>
                    </ul>
                </li>
                <li class="menu">Hệ Thống
                    <ul class="submenu">
                        <li><a href="main">Đăng xuất</a></li>
                    </ul>
                </li>
                <li class="menu">Báo Cáo</li>
            </ul>
        </div>
        <div id="container_kh">
            <div class ="top">
                <div>
                    <Button class="btn_chon" id="btn_Duyet">Đã Duyệt</Button>
                </div>
                <div>
                    <Button class="btn_chon" id="btn_Cho">Chờ duyệt</Button>
                </div>
                <div style="font-family: 'Montserrat', Courier, monospace; font-weight: bold; font-size: 18px;">
                    Quản lý Vé Tàu
                </div>
                <div id="fromDatVe">
                    <form action="chuyenTrangThaiServlet" method="get">
                        <Button class="btn_chon" id="datve">Đặt vé</Button>
                        <input type="hidden" id="maKhach" name="maKhach">
                        <input type="hidden" value="DaDuyet" name="trangthai">
                    </form>
                </div>
            </div>
            <div id="top2">
                <div id="top2_container" class="search-box ">
                    <div>
                        <input type="search" id="search-input" placeholder="Tìm kiếm...">
                        <i id="timkiem" class='bx bx-search'></i>
                    </div>
                    <div>
                        <i class='bx bxs-trash' style="cursor: pointer; color: red" onclick="submitDeleteForm()"></i>
                    </div>
                    <div>
                        <i class='bx bxs-cog' id="Sua"></i>
                    </div>
                </div>
                <div >
                    <form action="XuatExcelServlet" method="post" style="display: flex;align-items: center;" >
                        <input type="search" required style="width: 120px; height: 30px; text-align: center;" name="xuat_excel"  id="xuat_excel" placeholder="Năm cần xuất">
                        <Button class="btn_chon" type="submit" style="width: 60px; margin-left: 5px;" id="btn_xuatExcel">Xuất</Button>
                    </form>
                </div>
                <div id="choinve">
                    <form action="InVeServlet" method="post">
                        <input type="hidden" name="malt" id="malt">
                        <input type="hidden" name="ga_kh" id="ga_kh">
                        <input type="hidden" name="ga_den" id="ga_den">
                        <input type="hidden" name="namekh" id="namekh">
                        <input type="hidden" name="cmt" id="cmt">
                        <input type="hidden" name="ngay_kh" id="ngay_kh">
                        <input type="hidden" name="time_kh" id="time_kh">
                        <input type="hidden" name="loai_ve" id="loai_ve">
                        <input type="hidden" name="soghe" id="soghe">
                        <input type="hidden" name="giave" id="giave">
                        <button style="background: white; width: 30px" type="submit" class="btn_chon" id="inve"><i  style="color: black" class='bx bx-printer'></i></button>
                     
                    </form>
                </div>
                
            </div>
            <div id="top3" >
                <div  id="DaDuyet" style="max-height: 300px; overflow-y: auto;">
                    <form id="form-xoa-tau" action="QuanLyVeTauServlet" method="post">
                        <table border="3px white">
                            <thead>
                                <tr style="background-color: rgb(59, 57, 57)">
                                    <th style="color: white; width: 70px; padding: 10px 0px;">id</th>
                                    <th hidden style="color: white; width: 70px; padding: 10px 0px;">id_lt</th>
                                    <th hidden style="color: white; width: 70px; padding: 10px 0px;">id_soghe</th>
                                    <th style="color: white; width: 220px;">Họ và tên</th>
                                    <th hidden style="color: white; width: 100px;">Giới tính</th>
                                    <th style="color: white; width: 150px;">Số điện thoại</th>
                                    <th style="color: white; width: 150px;">Ga Khởi Hành</th>
                                    <th style="color: white; width: 150px;">Ga Đến</th>
                                    <th style="color: white; width: 150px;">Ngày Khởi Hành</th>
                                    <th style="color: white; width: 150px;">Thời Gian Khởi Hành</th>
                                    <th style="color: white; width: 150px;">Loại Vé</th>
                                        <th style="color: white; width: 150px;">Số ghế</th>
                                         <th style="color: white; width: 150px;">Giá</th>
                                    <th style="color: white; width: 150px;">Chứng minh thư</th>
                                    <th hidden style="color: white; width: 180px;">Email</th>
                                     <th style="color: white; width: 150px;">Ngày đk</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<KhachHang> nv = (List<KhachHang>) request.getAttribute("daDuyetList");
                                    if (nv != null) {
                                        for (int index = 0; index < nv.size(); index++) {
                                            KhachHang i = nv.get(index);
                                %>
                                    <tr style="background-color: rgb(174, 177, 177)">
                                        <td><%= i.getId_kh()%></td>
                                        <td hidden><%= i.getLichtrinh().getId_lich_trinh() %></td>
                                        <td hidden><%= i.getSoghe().getId_soghe() %></td>
                                        <td><%= i.getName() %></td>
                                        <td hidden><%= i.getGioi_tinh() %></td>
                                        <td><%= i.getNumber() %></td>
                                        <td><%= i.getLichtrinh().getGa_kh() %></td>
                                        <td><%= i.getLichtrinh().getGa_den() %></td>
                                        <td><%= i.getLichtrinh().getNgay_kh() %></td>
                                        <td><%= i.getLichtrinh().getTime_kh() %></td>
                                        <td><%= i.getSoghe().getHangGhe() %></td>
                                        <td><%= i.getSoghe().getSoGhe() %></td>
                                        <td><%= i.getSoghe().getGiaVe() %></td>
                                        <td><%= i.getCccd() %></td>
                                        <td hidden><%= i.getEmail() %></td>
                                          <td><%= i.getNgay_dk() %></td>
                                        <td><input type="checkbox" id="checkbox-accept" name="veTauid"  value="<%= i.getId_kh()%>" class="custom-checkbox"></td>
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
            <div id="top3" >
                <div  id="ChuaDuyet" style="max-height: 300px; overflow-y: auto; display: none;">
                    <form id="form-xoa-taus" action="XoaVeChuaDuyet" method="post">
                        <table border="3px white">
                            <thead>
                                <tr style="background-color: rgb(59, 57, 57)">
                                    <th style="color: white; width: 70px; padding: 10px 0px;">id</th>
                                    <th hidden style="color: white; width: 70px; padding: 10px 0px;">id_lt</th>
                                    <th hidden style="color: white; width: 70px; padding: 10px 0px;">id_soghe</th>
                                    <th style="color: white; width: 220px;">Họ và tên</th>
                                    <th hidden style="color: white; width: 100px;">Giới tính</th>
                                    <th style="color: white; width: 150px;">Số điện thoại</th>
                                    <th style="color: white; width: 150px;">Ga Khởi Hành</th>
                                    <th style="color: white; width: 150px;">Ga Đến</th>
                                    <th style="color: white; width: 150px;">Ngày Khởi Hành</th>
                                    <th style="color: white; width: 150px;">Thời Gian Khởi Hành</th>
                                    <th style="color: white; width: 150px;">Loại Vé</th>
                                        <th style="color: white; width: 150px;">Số ghế</th>
                                         <th style="color: white; width: 150px;">Giá</th>
                                    <th style="color: white; width: 150px;">Chứng minh thư</th>
                                    <th hidden style="color: white; width: 180px;">Email</th>
                                    <th style="color: white; width: 150px;">Ngày đk</th>
                                     
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<KhachHang> ve= (List<KhachHang>) request.getAttribute("choduyet");
                                    if (ve != null) {
                                        for (int index = 0; index < ve.size(); index++) {
                                            KhachHang i = ve.get(index);
                                %>
                                    <tr style="background-color: rgb(174, 177, 177)">
                                        <td><%= i.getId_kh()%></td>
                                        <td hidden><%= i.getLichtrinh().getId_lich_trinh() %></td>
                                        <td hidden><%= i.getSoghe().getId_soghe() %></td>
                                        <td><%= i.getName() %></td>
                                        <td hidden><%= i.getGioi_tinh() %></td>
                                        <td><%= i.getNumber() %></td>
                                        <td><%= i.getLichtrinh().getGa_kh() %></td>
                                        <td><%= i.getLichtrinh().getGa_den() %></td>
                                        <td><%= i.getLichtrinh().getNgay_kh() %></td>
                                        <td><%= i.getLichtrinh().getTime_kh() %></td>
                                        <td><%= i.getSoghe().getHangGhe() %></td>
                                        <td><%= i.getSoghe().getSoGhe() %></td>
                                        <td><%= i.getSoghe().getGiaVe() %></td>
                                        <td><%= i.getCccd() %></td>
                                        <td hidden><%= i.getEmail() %></td>
                                         <td><%= i.getNgay_dk() %></td>
                                        <td><input type="checkbox" id="checkbox-accept" name="veTauids"  value="<%= i.getId_kh()%>" class="custom-checkbox"></td>
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
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const searchInput = document.getElementById('xuat_excel');
            const tableRows = document.querySelectorAll('#top3 table tbody tr');

            searchInput.addEventListener('input', function() {
                const filter = searchInput.value.toLowerCase();

                tableRows.forEach(row => {
                 
                    const nam_dk = row.children[15].innerText.toLowerCase();

                  
                    if (nam_dk.includes(filter)) {
                        row.style.display = ''; 
                    } else {
                        row.style.display = 'none'; 
                    }
                });
            });

        });
        
        document.addEventListener("DOMContentLoaded", function() {
            const searchInput = document.getElementById('search-input');
            const tableRows = document.querySelectorAll('#top3 table tbody tr');

            searchInput.addEventListener('input', function() {
                const filter = searchInput.value.toLowerCase();

                tableRows.forEach(row => {
                    const ten = row.children[3].innerText.toLowerCase(); 
                    const gaKh = row.children[6].innerText.toLowerCase(); 
                    const gaDen = row.children[7].innerText.toLowerCase();
                    const cmt = row.children[13].innerText.toLowerCase();
                  
                    if (ten.includes(filter)|| cmt.includes(filter) || gaKh.includes(filter) || gaDen.includes(filter)) {
                        row.style.display = ''; 
                    } else {
                        row.style.display = 'none'; 
                    }
                });
            });

        });
         function submitDeleteForm() {
            // Kiểm tra xem có checkbox nào được chọn hay không
            const checkboxes = document.querySelectorAll(".custom-checkbox:checked");
            if (checkboxes.length > 0) {
                // Nếu có, gửi form
                document.getElementById("form-xoa-tau").submit();
                document.getElementById("form-xoa-taus").submit();
                   alert("Xóa thành công!");
            } else {
                // Nếu không, hiển thị thông báo
                alert("Vui lòng chọn ít nhất một tàu để xóa!");
            }
        }
        document.addEventListener("DOMContentLoaded", function() {         
            const btnDaDuyet = document.getElementById("btn_Duyet");
            const  btnChuaDuyet = document.getElementById("btn_Cho");
            const btnDatVe = document.getElementById("fromDatVe");
            const choinve = document.getElementById("choinve");
            
            const daDuyetTable = document.getElementById("DaDuyet");
            const chuaDuyetTable = document.getElementById("ChuaDuyet");
            const defaultColor ="rgb(39, 184, 184)";  // Đây là màu nền mặc định của các nút
            const activeColor = "green";
            btnDaDuyet.addEventListener("click", function() {
                    btnChuaDuyet.style.backgroundColor = defaultColor;
                 this.style.backgroundColor = activeColor;
                 this.style.transition = "background-color 0.3s";  
                daDuyetTable.style.display = "block";
                chuaDuyetTable.style.display = "none";
                btnDatVe.style.display ="none";
                choinve.style.display ="block";
                
                 
            });
    
            btnChuaDuyet.addEventListener("click", function() {
                btnDaDuyet.style.backgroundColor = defaultColor;
                this.style.backgroundColor = activeColor;
                this.style.transition = "background-color 0.3s"; 
                daDuyetTable.style.display = "none";
                chuaDuyetTable.style.display = "block";
                 btnDatVe.style.display ="block";
                 choinve.style.display ="none";
            
            });
        });
        document.addEventListener("DOMContentLoaded", function () {
            const iconSetting = document.getElementById("datve");

            iconSetting.addEventListener("click", function () {
                const checkboxes = document.querySelectorAll(".custom-checkbox");
                let isAnyChecked = false;

                checkboxes.forEach((checkbox) => {
                    if (checkbox.checked) {
                        isAnyChecked = true;

                        // Lấy dữ liệu từ hàng được chọn
                        const row = checkbox.closest("tr"); // Hàng chứa checkbox
                        const idKhach = row.cells[0].textContent.trim(); // Mã khách hàng
                       

                        // Đẩy dữ liệu vào form sửa
                        document.getElementById("maKhach").value = idKhach;
                        alert("Duyệt thành công!");
                        
                    }
                });

                if (!isAnyChecked) {
                    alert("Vui lòng chọn một khách hàng để đặt vé!");
                }
            });
        });
        document.getElementById("inve").addEventListener("click", function (event) {
            const checkboxes = document.querySelectorAll(".custom-checkbox");
            let isAnyChecked = false;

            checkboxes.forEach((checkbox) => {
                if (checkbox.checked) {
                    isAnyChecked = true;

                    // Lấy dòng (row) chứa checkbox được chọn
                    const row = checkbox.closest("tr");
                    // Lấy các ô dữ liệu trong dòng
                    const cells = row.querySelectorAll("td");

                    // Gán dữ liệu vào các input tương ứng
                    document.getElementById("malt").value = cells[1].textContent.trim();
                    document.getElementById("ga_kh").value = cells[6].textContent.trim();
                    document.getElementById("ga_den").value = cells[7].textContent.trim();
                    document.getElementById("namekh").value = cells[3].textContent.trim();
                    document.getElementById("cmt").value = cells[13].textContent.trim();
                    document.getElementById("ngay_kh").value = cells[8].textContent.trim();
                    document.getElementById("time_kh").value = cells[9].textContent.trim();
                    document.getElementById("loai_ve").value = cells[10].textContent.trim();
                    document.getElementById("soghe").value = cells[11].textContent.trim();
                    document.getElementById("giave").value = cells[12].textContent.trim();
                }
            });

            if (!isAnyChecked) {
                event.preventDefault(); // Ngăn chặn hành động mặc định của nút
                alert("Vui lòng chọn một khách hàng để in vé!");
            }
        });

    </script>
    
</body>
</html>

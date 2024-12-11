<%-- 
    Document   : QuanLyKhachHang
    Created on : Nov 14, 2024, 12:21:43 AM
    Author     : PC
--%>
<%@page import ="Model.KhachHang"%>
<%@page import ="java.util.List"%>
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
</head>
<body>
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
                        <li style="--delay: 0.1s;"><a style="color: black" href="KhachHangServlet">Quản lý khách hàng</a></li>
                        <li style="--delay: 0.2s;"><a href="TauServlet">Quản lý tàu</a></li>
                        <li style="--delay: 0.3s;"><a href="SoGheTauServlet">Quản lý số ghế</a></li>
                        <li style="--delay: 0.4s;"><a href="QuanLyLichTrinhServlet">Quản lý lịch trình</a></li>
                        <li style="--delay: 0.5s;"><a href="QuanLyVeTauServlet">Quản lý vé</a></li>
                        <li style="--delay: 0.6s;"><a href="">Báo cáo thống kê</a></li>
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
           
                <div style="font-family: 'Montserrat', Courier, monospace; font-weight: bold; font-size: 18px;">
                    Quản lý Khách Hàng
                </div>
             
            </div>
            <div id="top2">
                <div id="top2_container" class="search-box ">
                    <div>
                        <input type="search" id="search-input" placeholder="Tìm kiếm...">
                        
                    </div>
                    <div>
                        <i class='bx bx-printer' id="inve"></i>
                    </div>
                </div>
            </div>
            <div id="top3" >
                <div  id="DaDuyet" style="max-height: 300px; overflow-y: auto;">
                    <table border="3px white">
                        <thead>
                            <tr style="background-color: rgb(59, 57, 57)">
                                <th style="color: white; width: 70px; padding: 10px 0px;">id</th>
                                <th style="color: white; width: 220px;">Họ và tên</th>
                                <th style="color: white; width: 100px;">Giới tính</th>
                                <th style="color: white; width: 150px;">Số điện thoại</th>
                                <th style="color: white; width: 150px;">Chứng minh thư</th>
                                <th style="color: white; width: 180px;">Email</th>
                                <th style="color: white; width: 180px;">Số vé đã đặt</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<KhachHang> nv =(List<KhachHang>)request.getAttribute("KhachHang");
                                if(nv != null){
                                    for(KhachHang i : nv){
                                    
                            %>
                                <tr style="background-color: rgb(174, 177, 177)">
                                    <td><%= i.getId_kh()%></td>
                                    <td><%= i.getName()%></td>
                                    <td><%= i.getGioi_tinh()%></td>
                                    <td><%= i.getNumber()%></td>
                                    <td><%= i.getCccd()%></td>
                                    <td><%= i.getEmail()%></td>
                                    <td><%= i.getTongSoCho()%></td>
                                    <td><input type="checkbox" class="custom-checkbox"></td>
                                </tr>
                            <%
                                   }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
 
    </script>
    
</body>
</html>

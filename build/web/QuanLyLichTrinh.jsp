<%-- 
    Document   : QuanLyKhachHang
    Created on : Nov 14, 2024, 12:21:43 AM
    Author     : PC
--%>
<%@page import ="Model.Tau"%>
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
         #fromThem{
            background-color: rgb(67, 68, 68, 0.5);
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: none;
            z-index: 20;
            height: 100vh;
            width: 100vw;
            font-family: "Montserrat", sans-serif;
            font-weight: 500;
   
        }
        .erro{
            color: red;
            font-size: 15px;
            font-weight: initial;
            font-weight: bold;
        }
        #fromThem button{
            width: 120px;
            height: 35px;
            font-family: "Montserrat", sans-serif;
            font-weight: 500;
            color: white;
            margin: 10px 70px;
            border: none;
        }
        #fromThem button:hover{
            color: aqua;
            background-color: rgb(103, 103, 104);
            transition: 0.3s ease-in-out;
        }
        #fromThem select{
            height: 38px;
            width: 274px;
            outline-color: rgb(91, 230, 255);
            padding: 2px 10px;
        }
        #btn_Huy{
            background-color: red;
        }
        #btn_Them{
            background-color: rgb(7, 137, 212);
        }
        #fromThem input{
            height: 30px;
            width: 250px;
            outline-color: rgb(91, 230, 255);
            padding: 2px 10px;
        }
        .conent_add{
            display: flex;
            justify-content: space-between;
            align-items: center;
          
        }
        .conent_add>div{
            margin: 5px;
        }
        #btn_HuySua{
            background-color: red;
        }
    </style>
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
                    Quản lý Lịch Trình
                </div>
                <div id="fromDatVe">
                    <form action="duyetLichTrinhServlet" method="get">
                        <Button class="btn_chon" id="datve">Duyệt</Button>
                        <input type="hidden" id="maKhach" name="maLT">
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
                        <i class='bx bxs-plus-circle' id="addThem"></i>
                    </div>
                    <div>
                        <i class='bx bxs-trash' style="cursor: pointer; color: red" onclick="submitDeleteForm()"></i>
                    </div>
                    <div>
                        <i class='bx bxs-cog' id="icon_setting"></i>
                    </div>
                </div>
                <div>
                    <form action="DatVeServlet" method="post">
                        <input type="hidden" id="lichtrinhs" name="lichtrinh">
                        <input type="hidden" id="id_taus" name="id_tau">
                        <button type="submit" class="btn_chon" id="btn_datve">Đặt vé</button>
                    </form>
                </div>
            </div>
            <div id="top3" >
                <div  id="DaDuyet" style="max-height: 300px; overflow-y: auto;">
                    <form id="form-xoa-tau" action="QuanLyLichTrinhServlet" method="post">
                        <table border="3px white">
                            <thead>
                                <tr style="background-color: rgb(59, 57, 57)">
                                    <th style="color: white; width: 70px; padding: 10px 0px;">id_lt</th>
                                    <th hidden="" style="color: white; width: 70px; padding: 10px 0px;">id_lt</th>
                                    <th style="color: white; width: 120px;">Số hiệu tàu</th>
                                    <th style="color: white; width: 120px;">Ga khởi hành</th>
                                    <th style="color: white; width: 120px;">Ga đến</th>
                                    <th style="color: white; width: 120px;">Thời gian khởi hành</th>
                                    <th style="color: white; width: 120px;">Thời gian đến</th>
                                    <th style="color: white; width: 120px;">Ngày khởi hành</th>
                                    <th style="color: white; width: 120px;">Ngày đến</th>
                                     <th style="color: white; width: 120px;">Trạng Thái</th>

                                </tr>
                            </thead>
                            <tbody>
                                 <%
                                    List<LichTrinh> lt = (List<LichTrinh>) request.getAttribute("getDuLieu");
                                        if (lt != null) {
                                            for (LichTrinh i : lt) {

                                %>
                                    <tr style="background-color: rgb(174, 177, 177)" >
                                        <th style="color: white; width: 70px; padding: 10px 0px;"><%= i.getId_lich_trinh()%></th>
                                        <th hidden style="color: white; width: 70px; padding: 10px 0px;"><%= i.getTau().getId_tau()%></th>
                                        <th style="color: white; width: 120px;"><%= i.getTau().getSo_hieu_tau()%></th>
                                        <th style="color: white; width: 120px;"><%= i.getGa_kh()%></th>
                                        <th style="color: white; width: 120px;"><%= i.getGa_den()%></th>
                                        <th style="color: white; width: 120px;"><%= i.getTime_kh()%></th>
                                        <th style="color: white; width: 120px;"><%= i.getTime_den() %></th>
                                        <th style="color: white; width: 120px;"><%= i.getNgay_kh()%></th>
                                        <th style="color: white; width: 120px;"><%= i.getNgay_den()%></th>
                                        <th style="color: white; width: 120px;"><%= i.getTrangThai()%></th>
                                        <th style="width: 40px;"><input type="checkbox" id="checkbox-accept" name="lichtrinhid"  value="<%= i.getId_lich_trinh()%>" class="custom-checkbox"></th>
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
            <div id="fromThem">
                <div style="display: flex; justify-content:center; align-items: center;height: 100%;">
                    <form  id="fromContainer" style="background-color: white; padding: 30px; border-radius: 5px;"action="addLichTrinhServlet" method="post">
                        <div style="text-align:end; color: red;"><i class='bx bx-x' id="close"></i></div>
                        <div class="conent_add">
                            <div>
                                <p>Ga Khởi Hành</p>
                                <select required name="gaKhoiHanh" id="ga_kh">
                                    <option value="">Chọn Ga Khởi Hành</option>
                                    <option value="Hà Nội">Hà Nội</option>
                                    <option value="Hải Phòng">Hải Phòng</option>
                                    <option value="Bắc Giang">Bắc Giang</option>
                                    <option value="Bắc Ninh">Bắc Ninh</option>
                                    <option value="Bình Dương">Bình Dương</option>
                                    <option value="Cao Bằng">Cao Bằng</option>
                                    <option value="Hải Dương">Hải Dương</option>
                                    <option value="Hà Giang">Hà Giang</option>
                                    <option value="Hưng Yên">Hưng Yên</option>
                                    <option value="Hòa Binh">Hòa Bình</option>
                                    <option value="Lạng Sơn">Lạng Sơn</option>
                                    <option value="Lào Cai">Lào Cai</option>
                                    <option value="Nam Định">Nam Định</option>
                                    <option value="Ninh Bình">Ninh Bình</option>
                                    <option value="Phú Thọ">Phú Thọ</option>
                                    <option value="Quảng Ninh">Quảng Ninh</option>
                                    <option value="Sơn Tây">Sơn Tây</option>
                                    <option value="Thái Bình">Thái Bình</option>
                                    <option value="Thái Nguyên">Thái Nguyên</option>
                                    <option value="Tuyên Quang">Tuyên Quang</option>
                                    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                </select> 
                            </div>
                            <div>
                                <p>Ga Đến</p>
                                <select required name="gaDen" id="ga_den">
                                     <option value="">Chọn Ga Khởi Hành</option>
                                    <option value="Hà Nội">Hà Nội</option>
                                    <option value="Hải Phòng">Hải Phòng</option>
                                    <option value="Bắc Giang">Bắc Giang</option>
                                    <option value="Bắc Ninh">Bắc Ninh</option>
                                    <option value="Bình Dương">Bình Dương</option>
                                    <option value="Cao Bằng">Cao Bằng</option>
                                    <option value="Hải Dương">Hải Dương</option>
                                    <option value="Hà Giang">Hà Giang</option>
                                    <option value="Hưng Yên">Hưng Yên</option>
                                    <option value="Hòa Binh">Hòa Bình</option>
                                    <option value="Lạng Sơn">Lạng Sơn</option>
                                    <option value="Lào Cai">Lào Cai</option>
                                    <option value="Nam Định">Nam Định</option>
                                    <option value="Ninh Bình">Ninh Bình</option>
                                    <option value="Phú Thọ">Phú Thọ</option>
                                    <option value="Quảng Ninh">Quảng Ninh</option>
                                    <option value="Sơn Tây">Sơn Tây</option>
                                    <option value="Thái Bình">Thái Bình</option>
                                    <option value="Thái Nguyên">Thái Nguyên</option>
                                    <option value="Tuyên Quang">Tuyên Quang</option>
                                    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                </select>
                             
                            </div>
                        </div>
                        <p class="erro" id="err_ga"></p>
                        <div class="conent_add">
                            <div>
                                <p>Thời Gian Khởi Hành</p>
                                <div> <input type="time"  name="timeKhoiHanh" id="time_kh" required></div>
                            </div>
                            <div>
                                <p>Thời Gian Đến</p>
                                <div> <input type="time"  name="timeDen" id="time_den" required></div>
                                  
                            </div>
                        </div>
                        
                        <div class="conent_add">
                            <div>
                                <p>Ngày Khởi Hành</p>
                                <div> <input type="date" readonly name="ngayKhoiHanh" id="ngay_kh" required></div>
                            </div>
                            <div>
                                <p>Ngày Đến</p>
                                <div> <input type="date" name="ngayDen" id="ngay_den" required></div>
                            </div>
                        </div>
                        <p class="erro" id="err_ngay"></p>
                        <div class="conent_add" >
                            <div>
                                <p>Tàu</p>
                                <select required name="idTau">
                                     <option value="">Chọn Tàu</option>
                                       <%
                                        List<Tau> tau1 = (List<Tau>) request.getAttribute("getTauDuyet");
                                        if (tau1 != null) {
                                            for (Tau a : tau1) {                    
                                        %>
                                    <option value="<%= a.getId_tau() %>"><%= a.getId_tau() %></option>
                                     <%
                                            }
                                        }
                                        %>
                                </select>
                            </div>
                            <div>
                                <p>Trạng Thái</p>
                                <select required name="trangThai">
                                    <option value="DaDuyet">Duyệt</option>
                                    <option value="ChuaDuyet">Chờ</option>
                                </select>
                            </div>
                        </div>   
                        <div class="conent_add">
                            <Button id="btn_Huy">Hủy</Button>
                            <button id="btn_Them" type="submit">Thêm</button>
                        </div>
                   </form>
                </div>
            </div>
            <div id="fromThem" class = "fromSua">
                <div style="display: flex; justify-content:center; align-items: center;height: 100%;">
                    <form  id="fromContainer" style="background-color: white; padding: 30px; border-radius: 5px;"action="SuaLichTrinh" method="post">
                        <div style="text-align:end; color: red;"><i class='bx bx-x' id="closeSua"></i></div>
                        <div class="conent_add">
                            <div>
                                <input type="hidden" name="id_lt" id="id_lt" required>
                                <p>Ga Khởi Hành</p>
                                <select required name="gaKhoiHanh" id="ga_khSua">
                                    <option value="">Chọn Ga Khởi Hành</option>
                                    <option value="Hà Nội">Hà Nội</option>
                                    <option value="Hải Phòng">Hải Phòng</option>
                                    <option value="Bắc Giang">Bắc Giang</option>
                                    <option value="Bắc Ninh">Bắc Ninh</option>
                                    <option value="Bình Dương">Bình Dương</option>
                                    <option value="Cao Bằng">Cao Bằng</option>
                                    <option value="Hải Dương">Hải Dương</option>
                                    <option value="Hà Giang">Hà Giang</option>
                                    <option value="Hưng Yên">Hưng Yên</option>
                                    <option value="Hòa Binh">Hòa Bình</option>
                                    <option value="Lạng Sơn">Lạng Sơn</option>
                                    <option value="Lào Cai">Lào Cai</option>
                                    <option value="Nam Định">Nam Định</option>
                                    <option value="Ninh Bình">Ninh Bình</option>
                                    <option value="Phú Thọ">Phú Thọ</option>
                                    <option value="Quảng Ninh">Quảng Ninh</option>
                                    <option value="Sơn Tây">Sơn Tây</option>
                                    <option value="Thái Bình">Thái Bình</option>
                                    <option value="Thái Nguyên">Thái Nguyên</option>
                                    <option value="Tuyên Quang">Tuyên Quang</option>
                                    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                </select>
                                
                            </div>
                            <div>
                                <p>Ga Đến</p>
                                <select required name="gaDen" id="ga_denSua">
                                    <option value="">Chọn Ga Khởi Hành</option>
                                    <option value="Hà Nội">Hà Nội</option>
                                    <option value="Hải Phòng">Hải Phòng</option>
                                    <option value="Bắc Giang">Bắc Giang</option>
                                    <option value="Bắc Ninh">Bắc Ninh</option>
                                    <option value="Bình Dương">Bình Dương</option>
                                    <option value="Cao Bằng">Cao Bằng</option>
                                    <option value="Hải Dương">Hải Dương</option>
                                    <option value="Hà Giang">Hà Giang</option>
                                    <option value="Hưng Yên">Hưng Yên</option>
                                    <option value="Hòa Binh">Hòa Bình</option>
                                    <option value="Lạng Sơn">Lạng Sơn</option>
                                    <option value="Lào Cai">Lào Cai</option>
                                    <option value="Nam Định">Nam Định</option>
                                    <option value="Ninh Bình">Ninh Bình</option>
                                    <option value="Phú Thọ">Phú Thọ</option>
                                    <option value="Quảng Ninh">Quảng Ninh</option>
                                    <option value="Sơn Tây">Sơn Tây</option>
                                    <option value="Thái Bình">Thái Bình</option>
                                    <option value="Thái Nguyên">Thái Nguyên</option>
                                    <option value="Tuyên Quang">Tuyên Quang</option>
                                    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                </select>
                             
                            </div>
                        </div>
                        <p class="erro" id="err_ga"></p>
                        <div class="conent_add">
                            <div>
                                <p>Thời Gian Khởi Hành</p>
                                <div> <input type="time"  name="timeKhoiHanh" id="time_khSua" required></div>
                            </div>
                            <div>
                                <p>Thời Gian Đến</p>
                                <div> <input type="time"  name="timeDen" id="time_denSua" required></div>
                                  
                            </div>
                        </div>
                        
                        <div class="conent_add">
                            <div>
                                <p>Ngày Khởi Hành</p>
                                <div> <input type="date"  name="ngayKhoiHanh" id="ngay_khSua" required></div>
                            </div>
                            <div>
                                <p>Ngày Đến</p>
                                <div> <input type="date" name="ngayDen" id="ngay_denSua" required></div>
                            </div>
                        </div>
                        <p class="erro" id="err_ngay"></p>
                        <div class="conent_add" >
                            <div>
                                <p>Tàu</p>
                                <select required name="idTauSua" id="idTauSua">
                                     <option value="">Chọn Tàu</option>
                                       <%
                                        List<Tau> tau1Sua = (List<Tau>) request.getAttribute("getTauDuyet");
                                        if (tau1Sua != null) {
                                            for (Tau a : tau1Sua) {                    
                                        %>
                                    <option value="<%= a.getId_tau() %>"><%= a.getId_tau() %></option>
                                     <%
                                            }
                                        }
                                        %>
                                </select>
                            </div>
                            <div>
                                <p>Trạng Thái</p>
                                <select required name="trangThaiSua" id="trangThaiSua">
                                    <option value="DaDuyet">Đã Duyệt</option>
                                    <option value="ChuaDuyet">Chưa Duyệt</option>
                                </select>
                            </div>
                        </div>   
                        <div class="conent_add">
                            <Button id="btn_HuySua">Hủy</Button>
                            <button id="btn_Them" type="submit">Cập nhật</button>
                        </div>
                   </form>
                </div>
            </div>
            <div id="top3" >
                <div  id="ChuaDuyet" style="max-height: 300px; overflow-y: auto; display: none;">
                    <table border="3px white">
                        <thead>
                            <tr style="background-color: rgb(59, 57, 57)">
                                <th style="color: white; width: 70px; padding: 10px 0px;">id_lt</th>
                                <th hidden="" style="color: white; width: 70px; padding: 10px 0px;">id_lt</th>
                                <th style="color: white; width: 120px;">Số hiệu tàu</th>
                                <th style="color: white; width: 120px;">Ga khởi hành</th>
                                <th style="color: white; width: 120px;">Ga đến</th>
                                <th style="color: white; width: 120px;">Thời gian khởi hành</th>
                                <th style="color: white; width: 120px;">Thời gian đến</th>
                                <th style="color: white; width: 120px;">Ngày khởi hành</th>
                                <th style="color: white; width: 120px;">Ngày đến</th>
                                 <th style="color: white; width: 120px;">Trạng Thái</th>
                            </tr>
                        </thead>
                        <tbody>
                              <%
                                    List<LichTrinh> ltt = (List<LichTrinh>) request.getAttribute("getDuLieu1");
                                        if (ltt != null) {
                                             for (LichTrinh i : ltt) {   
                               %>
                                        <tr style="background-color: rgb(174, 177, 177)" >
                                            <th style="color: white; width: 70px; padding: 10px 0px;"><%= i.getId_lich_trinh()%></th>
                                            <th hidden="" style="color: white; width: 70px; padding: 10px 0px;"><%= i.getTau().getId_tau()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getTau().getSo_hieu_tau()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getGa_kh()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getGa_den()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getTime_kh()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getTime_den() %></th>
                                            <th style="color: white; width: 120px;"><%= i.getNgay_kh()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getNgay_den()%></th>
                                            <th style="color: white; width: 120px;"><%= i.getTrangThai()%></th>
                                            <th style="width: 40px;"><input type="radio" id="checkbox-accept"  value="<%= i.getId_lich_trinh()%>" class="custom-checkbox"></th>
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
        const huySua = document.getElementById('btn_HuySua');
        const closeSua = document.getElementById('closeSua');
        const fromUpdate = document.getElementsByClassName("fromSua");
        const icon_setting = document.getElementById('icon_setting');
        
        const closeBtn = document.getElementById("close");
        const btnHuy = document.getElementById("btn_Huy");
        const formThem = document.getElementById("fromThem");
        const   btnThem = document.getElementById("addThem");
          function submitDeleteForm() {
            // Kiểm tra xem có checkbox nào được chọn hay không
            const checkboxes = document.querySelectorAll(".custom-checkbox:checked");
            if (checkboxes.length > 0) {
                // Nếu có, gửi form
                document.getElementById("form-xoa-tau").submit();
            } else {
                // Nếu không, hiển thị thông báo
                alert("Vui lòng chọn ít nhất một tàu để xóa!");
            }
        }
        document.addEventListener("DOMContentLoaded", function() {         
            const btnDaDuyet = document.getElementById("btn_Duyet");
            const   btnChuaDuyet = document.getElementById("btn_Cho");
            const btnDatVe = document.getElementById("fromDatVe");
            
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
                 icon_setting.style.display="block";
                 btnThem.style.display="block";
            });
    
            btnChuaDuyet.addEventListener("click", function() {
                 btnDaDuyet.style.backgroundColor = defaultColor;
                this.style.backgroundColor = activeColor;
                this.style.transition = "background-color 0.3s"; 
                daDuyetTable.style.display = "none";
                chuaDuyetTable.style.display = "block";
                 btnDatVe.style.display ="block";
                 icon_setting.style.display="none";
                 btnThem.style.display="none";
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
        //Thêm Vé
        document.addEventListener("DOMContentLoaded", function () {
            // Set current date for Ngày Khởi Hành
            const ngayKh = document.getElementById("ngay_kh");
            const ngayDen = document.getElementById("ngay_den");

            const today = new Date().toISOString().split('T')[0];
            ngayKh.value = today;

            // Set min date for Ngày Đến to be today or after Ngày Khởi Hành
            ngayKh.addEventListener('input', function () {
                ngayDen.min = ngayKh.value;
            });

            ngayDen.addEventListener("change", function () {
                const dateKh = new Date(ngayKh.value);
                const dateDen = new Date(ngayDen.value);

                // Kiểm tra ngày đến không nhỏ hơn ngày khởi hành
                if (dateDen < dateKh) {
                    errNgay.textContent = "Ngày đến phải lớn hơn hoặc bằng ngày khởi hành!";
                    ngayDen.value = ""; // Xóa giá trị ngày đến nếu không hợp lệ
                } else {
                    errNgay.textContent = ""; // Xóa thông báo lỗi nếu hợp lệ
                }
            });
            
            // Validate Ga Khởi Hành and Ga Đến to be different
            const gaKh = document.getElementById("ga_kh");
            const gaDen = document.getElementById("ga_den");

            gaKh.addEventListener("change", function () {
                const selectedGaKh = gaKh.value;
                // Remove the selected Ga Khởi Hành from Ga Đến options
                Array.from(gaDen.options).forEach(option => {
                    if (option.value === selectedGaKh) {
                        option.disabled = true;
                    } else {
                        option.disabled = false;
                    }
                });
            });
           
            gaDen.addEventListener("change", function () {
                const selectedGaKh = gaDen.value;
                // Remove the selected Ga Khởi Hành from Ga Đến options
                Array.from(gaKh.options).forEach(option => {
                    if (option.value === selectedGaKh) {
                        option.disabled = true;
                    } else {
                        option.disabled = false;
                    }
                });
            });

            // Close the form when clicking the close icon or "Hủy" button
           
            btnThem.addEventListener("click", function () {
                formThem.style.display = "block";
            });
            closeBtn.addEventListener("click", function () {
                formThem.style.display = "none";
            });

            btnHuy.addEventListener("click", function () {
                formThem.style.display = "none";
            });
        });
        
        const datve = document.getElementById("btn_datve");

        datve.addEventListener('click', function () {
            const checkboxes = document.querySelectorAll('.custom-checkbox');
    
            let isAnyChecked = false;
            checkboxes.forEach((checkbox, index) => {
                if (checkbox.checked) {
                    isAnyChecked = true;
                    const row = checkbox.closest('tr');
                    
                    const id_lt = row.cells[0].textContent.trim(); 
                    const idTau = row.cells[1].textContent.trim();
                    

                  
                    document.getElementById('lichtrinhs').value = id_lt;
                    document.getElementById('id_taus').value = idTau;
                   

                              
                 
                }
            });

            // Nếu không có checkbox nào được chọn, báo lỗi
            if (!isAnyChecked) {
                alert("Vui lòng chọn ít nhất một mục để sửa!");
            }
        });
        huySua.addEventListener('click', () => {
            Array.from(fromUpdate).forEach((form) => {
                form.style.display = 'none';
            });
        });


        closeSua.addEventListener('click', () => {
            Array.from(fromUpdate).forEach((form) => {
                form.style.display = 'none';
            });
        });
        
        icon_setting.addEventListener('click', function () {
            const checkboxes = document.querySelectorAll('.custom-checkbox');
    
            let isAnyChecked = false;
            checkboxes.forEach((checkbox, index) => {
                if (checkbox.checked) {
                    isAnyChecked = true;
                    const row = checkbox.closest('tr');
                    
                    const id_lt = row.cells[0].textContent.trim(); 
                    const idTau = row.cells[1].textContent.trim();
                    const ga_kh = row.cells[3].textContent.trim();
                    const ga_den = row.cells[4].textContent.trim();
                    const time_kh = row.cells[5].textContent.trim();
                    const  time_den = row.cells[6].textContent.trim();
                    const ngay_kh = row.cells[7].textContent.trim();
                    const ngayden = row.cells[8].textContent.trim();
                    const  trangthai = row.cells[9].textContent.trim();

                  
                    document.getElementById('id_lt').value = id_lt;
                    document.getElementById('idTauSua').value = idTau;
                    document.getElementById('ga_khSua').value = ga_kh;
                    document.getElementById('ga_denSua').value = ga_den;
                    document.getElementById('time_khSua').value = time_kh;
                    document.getElementById('time_denSua').value = time_den;
                    document.getElementById('ngay_denSua').value = ngayden;
                    document.getElementById('ngay_khSua').value = ngay_kh;
                    document.getElementById('trangThaiSua').value = trangthai;
                  

                              
                    if (fromUpdate[index]) {
                        fromUpdate[index].style.display = 'block';
                    }
                }
            });

            // Nếu không có checkbox nào được chọn, báo lỗi
            if (!isAnyChecked) {
                alert("Vui lòng chọn ít nhất một mục để sửa!");
            }
        });
    </script>
    
</body>
</html>

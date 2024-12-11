<%-- 
    Document   : QuanLyGhe
    Created on : Nov 14, 2024, 12:21:58 AM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import ="Model.Tau"%>
<%@page import ="java.util.List"%>
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
    <link rel="icon" href="SuKien/image/Brown and Yellow Vintage Train Travel Logo.png" type="image/x-icon">
    <style>
        /* Thêm lớp CSS cho icon màu xanh và đỏ */
        .icon-green {
            color: green;
        }
        .icon-red {
            color: red;
        }
        #fromAddGhe{
            position: fixed;
            display: none;
            background-color: rgba(104, 102, 102, 0.5);
            height: 100vh;
            width: 100vw;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 20;
            font-family: "Montserrat", sans-serif;
            font-weight: 500;
        }
        #fromAddGhe #fromContainer{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            
        }
        #fromAddGhe #fromContainer form{
            background-color: white;
            border-radius: 5px;
            padding: 20px;
        }
        #fromAddGhe #fromContainer form input{
            width: 280px;
            height: 25px;
            border-radius: 5px;
            border: 1px solid;
            outline: none;
            padding-left: 14px;
            font-family: "Montserrat", sans-serif;
            margin-bottom: 20px;
        }
        #fromAddGhe #fromContainer form select{
            height: 25px;
            border-radius: 5px;
            border: 1px solid;
            outline: none;
            width: 120px;
            text-align: center;
            font-family: "Montserrat", sans-serif;
        }
        #fromAddGhe #fromContainer form button{
            width: 100px;
            height: 30px;
            border: none;
            color: white;
            font-weight: 600;
        }
        #fromAddGhe #fromContainer form #huy{
            background-color: rgb(241, 54, 54);
        }
        #fromAddGhe #fromContainer form #add{
            background-color: rgb(13, 188, 194);
        }
        #fromAddGhe #fromContainer form #add:hover{
            background-color: rgb(65, 66, 66);
            color: rgb(7, 216, 216);
            transition: 0.3s ease-in-out;
       
        }
        #fromAddGhe #fromContainer form #huy:hover{
            background-color: rgb(65, 66, 66);
            color: rgb(7, 216, 216);
            transition: 0.3s ease-in-out;
        }
        #fromAddGhe #fromContainer form>div{
            margin-bottom: 15px;
        }
        #fromAddGhe #fromContainer form .font{
            margin-bottom: 5px;
        }
        .huySua{
            background-color: rgb(241, 54, 54);
        }
        .huySua:hover{
            background-color: rgb(65, 66, 66);
            color: rgb(7, 216, 216);
            transition: 0.3s ease-in-out;
        }
    </style>
</head>
<body>
     
    <div id="body">
        <div style="display: flex; align-items: center; justify-content: space-between; padding: 0px 40px;">
            <div>
                <a href="TrangChu.jsp"><img src="SuKien/image/Brown and Yellow Vintage Train Travel Logo.png" alt="" style="width: 70px;height: 50px;"></a>
            </div>
            <div id="name">
                <div>ỨNG DỤNG QUẢN LÝ TÀU MR.QK</div>
            </div>
            <div>
                
            </div>
        </div>
        <div>
            <ul>
                <li class="menu">Menu
                    <ul class="submenu">
                        <li style="--delay: 0.1s;"><a href="KhachHangServlet">Quản lý khách hàng</a></li>
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
            <div class ="top_tau">
                <div style="font-family: 'Montserrat', Courier, monospace; font-weight: bold; font-size: 18px;">
                    Quản lý số ghế tàu
                </div>
            </div>
            <div id="top_tau_container">
                 <div>
                        <div id="top2">
                            <div id="top2_container" class="search-box ">
                                <div>
                                    <input type="search" id="search-input" placeholder="Tìm kiếm...">
                                    <i id="timkiem" class='bx bx-search'></i>
                                </div>
                                <div>
                                    <i class='bx bxs-plus-circle' id="icon_add"></i>
                                </div>
                                <div>
                                    <i class='bx bxs-trash icon-red' style="cursor: pointer;" onclick="submitDeleteForm()"></i>
                                </div>
                                <div>
                                    <i class='bx bxs-cog' id="icon_setting"></i>
                                </div>
                            </div>
                        </div>

                        <div id="top3">
                            <div style="max-height: 300px; overflow-y: auto;">
                                <form id="form-xoa-tau" style="display: flex" action="SoGheTauServlet" method="post">
                                     <table border="3px white">
                                    <thead>
                                        <tr style="background-color: rgb(59, 57, 57)">
                                            <th style="color: white; width: 70px; padding: 10px 0px;">id_soghe</th>
                                            <th style="color: white; width: 70px; padding: 10px 0px;">id_tau</th>
                                            <th style="color: white; width: 120px;">Số hiệu tàu</th>
                                            <th style="color: white; width: 120px;">Số ghế</th>
                                            <th style="color: white; width: 120px;">Hàng Ghế</th>
                                            <th style="color: white; width: 120px;">Giá</th>
                                            <th style="color: white; width: 150px;">Trạng Thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<SoGhe> nv =(List<SoGhe>)request.getAttribute("getSoGhe");
                                            if(nv != null){
                                                for(SoGhe i : nv){

                                                 
                                        %>
                                        <tr style="background-color: rgb(174, 177, 177)">
                                            <th style="color: white; width: 70px; padding: 10px 0px;"><%= i.getId_soghe()%></th>
                                            <th style="color: white; width: 70px; padding: 10px 0px;"><%= i.getTau().getId_tau() %></th>
                                            <th style="color: white; width: 200px; padding-left: 5px;"><%= i.getTau().getSo_hieu_tau() %></th>
                                            <th style="color: white; width: 200px;"><%= i.getSoGhe() %></th>
                                            <th style="color: white; width: 200px;"><%= i.getHangGhe() %></th>
                                            <th style="color: white; width: 200px;"><%= i.getGiaVe() %></th>
                                             <th style="color: white; width: 200px;"><%= i.getTrangThai()%></th>
                                            <th style="width: 40px;"><input  name="idGhe" value="<%= i.getId_soghe()%>" type="checkbox" class="custom-checkbox"></th>
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
                    <div id="fromAddGhe">
                        <div id="fromContainer">
                            <form action="addSoGhe" method="post" >
                                <div style="text-align:end; color: red;"><i class='bx bx-x' id="close"></i></div>
                               <div style="display: flex; justify-content: space-between; align-items: center;">
                                    <div>
                                        <div class="font">Tàu</div>
                                        <select id="idtau" name="idtau" required>
                                        <%
                                            List<Tau> sgtau = (List<Tau>) request.getAttribute("getTau");
                                            if (sgtau != null) {
                                                for (Tau a : sgtau) {                    
                                        %>
                                            <option value="<%= a.getId_tau()%>"><%= a.getId_tau()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                        </select>
                                    </div>
                                    <div>
                                        <div class="font">Hạng Ghế</div>
                                        <select id="hangghe" name="hangghe">
                                            <option >Chọn hạng ghế</option>
                                            <option value="Thường">Thường</option>
                                            <option value="Vip">Vip</option>
                                        </select>
                                    </div>
                               </div>
                                <div>
                                    <div class="font">
                                        Số ghế
                                    </div>
                                    <div><input type="number" id="soghe" name="soghe" ></div>
                                  
                                </div>
                                <div>
                                    <input type="hidden" id="gia" name="gia">
                                </div>
                                <div style="display: flex; justify-content: space-around; align-items: center;">
                                    <button id="huy">Hủy</button>
                                    <button id="add">Thêm số ghế</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="fromAddGhe" class="fromUpdate">
                        <div id="fromContainer">
                            <form action="SuaSoGhe" method="post" >
                                <div style="text-align:end; color: red;"><i class='bx bx-x' id="closeSua" ></i></div>
                               <div style="display: flex; justify-content: space-between; align-items: center;">
                                   <input type="hidden" id="MaSoGhe" name="MaSoGhe">
                                    <div>
                                        <div class="font">Tàu</div>
                                   <select id="Suaidtau" name="idtau" required>
                                        <%
                                            List<Tau> sgtauSua = (List<Tau>) request.getAttribute("getTau");
                                            if (sgtauSua != null) {
                                                for (Tau a : sgtauSua) {                    
                                        %>
                                            <option value="<%= a.getId_tau()%>"><%= a.getId_tau()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>

                                    </div>
                                    <div>
                                        <div class="font">Hạng Ghế</div>
                                        <select id="Suahangghe" name="hangghe">
                                            <option value="Thường">Thường</option>
                                            <option value="Vip">Vip</option>
                                        </select>
                                    </div>
                               </div>
                                <div>
                                    <div class="font">
                                        Số ghế
                                    </div>
                                    <div><input type="number" id="Suasoghe" name="soghe"></div>
                                    <span id="error-message" style="color: red; font-size: 12px;"></span>
                                </div>
                                <div>
                                    <div class="font" id="TrangThai">Trạng Thái</div>
                                    <select id="Suahangghe" name="TrangThai">
                                        <option value="con">Còn</option>
                                        <option value="het">Hết</option>
                                    </select>
                                </div>
                                <div>
                                    <input type="hidden" id="Suagia" name="gia">
                                </div>
                                <div style="display: flex; justify-content: space-around; align-items: center;">
                                    <button id="huySua" class="huySua">Hủy</button>
                                    <button id="add">Cập nhật</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="top2_tau_container">
                         <div class="title" style="display: flex; justify-items: center; align-items: center;">
                                <div>Số ghế của tàu:</div>
                                <form action="SoGheTauServlet" method="GET" style="display: flex; justify-items: center; align-items: center;"> <!-- Điền vào action servlet tương ứng -->
                                    <select style="height: 38px; border: none; border-radius: 3px;width: 120px;text-align: center; padding: 4px;" 
                                            id="options" name="id_tau">
                                        <%
                                        List<Tau> tau1 = (List<Tau>) request.getAttribute("getTau");
                                        if (tau1 != null) {
                                            for (Tau a : tau1) {                    
                                        %>
                                        <option value="<%= a.getId_tau() %>"><%= a.getId_tau() %></option>
                                        <%
                                            }
                                        }
                                        %>
                                    </select>
                                    <button  style="border: none; width: 30px; height: 30px; background-color: white;" type="submit"><i class='bx bx-search'></i></button>
                                </form>
                        </div>
                        <div class="status" style="max-height: 300px; overflow-y: auto;">  
                                <%
                                List<SoGhe> soghe =(List<SoGhe>)request.getAttribute("getGhe");
                                    if(soghe != null){
                                        for(SoGhe i : soghe){               
                                %>
                               <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center;">
                                    <i class='bx bxs-calendar-alt' style="margin-right: 8px;color: <%= i.getTrangThai().equals("het") ? "red" : "green" %>; "></i>
                                    <p style="font-family: 'Montserrat', Courier, monospace; font-weight: bold; margin: 4px 0;"><%= i.getSoGhe() %></p>
                                    <p style="margin: 4px 0;" hidden=""><%= i.getTrangThai() %></p>
                                </div>
                                <%
                                        }
                                    }
                                %>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <script>
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
             document.addEventListener("DOMContentLoaded", function () {
           const timkiem = document.getElementById('search-input');
           const tableRows = document.querySelectorAll('#top3 table tbody tr');

           timkiem.addEventListener('input', function () {
               const filter = timkiem.value.toLowerCase();
               tableRows.forEach(row => {
                   const sohieu = row.children[3].innerText.toLowerCase(); // Cột "Số hiệu tàu"
                   const name = row.children[5].innerText.toLowerCase(); // Cột "Tên tàu"
                   const trangthai = row.children[7].innerText.toLowerCase(); // Cột "Trạng thái"

                   console.log(`Filter: ${filter}, Số hiệu: ${sohieu}, Tên: ${name}, Trạng thái: ${trangthai}`);

                   if (sohieu.includes(filter) || name.includes(filter) || trangthai.includes(filter)) {
                       row.style.display = ''; // Hiển thị hàng
                   } else {
                       row.style.display = 'none'; // Ẩn hàng
                   }
               });
           });
       });
       
        function hideForm() {
            form.style.display = 'none'; // Ẩn form
        }
        function OpenForm() {
            form.style.display = 'block'; // Ẩn form
        }

        const form = document.getElementById('fromAddGhe');
        const closeButton = document.getElementById('close');
        const cancelButton = document.getElementById('huy');
        const addButton = document.getElementById('icon_add');
        const hangghe = document.getElementById('hangghe');
        const giaInput = document.getElementById('gia');

        addButton.addEventListener('click', OpenForm);
        closeButton.addEventListener('click', hideForm);
        cancelButton.addEventListener('click', hideForm);

        hangghe.addEventListener('change', function () {
            const selectedValue = hangghe.value;

            if (selectedValue === "Thường") {
                giaInput.value = 10000; // 
            } else if (selectedValue === "Vip") {
                giaInput.value = 20000; 
            } else {
                giaInput.value = "";
            }
        });
        
        const huySua = document.getElementById('huySua');
        const closeSua = document.getElementById('closeSua');
        const fromUpdate = document.getElementsByClassName("fromUpdate");
        const icon_setting = document.getElementById('icon_setting');

       icon_setting.addEventListener('click', function () {
        const checkboxes = document.querySelectorAll('.custom-checkbox');

        let isAnyChecked = false;
        checkboxes.forEach((checkbox) => {
            if (checkbox.checked) {
                isAnyChecked = true;
                const row = checkbox.closest('tr');
                const id_SoGhe = row.cells[0].textContent.trim(); 
                const idTau = row.cells[1].textContent.trim();
                const SoGhe = row.cells[3].textContent.trim();
                const HangGhe = row.cells[4].textContent.trim();
                const Gia = row.cells[5].textContent.trim();
                const trangThai = row.cells[6].textContent.trim();

                // Đẩy dữ liệu vào form sửa
                document.getElementById('MaSoGhe').value = id_SoGhe;
                document.getElementById('Suaidtau').value = idTau;
                document.getElementById('Suasoghe').value = SoGhe;
                document.getElementById('Suahangghe').value = HangGhe;
                document.getElementById('Suagia').value = Gia;
                document.getElementById('TrangThai').value = trangThai;

                // Hiển thị form sửa (hiển thị đúng một form sửa)
                document.querySelector('.fromUpdate').style.display = 'block';
            }
        });

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
        const giaInputSua = document.getElementById('Suagia');
        const hanggheSua = document.getElementById('Suahangghe');

        hanggheSua.addEventListener('change', function () {
            const selectedValue = hanggheSua.value;

            if (selectedValue === "Thường") {
                giaInputSua.value = 10000; // 
            } else if (selectedValue === "Vip") {
                giaInputSua.value = 20000; 
            } else {
                giaInputSua.value = "";
            }
        });
    </script>
</body>
</html>

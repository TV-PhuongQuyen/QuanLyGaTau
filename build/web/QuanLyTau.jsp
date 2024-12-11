<%-- 
    Document   : QuanLyTau
    Created on : Nov 14, 2024, 12:21:49 AM
    Author     : PC
--%>
<%@page import ="Model.Tau"%>
<%@page import ="java.util.List"%>
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
    <link rel="icon" href="SuKien/image/Brown and Yellow Vintage Train Travel Logo.png" type="image/x-icon">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <style>
        /* Thêm lớp CSS cho icon màu xanh và đỏ */
        .icon-green {
            color: green;
        }
        .icon-red {
            color: red;
        }
        #themTau{
            background-color: rgb(67, 68, 68, 0.5);
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: none;
            z-index: 20;
            height: 100vh;
            width: 100vw;
   
        }
        #themTau input{
            width: 98%;
            height: 35px;
            border: 0.2px solid;
            border-radius: 2px;
            outline: none;
         
        }
        #themTau select{
            border: 0.2px solid;
            font-family: "Montserrat", sans-serif;
            font-weight: 500;
            height: 35px;
            width: 100px;
            outline: none;
        }
        #themTau div{
            margin: 12px 0px;
        }
        #themTau button{
            margin-top: 10px;
            width: 120px;
            height: 35px;
            border: none;
            border-radius: 3px;
            font-family: "Montserrat", sans-serif;
            font-weight: 500;
            color: white;
            cursor: context-menu;
        }
        #themTau button:hover{
            color: aqua;
            background-color: rgb(66, 63, 63);
        }
        .font{
            font-family: "Montserrat", sans-serif;
            font-weight: 500;
        }
        .err{
            color: red;
            font-weight: initial;
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
            
            
          

            if (status && message ) {
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
            <div class ="top_tau">
                <div style="font-family: 'Montserrat', Courier, monospace; font-weight: bold; font-size: 18px;">
                    Quản lý tàu
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
                          <form id="form-xoa-tau" action="TauServlet" method="post">
                                <table border="3px white">
                                    <thead>
                                        <tr style="background-color: rgb(59, 57, 57)">
                                            <th style="color: white; width: 70px; padding: 10px 0px;">ID</th>
                                            <th style="color: white; width: 120px;">Số hiệu tàu</th>
                                            <th style="color: white; width: 120px;">Tên Tàu</th>
                                            <th style="color: white; width: 150px;">Trạng Thái</th>
                                      
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<Tau> tau = (List<Tau>) request.getAttribute("getTau");
                                            if (tau != null) {
                                                for (Tau i : tau) {
                                        %>
                                        <tr style="background-color: rgb(174, 177, 177)" id="bang">
                                            <td style="color: white; text-align: center;width: 70px; padding: 10px 0px;"><%= i.getId_tau() %></td>
                                            <td style="color: white;text-align: center; width: 200px; padding-left: 5px;"><%= i.getSo_hieu_tau() %></td>
                                            <td style="color: white;text-align: center; width: 200px;"><%= i.getTen_tau() %></td>
                                            <td style="color: white;text-align: center; width: 200px;"><%= i.getTrangThai() %></td>
                                            <td style="width: 40px; text-align: center; vertical-align: middle;">
                                                <input type="checkbox" name="idTau" value="<%= i.getId_tau() %>" class="custom-checkbox">
                                            </td>
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
                <div id="themTau">
                  <div style="display: flex;justify-content: center; align-items: center; height: 100%;">
                    <form  id="addForm" style="background-color: white; width: 400px; height: 470px; padding-top: 10px;" action="addTauServlet" method="get">
                        <div style="text-align:end; color: red;"><i class='bx bx-x' id="close"></i></div>
                        <div  style="display: flex; justify-content: center;">
                            <div style="  width: 100%; padding: 0 40px;" >
                                <div>
                                    <div class="font">Số hiệu tàu</div>
                                    <div><input type="text" required id="soHieuTau" name="sohieu"></div>
                                    <div id="erro_Sh" class="err"></div>
                                </div>
                                <div>
                                    <div class="font">Tên tàu</div>
                                    <div><input type="text" required id="tenTau" name="ten"></div>
                                    <div id="erro_name" class="err"></div>
                                </div>
                                <div>
                                    <div class="font">Trạng Thái</div>
                                    <select required  id="trangThai" name="trangthai">
                                        <option value="HoatDong">Hoạt Động</option>
                                        <option value="Dừng">Dừng</option>
                                    </select>
                                </div>
                                <div style="display: flex; justify-content: space-between; align-items: center; ">
                                    <button id="huy" style="background-color: red;">Hủy</button>
                                    <button type="submit" style="background-color: rgb(47, 168, 224);">Thêm</button>
                                </div>
                            </div>
                        </div>
                    </form>
                  </div>
                </div>
                <div id="themTau"  class="fromSua">
                  <div style="display: flex;justify-content: center; align-items: center; height: 100%;">
                      <form  id="addForm" style="background-color: white; width: 400px; height: 470px; padding-top: 10px;" action="SuaTauServlet" method="post">
                        <div style="text-align:end; color: red;"><i class='bx bx-x' id="closeSua"></i></div>
                        <div  style="display: flex; justify-content: center;">
                            <div style="  width: 100%; padding: 0 40px;" >
                                <div>
                                    <div class="font">Số hiệu tàu</div>
                                    <div><input type="text" required id="SuasoHieuTau" name="SuasoHieuTau"></div>
                                    <div><input type="hidden" required id="suaMa" name="suaMa"></div>
                                    <div id="erro_Sh" class="err"></div>
                                </div>
                                <div>
                                    <div class="font">Tên tàu</div>
                                    <div><input type="text" required id="SuatenTau" name="SuatenTau"></div>
                                    <div id="erro_name" class="err"></div>
                                </div>
                                <div>
                                    <div class="font">Trạng Thái</div>
                                    <select required  id="SuatrangThai" name="SuaTrangThai">
                                        <option value="HoatDong">Hoạt Động</option>
                                        <option value="Dừng">Dừng</option>
                                    </select>
                                </div>
                                <div style="display: flex; justify-content: space-between; align-items: center; ">
                                    <button id="huySua" style="background-color: red;">Hủy</button>
                                    <button type="submit" style="background-color: rgb(47, 168, 224);">Cập nhật</button>
                                </div>
                            </div>
                        </div>
                    </form>
                  </div>
                </div>
                <div id="top2_tau_container">
                    <div class="title">
                        Tàu Hoạt Động
                    </div>
                    <div class="status" style="max-height: 300px; overflow-y: auto;">
                        <%
                            List<Tau> tau_chitiet = (List<Tau>) request.getAttribute("getTau");
                            if (tau_chitiet != null) {
                                for (Tau e : tau_chitiet) {
                                   
                          %>
                          <div>
                            <i class="bx bx-bus-school" style="color: <%= e.getTrangThai().equals("Dung") ? "red" : "green" %>;"></i>
                              <p style="font-family: 'Montserrat', Courier, monospace; font-weight: bold;"><%= e.getSo_hieu_tau() %></p>
                              <p hidden=""><%= e.getTrangThai() %></p>
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
        const closeS = document.getElementById('close');
        const fromThem = document.getElementById('themTau');
        const btn_Huy = document.getElementById('huy');
        const icon_setting = document.getElementById('icon_setting');
        const add = document.getElementById('icon_add');
        const soHieuTauInput = document.getElementById('soHieuTau');
        const tenTauInput = document.getElementById('tenTau');
        const erroSh = document.getElementById('erro_Sh');
        const erroName = document.getElementById('erro_name');
        const addForm = document.getElementById('addForm');
        
        const fromSua = document.getElementsByClassName('fromSua');
        const huySua = document.getElementById('huySua');
        const closeSua = document.getElementById('closeSua'); 
        
        const regex = /^(?=.*[a-zA-Z])(?=.*\d).{3,}$/;
            
        // Hiển thị form Thêm
        add.addEventListener('click', () => fromThem.style.display = 'block');
        // Đóng form Thêm
        closeS.addEventListener('click', () => fromThem.style.display = 'none');
        btn_Huy.addEventListener('click', () => fromThem.style.display = 'none');

        // Kiểm tra đầu vào
        function validateInput(input, errorElement, fieldName) {
            if (!regex.test(input.value)) {
                errorElement.textContent = `${fieldName} phải có ít nhất 3 ký tự bao gồm cả chữ và số.`;
                return false;
            } else {
                errorElement.textContent = '';
                return true;
            }
        }

        // Kiểm tra khi nhập
        soHieuTauInput.addEventListener('input', () => validateInput(soHieuTauInput, erroSh, 'Số hiệu tàu'));
        tenTauInput.addEventListener('input', () => validateInput(tenTauInput, erroName, 'Tên tàu'));

        // Xử lý khi nhấn nút "Thêm"
        addForm.addEventListener('submit', (e) => {
            const isSoHieuValid = validateInput(soHieuTauInput, erroSh, 'Số hiệu tàu');
            const isTenTauValid = validateInput(tenTauInput, erroName, 'Tên tàu');

            // Nếu không hợp lệ, chặn submit
            if (!isSoHieuValid || !isTenTauValid) {
                e.preventDefault();
            } else {
                alert("Thêm thành công!");
                fromThem.style.display = 'none';
            }
        });
        const existingSoHieuTau = <%= new com.google.gson.Gson().toJson(tau.stream().map(Tau::getSo_hieu_tau).toList()) %>;
        
        
    icon_setting.addEventListener('click', function () {
      const checkboxes = document.querySelectorAll('.custom-checkbox');
      let isAnyChecked = false;

      checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
          isAnyChecked = true;

          // Lấy dữ liệu từ hàng được chọn
          const row = checkbox.closest('tr');
          const idTau = row.cells[0].textContent.trim(); // Mã tàu
          const soHieuTau = row.cells[1].textContent.trim();
          const tenTau = row.cells[2].textContent.trim();
          const trangThai = row.cells[3].textContent.trim();

          // Đẩy dữ liệu vào form sửa
          document.getElementById('suaMa').value = idTau;
          document.getElementById('SuasoHieuTau').value = soHieuTau;
          document.getElementById('SuatenTau').value = tenTau;
          document.getElementById('SuatrangThai').value = trangThai;

          // Hiển thị form sửa
          document.querySelector('.fromSua').style.display = 'block';
        }
      });

      // Nếu không có checkbox nào được chọn, báo lỗi
      if (!isAnyChecked) {
        alert("Vui lòng chọn ít nhất một mục để sửa!");
      }
    });

    // Ẩn form sửa khi nhấn nút hủy hoặc icon X
    document.getElementById('huySua').addEventListener('click', () => {
      document.querySelector('.fromSua').style.display = 'none';
    });

    document.getElementById('closeSua').addEventListener('click', () => {
      document.querySelector('.fromSua').style.display = 'none';
    });

    </script>

</body>
</html>

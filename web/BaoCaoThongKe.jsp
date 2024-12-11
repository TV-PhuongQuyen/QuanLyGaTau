<%-- 
    Document   : BaoCaoThongKe
    Created on : Nov 14, 2024, 12:22:35 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="SuKien/CSS/trangchu.css">
    <link rel="icon" href="SuKien/image/Brown and Yellow Vintage Train Travel Logo.png" type="image/x-icon">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
      canvas {
          max-width: 1200px;
          margin: 0 auto;
      }
      .error {
          color: red;
      }
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
        <div>
            <ul>
                <li class="menu">Menu
                    <ul class="submenu">
                         <li style="--delay: 0.1s;"><a style="color: black" href="KhachHangServlet">Quản lý khách hàng</a></li>
                        <li style="--delay: 0.2s;"><a href="TauServlet">Quản lý tàu</a></li>
                        <li style="--delay: 0.3s;"><a href="SoGheTauServlet">Quản lý số ghế</a></li>
                        <li style="--delay: 0.4s;"><a href="QuanLyLichTrinhServlet">Quản lý lịch trình</a></li>
                        <li style="--delay: 0.5s;"><a href="QuanLyVeTauServlet">Quản lý vé</a></li>
                        <li style="--delay: 0.6s;"><a style="color: black" href="ThongKeKhachServlet">Báo cáo thống kê</a></li>
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
        <div id="" style="height: 600px;">
          <div style="display: flex; align-items: center;">
            <a id="khachhang" style="margin: 0px 5px; color: brown;" href="ThongKeKhachServlet">Khách Hàng</a>
            <p>|</p>
            <a id="DoanhThu" style="margin: 0px 5px;" href="ThongKeDoanhThuServlet">Doanh Thu</a>
        </div>
        <div style="margin-left: 5px;">
          <form method="post" action="ThongKeKhachServlet">
              <input type="text" id="nam" name="nam" style="height: 20px; width: 17 0px; outline: none;border-radius: 5px; border: 1px solid;" required>
              <button type="submit" style="">Tìm</button>
          </form>
        </div>
            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>
            <c:if test="${not empty thongKe}">
                <h2 style="text-align: center">Biểu đồ thống kê năm ${nam}</h2>
                <canvas id="thongKeChart" style="    width: 600px; height: 400px"></canvas>
                <script>
                    // Lấy dữ liệu từ server
                    const labels = [];
                    const data = [];
                    <c:forEach var="tk" items="${thongKe}">
                        labels.push("Tháng ${tk.thang}");
                        data.push(${tk.soLuong});
                    </c:forEach>

                    // Cấu hình biểu đồ
                    const ctx = document.getElementById('thongKeChart').getContext('2d');
                    new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Số lượng khách hàng',
                                data: data,
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    ticks: {
                                        stepSize: 1
                                    }
                                }
                            },
                            plugins: {
                                tooltip: {
                                    callbacks: {
                                        label: function(context) {
                                            return `${context.raw} khách hàng`;
                                        }
                                    }
                                },
                                datalabels: {
                                    display: true,
                                    align: 'end',
                                    anchor: 'end',
                                    formatter: (value) => `${value}`
                                }
                            }
                        }
                    });
                </script>
            </c:if>
        </div>
    </div>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống kê doanh thu theo tháng</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        canvas {
            max-width: 800px;
            margin: 0 auto;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <h1>Thống kê doanh thu theo tháng</h1>

    <!-- Form nhập năm -->
    <form method="post" action="ThongKeDoanhThuServlet">
        <label for="nam">Nhập năm:</label>
        <input type="text" id="nam" name="nam" required>
        <button type="submit">Tìm</button>
    </form>

    <!-- Hiển thị lỗi nếu có -->
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <c:if test="${not empty thongKeDoanhThu}">
        <h2>Biểu đồ thống kê doanh thu năm ${nam}</h2>
        <canvas id="thongKeDoanhThuChart"></canvas>
        <script>
            // Dữ liệu cho biểu đồ
            const labelsDoanhThu = [];
            const dataDoanhThu = [];
            <c:forEach var="tk" items="${thongKeDoanhThu}">
                labelsDoanhThu.push('Tháng ${tk["thang"]}');
                dataDoanhThu.push(${tk["doanhThu"]});
            </c:forEach>

            // Cấu hình biểu đồ
            const ctxDoanhThu = document.getElementById('thongKeDoanhThuChart').getContext('2d');
            new Chart(ctxDoanhThu, {
                type: 'bar',
                data: {
                    labels: labelsDoanhThu,
                    datasets: [{
                        label: 'Doanh thu (VND)',
                        data: dataDoanhThu,
                        backgroundColor: 'rgba(153, 102, 255, 0.2)',
                        borderColor: 'rgba(153, 102, 255, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 100000
                            }
                        }
                    }
                }
            });
        </script>
    </c:if>
</body>
</html>

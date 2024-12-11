<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thống kê khách hàng</title>
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
    <h1>Thống kê số lượng khách hàng đã duyệt theo tháng</h1>

    <!-- Form nhập năm -->
    <form method="post" action="ThongKeKhachServlet">
        <input type="text" id="nam" name="nam" style="height: 20px; width: 17 0px; outline: none;border-radius: 5px; border: 1px solid;" required>
        <button type="submit" style="">Tìm</button>
     </form>

    <!-- Hiển thị lỗi nếu có -->
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <!-- Hiển thị biểu đồ nếu có dữ liệu thống kê -->
    <c:if test="${not empty thongKe}">
        <h2>Biểu đồ thống kê năm ${nam}</h2>
        <canvas id="thongKeChart"></canvas>
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

</body>
</html>

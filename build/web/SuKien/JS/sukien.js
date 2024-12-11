/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const checkbox = document.getElementById("checkbox-accept");
const btnDatVe = document.getElementById("btn_datve");

const datVeDichVu = document.querySelector(".datve_dichvu");
const closeBtn = document.querySelector(".datve_dichvu .bx-x");

// Khi người dùng click nút "Đặt vé"
btnDatVe.addEventListener("click", function() {
    if (checkbox.checked) {
        // Nếu checkbox được chọn, hiển thị form
        datVeDichVu.style.display = "block";
    } else {
        alert("Vui lòng chọn đồng ý trước khi đặt vé.");
    }
});

// Đóng form khi người dùng click vào icon đóng
closeBtn.addEventListener("click", function() {
    datVeDichVu.style.display = "none";
});
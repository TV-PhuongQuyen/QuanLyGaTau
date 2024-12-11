<%-- 
    Document   : inVe
    Created on : Nov 19, 2024, 8:01:19 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>

    <style>
        body {
            background-image: url('SuKien/image/Background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        button {
            width: 120px;
            height: 40px;
            border: none;
            font-family: "Montserrat", sans-serif;
            color: white;
            font-weight: bold;
            border-radius: 3px;
            background-color: rgb(39, 184, 184);
            margin-top: 4px;
        }
        .font {
            font-family: "Montserrat", sans-serif, 'Courier New', Courier, monospace;
            font-weight: bold;
            font-size: 20px;
        }
        .font_container {
            font-family: "Montserrat", sans-serif, 'Courier New', Courier, monospace;
            margin: 5px 0px;
        }
        .content_ve {
            margin-bottom: 34px;
            font-size: 15px;
        }
        button:hover {
            color: aqua;
            background-color: rgb(125, 126, 128);
            transition: 0.3s ease-in-out;
        }
        i:hover {
            color: black;
            transition: 0.3s ease-in-out;
        }
        #veTau_content {
            background-image: url('SuKien/image/Background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            justify-content: center;
            color: rgb(255, 255, 255);
            font-weight: bold;
        }
        #fromMo {
            background-color: rgba(59, 57, 57, 0.6);
        }
        #modal_qr {
        
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .modal_content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            width: 400px;
            position: relative;
        }
        .modal_content img {
            width: 400px;
            height: 400px;
            margin-bottom: 10px;
        }
        .modal_content p {
            margin: 5px 0;
            font-family: "Montserrat", sans-serif;
        }
        .modal_close {
            position: absolute;
            top: 10px;
            right: 10px;
        
            cursor: pointer;
            font-size: 20px;
            color: red;
        }
        .modal_close:hover {
            color: black;
        }
        
    </style>
</head>
<body>
    <div id="vetau_container" style="border: 1px solid; width: 600px; height: 340px; padding: 10px 50px; background-color: white;">
        <div style="text-align: end; font-size: 25px; color: red;">
            <a href="QuanLyVeTauServlet"> <i class='bx bx-x'></i></a>
        </div>
        <div id="veTau_content">
            <div id="fromMo" style="border: 1px solid; padding: 20px;">
               
            </div>
        </div>
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <button onclick="printTicket()">In vé</button>
            <button id="ThanhToan">Thanh toán</button>
        </div>
        <div id="modal_qr" style="display: none;">
            <div class="modal_content">
                <span class="modal_close" id="close_modal">&times;</span>
                <img class="course_qr_img" src="SuKien/image/QR.jpg" alt="QR Code">
   
            </div>
        </div>
    </div>

    <script>
        function printTicket() {
            const originalContent = document.body.innerHTML; // Lưu lại nội dung ban đầu
            const ticketContent = document.getElementById('veTau_content').outerHTML;

            document.body.innerHTML = ticketContent; // Thay đổi nội dung của body thành nội dung vé
            window.print(); // Thực hiện in
            document.body.innerHTML = originalContent; // Khôi phục lại nội dung ban đầu sau khi in
            location.reload(); 
        }

     

        document.addEventListener("DOMContentLoaded",() =>{
            const courseInner = document.getElementById("fromMo");
           
            let coursesRenderUI ="";
            coursesRenderUI += `
            <div class="font" style="display: flex; justify-content: space-between;">
                    <div>Logo</div>
                    <div>Ga Tàu MR.QK</div>
                    <div>${matau}</div>
                </div>
                <div class="font_container" style="text-align: center;">Vé Tàu</div>
                <div style="display: flex; justify-content: space-between; font-family: 'Montserrat', Courier, monospace;">
                    <div>
                        <div class="content_ve" style="display: flex;">
                            <div>${ga_kh}</div>
                            <div><i class='bx bxs-right-arrow-alt'></i></div>
                            <div>${ga_den}</div>
                        </div>
                        <div class="content_ve">${namekh}</div>
                        <div class="content_ve" style="display: flex;">
                            <div>CMT:</div>
                            <div>${cmt}</div>
                        </div>
                    </div>
                    <div>
                        <table style="border: 1px solid white;">
                            <tbody style="border: 1px solid white;">
                                <tr>
                                    <th style="text-align: start; width: 160px;">Ngày khởi hành</th>
                                    <th style="width: 160px;">${ngay_kh}</th>
                                </tr>
                                <tr>
                                    <th style="text-align: start; width: 160px;">Thời gian khởi hành</th>
                                    <th style="width: 160px;">${time_kh}</th>
                                </tr>
                                <tr>
                                    <th style="text-align: start; width: 160px;">Loại vé</th>
                                    <th style="width: 160px;">${loai_ve}</th>
                                </tr>
                                <tr>
                                    <th style="text-align: start; width: 160px;">Số ghế</th>
                                    <th style="width: 160px;">${soghe}</th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div style="display: flex; justify-content: end;">
                    <div style="color: red; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">Giá vé:</div>
                    <div style="color: red; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; padding-left: 5px;">${giave}vnđ</div>
                </div>
            `;
            courseInner.innerHTML =coursesRenderUI;
            const btn_thanhToan = document.getElementById("ThanhToan");
            const noidung = document.getElementById("pain_content");
            const closeModal = document.getElementById("close_modal");
            const modal = document.getElementById("modal_qr");
            const gia = document.getElementById("pain_price");
            const course_qr_img = document.querySelector(".course_qr_img");
    
            btn_thanhToan.addEventListener('click', ()=> {
                let QR = `https://img.vietqr.io/image/VCB-1019364188-compact2.png?amount=${giave}&addInfo=Quy%E1%BB%81n%20%C4%90%E1%BA%B9p%20Trai`;




                course_qr_img.src = QR;  
        
           
                modal.style.display = "flex";
            });
            closeModal.addEventListener('click', () => {
                modal.style.display = "none";
            });
          

        });
      
    </script>
</body>
</html>


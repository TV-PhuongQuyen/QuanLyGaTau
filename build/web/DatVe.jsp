    <%-- 
        Document   : DatVe
        Created on : Nov 16, 2024, 11:53:08 PM
        Author     : PC
    --%>
    <%@page import ="Model.Tau"%>
    <%@page import ="java.util.List"%>
    <%@page import ="Model.LichTrinh"%>
    <%@page import ="Model.SoGhe"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="datve.css">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/tesseract.js/dist/tesseract.min.js"></script>

        <style>
            body{
                width: 98%;
                min-height: 90vh;
                padding: 0 10px;
                display: flex;
                background-image: url('SuKien/image/Background.jpg'); /* Thêm ảnh nền */
                background-size: cover; /* Ảnh bao phủ toàn bộ màn hình */
                background-repeat: no-repeat; /* Không lặp lại ảnh */
                background-position: center; /* Canh giữa ảnh */
                justify-content: center;
                align-items: center;
            }
            .datve_dichvu {
            display: block;
            height: 100vh;
            width: 100vw;
            position: fixed;
            top: 50%; /* Căn giữa theo trục dọc */
            left: 50%; /* Căn giữa theo trục ngang */
            transform: translate(-50%, -50%); /* Dịch chuyển để căn giữa hoàn toàn */
            z-index: 999;
    }

    .datve_dichvu input{
        width: 97%;
        height: 30px;
        border-radius: 3px;
        border: 1px solid;
        outline: none;
        padding: 4px;
        padding-left: 10px;

        }
        .datve_dichvu div{
            margin-bottom: 6px;
            font-family: "Montserrat", sans-serif;
            font-weight: 500;
        }
        .datve_dichvu button{
            font-family: "Montserrat", sans-serif;
            border: none;
            background-color: rgb(39, 184, 184);
            border-radius: 5%;
            color: white;
            font-weight:600;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 140px;
            height: 35px;

        }
        .datve_dichvu button:hover{
            background-color: rgb(100, 99, 99);
            transition: 0.3s ease-in-out;
            color: rgb(4, 247, 226);
        }
        .datve_dichvu button:nth-child(1) {
            background-color: rgb(255, 0, 0);

        }
        .datve_dichvu button:nth-child(1):hover{
            background-color: rgb(100, 99, 99);
            transition: 0.3s ease-in-out;
            color: rgb(4, 247, 226);
        }
        .seat-icon {
            cursor: pointer;
            transition: transform 0.2s;
        }

       .seat-icon:hover {
            transform: scale(1.2); /* Tăng kích thước icon khi hover */
            color: #00aaff; /* Thay đổi màu sắc khi hover */
        }

            /* Khung vuông xám khi ghế được chọn */
        .selected-seat {
           border: 2px solid gray;
           border-radius: 8px;
           padding: 5px;
        }
        .error{
            color: red;
            font-family: "Montserrat", sans-serif;
            font-size: 15px;
            font-style: italic;

        }
        #camera-popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }
        #overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 300px;
            height: 150px;
            border: 2px solid red;
            transform: translate(-50%, -50%);
            z-index: 10;
            pointer-events: none;
        }

        </style>
    </head>
    <body >
        <div class="datve_dichvu">
            <div style="display: flex; justify-content: center ; align-items:center;   height: 100vh;">
                <div style="background-color: white; width: 800px; height: 450px;padding: 30px;">

                    <div style="display: flex; justify-content: space-around;">
                        <div style=" width: 400px; padding: 20px;">
                            <div style="text-align: center; font-family: 'Montserrat', Courier, monospace; font-weight: bold; font-size: 20px; display: flex; align-items: center; justify-content: center;">
                                Đặt vé
                                 <i style="margin-left: 5px; cursor: pointer;" id="camera-icon" class='bx bxs-camera'></i>
                            </div>
                         <div id="camera-popup" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); align-items: center; justify-content: center;">
                            <div style="background: white; padding: 20px; border-radius: 8px; position: relative; display: flex; flex-direction: column; align-items: center;">
                                <!-- Video stream -->
                                <video id="video" autoplay style="width: 100%; max-width: 500px; height: auto; position: relative;"></video>

                                <!-- Overlay hình chữ nhật -->
                                <div id="overlay" style="
                                    position: absolute;
                                    top: 50%;
                                    left: 50%;
                                    width: 300px;
                                    height: 150px;
                                    border: 2px solid red;
                                    transform: translate(-50%, -50%);
                                "></div>

                                <button id="close-camera" style="margin-top: 10px; background: red; color: white; border: none; padding: 10px 20px; border-radius: 5px;">Đóng</button>
                            </div>
                        </div>
                            <div>
                                <form action="DatVeServlet" method="get">
                                    <div>
                                        <div>
                                            Họ và tên
                                        </div>
                                        <div>
                                            <input type="text" name="name" required>

                                        </div>
                                    </div>
                                    <div style="display: flex; ">
                                        <div style="margin-right: 10px;">
                                            <div>Giới tính</div>
                                            <div>
                                                <select style="height: 38px; border: 1px solid; border-radius: 3px;width: 120px;text-align: center; padding: 4px;" id="options" name="options" required>
                                                    <option value="Nu">Nữ</option>
                                                    <option value="Nam">Nam</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div style="width: 100%;">
                                            <div>
                                                Số điện thoại
                                            </div>
                                            <div>
                                                <input type="text" name="sdt" required>
                                                <div class="error" id="erro_sdt"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            Căn cước công dân
                                        </div>
                                        <div>
                                            <input type="text" name="cccd" required>
                                            <div class="error" id="erro_cccd"></div>
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            Email
                                        </div>
                                        <div>
                                            <input type="text" name="email">
                                            <div class="error" id="erro_email"></div>
                                            <input type="hidden" name="soghe">
                                            <input type="hidden" name="lichtrinh" value="<%= request.getAttribute("id_lichtrinh") %>">
                                        </div>
                                    </div>
                                    <div style="display: flex; justify-content: space-between; margin-top: 40px;">
                                        <button id="btn_huy">Hủy</button>
                                        <button>Đặt vé</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div style=" width: 350px; padding: 20px;">
                           <div style="text-align: center; font-family: 'Montserrat', Courier, monospace; font-weight: bold; font-size: 20px;">Số ghế chọn</div>
                            <div style="border: 2px solid; height: 100%; padding: 5px 0px; max-height: 350px; overflow-y: auto;">
                              <div style="text-align: center;">
                                        <i class='bx bx-bus-school'></i>
                                        <p style="font-family: 'Montserrat', Courier, monospace; font-weight: bold; "><%= request.getAttribute("id_tau") %></p>
                                    </div>
                                    <div style="display: flex; flex-wrap: wrap; justify-content: center;">
                                          <%
                                                List<SoGhe> sg = (List<SoGhe>) request.getAttribute("getSoGheDuyet");
                                                if (sg != null) {
                                                    for (SoGhe i : sg) {

                                            %>
                                        <div style="text-align: center;">
                                            <i class='bx bxs-calendar-alt seat-icon' data-id_soghe="<%= i.getId_soghe() %>" style="font-size:50px; color: green; padding: 0 20px;"></i>
                                            <p><%= i.getId_soghe() %></p>
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
            </div>
        </div>
           <script>
            const seatIcons = document.querySelectorAll('.seat-icon');
            const inputSoGhe = document.querySelector('input[name="soghe"]');
            const btnHuy = document.getElementById("btn_huy");
            const inputIdTau = document.querySelector('input[name="id_tau"]'); 

            seatIcons.forEach(icon => {
                icon.addEventListener('click', function () {
                    // Lấy giá trị id_soghe từ thuộc tính data-id_soghe
                    const idSoGhe = this.getAttribute('data-id_soghe');

                    // Gán giá trị vào input
                    inputSoGhe.value = idSoGhe;

                    // Xóa lớp 'selected-seat' của tất cả các icon khác
                    seatIcons.forEach(ic => ic.classList.remove('selected-seat'));

                    // Thêm lớp 'selected-seat' cho icon đã chọn
                    this.classList.add('selected-seat');
                });
            });

            btnHuy.addEventListener('click', function(event) {
                event.preventDefault();  // Ngừng form submit

                // Chuyển hướng đến servlet khác (ví dụ: "HuyDatVeServlet")
                window.location.href = "http://localhost:8080/qlGaTau/DichVuKhachHangServlet";  // Đổi "HuyDatVeServlet" thành URL servlet của bạn
            });
            document.addEventListener("DOMContentLoaded", function() {
                const inputSdt = document.querySelector('input[name="sdt"]');
                const inputCccd = document.querySelector('input[name="cccd"]');
                const inputEmail = document.querySelector('input[name="email"]');

                const errorSdt = document.getElementById('erro_sdt');
                const errorCccd = document.getElementById('erro_cccd');
                const errorEmail = document.getElementById('erro_email');

                // Kiểm tra số điện thoại (chỉ cho phép số và độ dài nhất định)
                inputSdt.addEventListener('input', function() {
                    if (!/^\d+$/.test(this.value)) {
                        errorSdt.textContent = "Số điện thoại chỉ được chứa chữ số.";
                    } else if (this.value.length < 10 || this.value.length > 11) {
                        errorSdt.textContent = "Số điện thoại phải có từ 10 đến 11 chữ số.";
                    } else {
                        errorSdt.textContent = "";  // Xóa lỗi nếu hợp lệ
                    }
                });

                // Kiểm tra CCCD (chỉ cho phép số và phải có đúng 12 số)
                inputCccd.addEventListener('input', function() {
                    if (!/^\d+$/.test(this.value)) {
                        errorCccd.textContent = "CCCD chỉ được chứa chữ số.";
                    } else if (this.value.length !== 12) {
                        errorCccd.textContent = "CCCD phải có đúng 12 chữ số.";
                    } else {
                        errorCccd.textContent = "";  // Xóa lỗi nếu hợp lệ
                    }
                });

                // Kiểm tra email (theo định dạng chuẩn)
                inputEmail.addEventListener('input', function() {
                    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    if (this.value && !emailPattern.test(this.value)) {
                        errorEmail.textContent = "Email không đúng định dạng.";
                    } else {
                        errorEmail.textContent = "";  // Xóa lỗi nếu hợp lệ
                    }
                });
            });
               document.getElementById('camera-icon').addEventListener('click', () => {
        const cameraPopup = document.getElementById('camera-popup');
        const video = document.getElementById('video');
        cameraPopup.style.display = 'flex';

        // Mở camera
        navigator.mediaDevices.getUserMedia({ video: true })
            .then((stream) => {
                video.srcObject = stream;
            })
            .catch((err) => {
                alert('Không thể truy cập camera: ' + err.message);
            });

        // Bắt đầu quét tự động sau 3 giây
        setTimeout(() => {
            startScanning();
        }, 3000);
    });

    document.getElementById('close-camera').addEventListener('click', () => {
        const cameraPopup = document.getElementById('camera-popup');
        const video = document.getElementById('video');
        const stream = video.srcObject;
        const tracks = stream.getTracks();

        // Dừng camera
        tracks.forEach((track) => track.stop());
        video.srcObject = null;
        cameraPopup.style.display = 'none';
    });

    function startScanning() {
        const video = document.getElementById('video');
        const canvas = document.createElement('canvas');
        const context = canvas.getContext('2d');
        const overlay = document.getElementById('overlay');

        // Lấy kích thước khung overlay
        const rect = overlay.getBoundingClientRect();
        const videoRect = video.getBoundingClientRect();

        // Chuyển vị trí overlay sang tọa độ video
        const offsetX = rect.x - videoRect.x;
        const offsetY = rect.y - videoRect.y;
        const width = rect.width;
        const height = rect.height;

        // Định kỳ chụp ảnh và nhận diện
        const interval = setInterval(() => {
            // Cắt hình ảnh trong khu vực overlay
            canvas.width = width;
            canvas.height = height;
            context.drawImage(video, offsetX, offsetY, width, height, 0, 0, width, height);

            // Gửi ảnh tới OCR
            const imageData = canvas.toDataURL('image/png');
            recognizeText(imageData, () => clearInterval(interval)); // Dừng quét nếu nhận diện thành công
        }, 1000);
    }

    function recognizeText(imageData, onSuccess) {
        const inputCccd = document.querySelector('input[name="cccd"]'); // Input cho CCCD
        const inputName = document.querySelector('input[name="name"]'); // Input cho Họ và tên

        Tesseract.recognize(
            imageData,
            'vie', // Nhận diện tiếng Việt
            { logger: (info) => console.log(info) }
        ).then(({ data: { text } }) => {
            console.log('Kết quả nhận diện:', text);

            // Chia văn bản thành các dòng
            const lines = text.split('\n');

            // Tìm CCCD (12 chữ số)
            const cccdMatch = text.match(/\b\d{12}\b/);
            if (cccdMatch) {
                const cccd = cccdMatch[0];
                inputCccd.value = cccd;
                alert("Đã nhận diện thành công CCCD: " + cccd);
            } else {
                alert("Không tìm thấy CCCD hợp lệ trong ảnh.");
            }

            // Tìm dòng chứa "Họ và tên"
            const nameIndex = lines.findIndex((line) => line.includes('Họ và tên'));
            if (nameIndex !== -1 && lines[nameIndex + 1]) {
                // Lấy dòng tiếp theo
                const fullName = lines[nameIndex + 1].trim();
                inputName.value = fullName;
                alert("Đã nhận diện thành công Họ và tên: " + fullName);
            } else {
                alert("Không tìm thấy thông tin Họ và tên.");
            }

            // Gọi callback nếu có
            if (onSuccess) onSuccess();
        }).catch((err) => {
            console.error('Lỗi nhận diện:', err);
            alert("Lỗi nhận diện văn bản từ ảnh: " + err.message);
        });
    }
</script>
    </body>
    </html>

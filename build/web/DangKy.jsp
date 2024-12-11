<%-- 
    Document   : DangKy
    Created on : Nov 14, 2024, 12:21:20 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Đăng Ký | Quản Lý Ga Tàu</title>
  <link rel="stylesheet" href="SuKien/CSS/styles.css" />
  <link rel="icon" href="SuKien/image/Brown and Yellow Vintage Train Travel Logo.png" type="image/x-icon">
</head>
<body style="background-image: url(SuKien/image/Background.jpg);background-size: cover; background-repeat: no-repeat; background-position: center;">
  <div class="login_form">
      <form id="registerForm" action="UserSerlet" method="post">
      <h3>Quản Lý Ga Tàu</h3>

      <!-- Email input box -->
      <div class="input_box">
        <label for="email">Email</label>
        <input type="email" id="email" name="email_dk" placeholder="Enter email address" required />
        <span id="emailError" style="color: red; font-size: 12px; font-weight: 600;"></span>
      </div>

      <!-- Password input box -->
      <div class="input_box">
        <label for="password">Password</label>
        <input type="password" id="password" name="password_dk" placeholder="Enter your password" required />
        <span id="passwordError" style="color: red; font-size: 12px;font-weight: 600;"></span>
      </div>

      <!-- Confirm Password input box -->
      <div class="input_box">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" placeholder="Enter your password again" required />
        <span id="confirmPasswordError" style="color: red; font-size: 12px;font-weight: 600;"></span>
      </div>

      <!-- Submit button -->
      <button type="submit">Đăng Ký</button>

      <p class="sign_up">Đã có tài khoản? <a href="main">Đăng nhập</a> tại đây!</p>
    </form>
    <p class="separator">
      <span>Chào mừng đến với quản lý ga tàu</span>
    </p>
  </div>

  <script>
    // Real-time validation
    document.getElementById("email").addEventListener("input", validateEmail);
    document.getElementById("password").addEventListener("input", validatePassword);
    document.getElementById("confirmPassword").addEventListener("input", validateConfirmPassword);

    function validateEmail() {
      const email = document.getElementById("email").value;
      const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
      const emailError = document.getElementById("emailError");

      if (!emailPattern.test(email)) {
        emailError.innerText = "Email không hợp lệ";
      } else {
        emailError.innerText = "";
      }
    }

    function validatePassword() {
      const password = document.getElementById("password").value;
      const passwordPattern = /^[A-Z][a-zA-Z0-9]{4,}$/;
      const passwordError = document.getElementById("passwordError");

      if (!passwordPattern.test(password)) {
        passwordError.innerText = "Mật khẩu phải có ít nhất 5 ký tự, bắt đầu bằng chữ hoa";
      } else {
        passwordError.innerText = "";
      }
    }

    function validateConfirmPassword() {
      const password = document.getElementById("password").value;
      const confirmPassword = document.getElementById("confirmPassword").value;
      const confirmPasswordError = document.getElementById("confirmPasswordError");

      if (password !== confirmPassword) {
        confirmPasswordError.innerText = "Mật khẩu xác nhận không khớp";
      } else {
        confirmPasswordError.innerText = "";
      }
    }

    // Final form submission validation
    document.getElementById("registerForm").addEventListener("submit", function (event) {
      // Check each field one last time before submission
      validateEmail();
      validatePassword();
      validateConfirmPassword();

      // Prevent form submission if there are errors
      if (
        document.getElementById("emailError").innerText ||
        document.getElementById("passwordError").innerText ||
        document.getElementById("confirmPasswordError").innerText
      ) {
        event.preventDefault();
      } else {
        alert("Đăng ký thành công!");
      }
    });
  </script>
</body>
</html>


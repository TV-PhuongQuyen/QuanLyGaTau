<%-- 
    Document   : DangNhap
    Created on : Nov 14, 2024, 12:21:09 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Source Codes By CodingNepal - www.codingnepalweb.com -->
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login Form in HTML and CSS | CodingNepal</title>
  <link rel="stylesheet" href="SuKien/CSS/styles.css" />
  <link rel="icon" href="SuKien/image/Brown and Yellow Vintage Train Travel Logo.png" type="image/x-icon">
</head>
<body style="background-image: url(SuKien/image/Background.jpg);background-size: cover; background-repeat: no-repeat; background-position: center;">
  <div class="login_form">
    <!-- Login form container -->
    <form action="UserSerlet" method="get">
      <h3>Quản Lý Ga Tàu</h3>
      <!-- Login option separator -->


      <!-- Email input box -->
      <div class="input_box">
        <label for="email">Email</label>
        <input type="email" name="email" id="email" placeholder="Enter email address" required />
      </div>

      <!-- Paswwrod input box -->
      <div class="input_box">
        <div class="password_title">
          <label for="password">Password</label>
        </div>

          <input type="password" name="password" id="password" placeholder="Enter your password" required />
      </div>

       <!-- Login button -->
      <button type="submit">Đăng Nhập</button>

      <p class="sign_up">Chưa có tài khoản <a href="DangKy.jsp">Đăng ký</a> tại đây !</p>
    </form>
    <p class="separator">
      <span>Chào mừng đến với quản lý ga tàu </span>
    </p>
  </div>
</body>
</html>

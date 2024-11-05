<%-- 
    Document   : GDThongTinChiTietMonAn621
    Created on : Nov 5, 2024, 9:46:07 PM
    Author     : ADMIN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Chi Tiết Món Ăn</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #006400;
            font-size: 3em;
            margin-top: 30px;
        }

        .details {
            max-width: 800px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .details:hover {
            transform: scale(1.02);
        }

        p {
            font-size: 1.3em;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .back-button {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .back-button input[type="submit"] {
            padding: 10px 30px;
            border-radius: 5px;
            border: none;
            background-color: #006400;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .back-button input[type="submit"]:hover {
            background-color: #008000;
            transform: scale(1.05);
        }

        .details h2 {
            text-align: center;
            font-size: 2em;
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<h1>Thông Tin Chi Tiết Món Ăn</h1>

<div class="details">
    <%
        String tenMonAn = request.getParameter("ten");
        String giaMonAn = request.getParameter("gia");
        String moTaMonAn = request.getParameter("mota");
    %>
    <h2><%= tenMonAn %></h2>
    <p><strong>Giá:</strong> <%= giaMonAn %> VNĐ</p>
    <p><strong>Mô Tả:</strong> <%= moTaMonAn %></p>

    <!-- Nút trở về -->
    <div class="back-button">
        <form action="GDTimThongTinMonAn621.jsp">
            <input type="submit" value="Trở về"/>
        </form>
    </div>
</div>
</body>
</html>

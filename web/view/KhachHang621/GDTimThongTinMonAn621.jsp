<%-- 
    Document   : GDTimThongTinMonAn621
    Created on : Nov 5, 2024, 9:30:31 PM
    Author     : ADMIN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.DAO621" %>
<%@ page import="model.MonAn621" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tìm Thông Tin Món Ăn của nhà hàng</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f7fc;
      margin: 0;
      padding: 0;
      color: #333;
    }

    h1 {
      text-align: center;
      color: #006400;
      font-size: 3em;
      margin-top: 30px;
    }

    .header {
      text-align: center;
      margin-bottom: 30px;
    }

    .header a {
      margin: 0 20px;
      text-decoration: none;
      color: #006400;
      font-size: 1.2em;
      padding: 10px 15px;
      border-radius: 5px;
      transition: background-color 0.3s, color 0.3s;
    }
    .header a:hover {
      background-color: #008000;
      color: white;
    }
    form {
      text-align: center;
      margin-bottom: 40px;
    }

    input[type="text"] {
      padding: 15px;
      width: 300px;
      border-radius: 10px;
      border: 1px solid #ccc;
      font-size: 1.2em;
      transition: border-color 0.3s;
    }

    input[type="text"]:focus {
      border-color: #008000;
      outline: none;
    }

    input[type="submit"] {
      padding: 15px 30px;
      border-radius: 10px;
      border: none;
      background-color: #006400;
      color: white;
      font-size: 1.2em;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.2s;
    }

    input[type="submit"]:hover {
      background-color: #008000;
      transform: translateY(-2px);
    }

    table {
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      margin-top: 20px;
    }

    th, td {
      padding: 20px;
      text-align: left;
      border: 1px solid #ccc;
      font-size: 1.1em;
    }

    th {
      background-color: #006400;
      color: white;
      font-size: 1.2em;
    }

    td a {
      color: #008000;
      text-decoration: none;
      transition: color 0.3s;
    }
    td a:hover {
      color: #006400;
    }
    p {
      text-align: center;
      font-size: 1.3em;
      margin-top: 30px;
    }
  </style>
</head>
<body>
<div class="header">
  <h1>Tìm kiếm món ăn của nhà hàng</h1>
  
</div>

<form method="post" action="GDTimThongTinMonAn621.jsp">
  <input type="text" name="tukhoa" required/><br><br>
  <input type="submit" name="btnTimKiem" value="Xác nhận"/>
</form>

<%
  String tukhoa = request.getParameter("tukhoa");
  if (tukhoa != null && !tukhoa.isEmpty()) {
    DAO621 dao = new DAO621();
    List<MonAn621> danhSachMonAn = dao.getDanhSachMonAnTheoTuKhoa(tukhoa);

    if (danhSachMonAn != null && !danhSachMonAn.isEmpty()) {
%>
<table>
  <tr>
    <th>ID</th>
    <th>Tên Món Ăn</th>
    <th>Giá</th>
  </tr>
  <%for (MonAn621 monAn : danhSachMonAn) {%>
  <tr>
    <td><%= monAn.getId() %></td>
    <td><a href="GDThongTinChiTietMonAn621.jsp?id=<%= monAn.getId() %>&ten=<%= monAn.getTenMonAn() %>&gia=<%= monAn.getGiaMonAn() %>&mota=<%= monAn.getMoTa() %>">
      <%= monAn.getTenMonAn() %></a></td>
    <td><%= monAn.getGiaMonAn() %> VNĐ</td>
  </tr>
  <%
    }
  %>
</table>
<%
    } else {
      out.println("<p>Nhà hàng hiện không có món ăn này, quý khách vui lòng tìm kiếm một món ăn khác!</p>");
    }
  } else {
    out.println("<p>Vui lòng nhập từ khóa món ăn quý khách cần tìm kiếm.</p>");
  }
%>
</body>
</html>
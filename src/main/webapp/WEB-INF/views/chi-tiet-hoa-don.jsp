<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Hóa Đơn</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
            background-image: url('https://theme.hstatic.net/200000182297/1000887316/14/hb_image2_master.jpg?v=1533');
        }

        table {
            opacity: 0.8;
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2 class="text-center text-primary m-4">Chi Tiết Hóa Đơn</h2>

<div class="container">
    <table class="table table-striped table-hover table-success">
        <tr>
            <th>ID Hóa Đơn</th>
            <td>${hoaDon.id}</td>
        </tr>
        <tr>
            <th>Tên Nhân Viên</th>
            <td>${hoaDon.nhanVien.ten}</td>
        </tr>
        <tr>
            <th>Tên Khách Hàng</th>
            <td>${hoaDon.khachHang.ten}</td>
        </tr>
        <tr>
            <th>Ngày Mua Hàng</th>
            <td>${hoaDon.ngayMuaHang}</td>
        </tr>
        <tr>
            <th>Trạng Thái</th>
            <td>
                <c:choose>
                    <c:when test="${hoaDon.trangThai == 1}">
                        Đã thanh toán
                    </c:when>
                    <c:otherwise>
                        Chưa thanh toán
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </table>

    <h3 class="mt-4"> Chi Tiết Sản Phẩm</h3>
    <table class="table table-striped table-hover table-success">
        <thead>
        <tr>
            <th>Mã Sản Phẩm</th>
            <th>Tên Màu Sắc</th>
            <th>Kích Thước</th>
            <th>Số Lượng</th>
            <th>Đơn Giá</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hdct" items="${hoaDon.hoaDonChiTietList}">
            <tr>
                <td>${hdct.sanPhamCT.maSPCT}</td>
                <td>${hdct.sanPhamCT.mauSac.ten}</td>
                <td>${hdct.sanPhamCT.kichThuoc.ten}</td>
                <td>${hdct.soLuong}</td>
                <td>${hdct.donGia} VND</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


</div>
<div class="mt-4 d-flex rounded justify-content-center align-items-center">
    <a href="/nem/hoa-don" class="btn btn-primary">Quay lại danh sách</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

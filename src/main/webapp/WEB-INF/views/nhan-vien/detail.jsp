<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thông Tin Nhân Viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        padding: 20px;
        background-image: url('https://theme.hstatic.net/200000182297/1000887316/14/hb_image2_master.jpg?v=1533');

    }
</style>

<body class="bg-primary-subtle">
<div class="text-center">
    <h1>Thông Tin Nhân Viên</h1>
</div>
<div class="container mt-5   d-flex rounded justify-content-center align-items-center">

    <div class="row border-primary border border-3 rounded" style="width: 500px; height: auto; padding: 15px;">
        <div class="col-md-4">
            <strong>ID:</strong>
        </div>
        <div class="col-md-8">
            ${nhanVien.id}
        </div>

        <div class="col-md-4">
            <strong>Mã Nhân Viên:</strong>
        </div>
        <div class="col-md-8">
            ${nhanVien.maNV}
        </div>

        <div class="col-md-4">
            <strong>Tên Nhân Viên:</strong>
        </div>
        <div class="col-md-8">
            ${nhanVien.ten}
        </div>

        <div class="col-md-4">
            <strong>Tên Đăng Nhập:</strong>
        </div>
        <div class="col-md-8">
            ${nhanVien.tenDangNhap}
        </div>

        <div class="col-md-4">
            <strong>Trạng Thái:</strong>
        </div>
        <div class="col-md-8">
            ${nhanVien.trangThai ==1 ? "Đang làm việc" : "Dừng làm việc"}
        </div>
    </div>

</div>
<div class="mt-4 d-flex rounded justify-content-center align-items-center">
    <a href="/nem/hien-thi-nhan-vien" class="btn btn-primary">Quay lại danh sách</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

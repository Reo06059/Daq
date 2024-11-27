<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Thêm Sản Phẩm Chi Tiết</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
            background-image: url('https://images.pexels.com/photos/28744968/pexels-photo-28744968/free-photo-of-ng-i-ph-n-tr-sanh-di-u-trong-b-i-c-nh-do-th-v-i-khoi.jpeg?auto=compress&cs=tinysrgb&w=600');
        }

        form {
            max-width: 450px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            background-color: rgba(255, 255, 255, 0.5); /* Làm cho form trong suốt nhẹ */
        }

        form p {
            display: flex;
            flex-direction: row;
            align-items: center;
            margin-bottom: 10px;
        }

        form label {
            flex: 1;
            margin-right: 10px;
        }

        form input[type=text], form input[type=number], form input[type=decimal] {
            flex: 2;
            padding: 10px;
            margin-top: 4px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #cccccc;
            border-radius: 4px;
            font-size: 14px;
        }

        form button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        form button:hover {
            background-color: #45a049;
        }

        .error {
            color: crimson;
        }
    </style>
</head>
<body>
<div class="d-flex justify-content-center"><h2>Thêm Sản Phẩm Chi Tiết</h2></div>
<form:form action="/nem/add-san-pham-ct" method="post" modelAttribute="sanPhamCT">
    <div class="mb-3">
        <label for="productId" class="form-label">Mã sản phẩm chi tiết</label>
        <form:input path="maSPCT" class="form-control" id="productId"/>
        <form:errors path="maSPCT" class="error"/>
    </div>
    <div class="mb-3">
        <label for="productMaSPCT" class="form-label">Chọn Sản Phẩm :</label>
        <form:select id="productMaSPCT" path="sanPham.id">
            <form:options items="${listSanPham}" itemLabel="ten" itemValue="id"/>
        </form:select>
    </div>

    <div class="mb-3">
        <label for="productIdKichThuoc" class="form-label">Kích Thước:</label>
        <form:select path="kichThuoc.id">
            <form:options items="${listKichThuoc}" itemLabel="ten" itemValue="id"/>
        </form:select>
    </div>

    <div class="mb-3">
        <label for="productIdKichThuoc" class="form-label">Màu sắc:</label>
        <form:select path="mauSac.id">
            <form:options items="${listMauSac}" itemValue="id" itemLabel="ten"/>
        </form:select>
    </div>

    <div class="mb-3">
        <label for="productSoLuong" class="form-label">Số Lượng:</label>
        <form:input type="text" path="soLuong" class="form-control" id="productSoLuong"/>
        <form:errors path="soLuong" class="error"/>
    </div>

    <div class="mb-3">
        <label for="productDonGia" class="form-label">Đơn Giá:</label>
        <form:input type="decimal" path="donGia" class="form-control" id="productDonGia"/>
        <form:errors path="donGia" class="error"/>
    </div>

    <div class="mb-3">
        <label class="form-label">Trạng Thái</label>
        <div class="form-check">
            <form:radiobutton path="trangThai" value="1" id="trangThaiTrue" checked="checked" class="form-check-input"/>
            <label class="form-check-label" for="trangThaiTrue">Còn hàng</label>
        </div>
        <div class="form-check">
            <form:radiobutton path="trangThai" value="0" id="trangThaiFalse" class="form-check-input"/>
            <label class="form-check-label" for="trangThaiFalse">Hết hàng</label>
        </div>
    </div>

    <form:button onclick="return confirm('Bạn chắc chắn thêm sản phẩm chi tiết?')" type="submit"
                 class="btn btn-primary">Thêm</form:button>
</form:form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

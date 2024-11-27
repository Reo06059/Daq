<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Thêm Khách Hàng</title>
    <style>
        body {

            font-family: Arial, sans-serif;
            background-image: url('https://images.pexels.com/photos/28744968/pexels-photo-28744968/free-photo-of-ng-i-ph-n-tr-sanh-di-u-trong-b-i-c-nh-do-th-v-i-khoi.jpeg?auto=compress&cs=tinysrgb&w=600');
            background-size: cover;
            background-position: center;
            padding: 20px;
        }

        form {
            max-width: 450px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.7); /* Làm cho form trong suốt nhẹ */
            padding: 20px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }

        form label {
            flex: 1;
            margin-right: 10px;
        }

        form input[type=text] {
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
<div class="d-flex justify-content-center "><h2 class="rounded-pill text-bg-info">Thêm Khách Hàng</h2></div>
<div class="container">

    <form:form action="/nem/add-khach-hang" method="post" modelAttribute="khachHang">
        <%--    <div class="mb-3">--%>
        <%--        <label for="maKH" class="form-label">Mã Khách Hàng:</label>--%>
        <%--        <form:input path="maKH" class="form-control" id="maKH" />--%>
        <%--        <form:errors path="maKH" class="error" />--%>
        <%--    </div>--%>
        <div class="mb-3">
            <label for="ten" class="form-label">Tên:</label>
            <form:input path="ten" class="form-control" id="ten"/>
            <form:errors path="ten" class="error"/>
        </div>
        <div class="mb-3">
            <label for="sdt" class="form-label">SĐT:</label>
            <form:input path="sdt" class="form-control" id="sdt"/>
            <form:errors path="sdt" class="error"/>
        </div>
        <div class="mb-3">
            <label for="sdt" class="form-label">Mã Kh:</label>
            <form:input path="maKH" class="form-control" id="sdt"/>
            <form:errors path="sdt" class="error"/>
        </div>
        <div class="d-flex">
            <label class="form-label">Trạng thái</label>
            <div class="mb-3 ms-3 form-check">
                <form:radiobutton path="trangThai" value="1" id="trangThaiTrue" checked="checked"
                                  class="form-check-input"/>
                <label class="form-check-label" for="trangThaiTrue">Đã mua hàng</label>
            </div>
            <div class="mb-3 form-check">
                <form:radiobutton path="trangThai" value="0" id="trangThaiFalse" class="form-check-input"/>
                <label class="form-check-label" for="trangThaiFalse">Chưa mua hàng</label>
            </div>
        </div>
        <form:button onclick="return confirm('Bạn chắc chắn thêm?')" type="submit"
                     class="btn btn-primary">Thêm</form:button>
    </form:form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Thêm Nhân Viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
            background-image: url('https://images.pexels.com/photos/28744968/pexels-photo-28744968/free-photo-of-ng-i-ph-n-tr-sanh-di-u-trong-b-i-c-nh-do-th-v-i-khoi.jpeg?auto=compress&cs=tinysrgb&w=600');

        }

        form {
            max-width: 450px;
            background-color: rgba(255, 255, 255, 0.5); /* Làm cho form trong suốt nhẹ */
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
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

        form input[type=checkbox] {
            margin-top: 8px;
            margin-bottom: 10px;
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
<div class="d-flex justify-content-center"><h2>Thêm Nhân Viên</h2></div>
<form:form action="/nem/add-nhan-vien" method="post" modelAttribute="nhanVien">
    <%--    <div class="mb-3">--%>
    <%--        <label for="employeeId" class="form-label">ID</label>--%>
    <%--        <form:input path="id" class="form-control" id="employeeId" />--%>
    <%--        <form:errors path="id" class="error" />--%>
    <%--    </div>--%>

    <div class="mb-3">
        <label for="employeeMaNV" class="form-label">Mã Nhân Viên:</label>
        <form:input path="maNV" class="form-control" id="employeeMaNV"/>
        <form:errors path="maNV" class="error"/>
    </div>

    <div class="mb-3">
        <label for="employeeName" class="form-label">Tên Nhân Viên:</label>
        <form:input path="ten" class="form-control" id="employeeName"/>
        <form:errors path="ten" class="error"/>
    </div>

    <div class="mb-3">
        <label for="employeeUsername" class="form-label">Tên Đăng Nhập:</label>
        <form:input path="tenDangNhap" class="form-control" id="employeeUsername"/>
        <form:errors path="tenDangNhap" class="error"/>
    </div>

    <div class="mb-3">
        <label for="employeePassword" class="form-label">Mật Khẩu:</label>
        <form:input type="password" path="matKhau" class="form-control" id="employeePassword"/>
        <form:errors path="matKhau" class="error"/>
    </div>

    <div class="mb-3">
        <label class="form-label">Trạng thái</label>
        <div class="form-check">
            <form:radiobutton path="trangThai" checked="checked" value="1" id="trangThaiTrue" class="form-check-input"/>
            <label class="form-check-label" for="trangThaiTrue">Đang làm việc</label>
        </div>
        <div class="form-check">
            <form:radiobutton path="trangThai" value="0" id="trangThaiFalse" class="form-check-input"/>
            <label class="form-check-label" for="trangThaiFalse">Ngừng làm việc</label>
        </div>
    </div>

    <form:button onclick="return confirm('Bạn chắc chắn thêm?')" type="submit"
                 class="btn btn-primary">Thêm</form:button>
</form:form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

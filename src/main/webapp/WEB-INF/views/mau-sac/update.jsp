<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Sửa Màu Sắc</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
            background-image: url('https://theme.hstatic.net/200000182297/1000887316/14/banner_section_coll_3.png?v=1533');

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
            background-color: rgba(255, 255, 255, 0.7); /* Làm cho form trong suốt nhẹ */

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
<div class="d-flex justify-content-center"><h2>Sửa Màu Sắc</h2></div>

<form:form action="/nem/update-mau-sac" method="post" modelAttribute="mauSac">
    <div class="mb-3">
        <label for="colorId" class="form-label">ID</label>
        <form:input path="id" class="form-control" id="colorId" readonly="true"/>
        <form:errors path="id" class="error"/>
    </div>

    <div class="mb-3">
        <label for="colorCode" class="form-label">Mã Màu:</label>
        <form:input path="ma" class="form-control" id="colorCode"/>
        <form:errors path="ma" class="error"/>
    </div>

    <div class="mb-3">
        <label for="colorName" class="form-label">Tên Màu:</label>
        <form:input path="ten" class="form-control" id="colorName"/>
        <form:errors path="ten" class="error"/>
    </div>

    <div class="d-flex">
        <label class="form-label">Trạng thái</label>
        <div class="mb-3 ms-3 form-check">
            <form:radiobutton path="trangThai" value="1" id="trangThaiTrue" class="form-check-input"/>
            <label class="form-check-label" for="trangThaiTrue">Có</label>
        </div>
        <div class="mb-3 form-check">
            <form:radiobutton path="trangThai" value="0" id="trangThaiFalse" class="form-check-input"/>
            <label class="form-check-label" for="trangThaiFalse">Không</label>
        </div>
        <form:errors path="trangThai" class="error"/>
    </div>

    <form:button type="submit" class="btn btn-primary">Sửa</form:button>
</form:form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

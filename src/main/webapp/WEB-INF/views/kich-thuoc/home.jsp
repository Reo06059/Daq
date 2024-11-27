<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Danh sách Kích Thước</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        padding: 20px;
        background-image: url('https://theme.hstatic.net/200000182297/1000887316/14/banner_section_coll_3.png?v=1533');

    }
</style>
<body class="bg-primary-subtle">
<div class="container mt-5">
    <div class="d-flex justify-content-center m-4"><h1>Danh sách Kích Thước</h1></div>

    <%--    <div class="my-3 d-flex">--%>
    <%--        <form action="/nem/search-kich-thuoc" method="get">--%>
    <%--            Mã Kích Thước: <input type="text" name="id" class="form-control d-inline w-25" placeholder="Nhập id kích thước">--%>
    <%--            <button class="btn btn-info">Tìm kiếm</button>--%>
    <%--        </form>--%>
    <%--        <div class="d-flex rounded justify-content-center align-items-center">--%>
    <%--            <a href="/nem/home" class="btn btn-primary" >Quay lại trang chủ</a>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <div class="my-3 d-flex">
        <form action="/nem/search-hoa-don" method="get" onsubmit="return validateForm()">
            ID Nhân Viên:
            <input type="text" id="employeeId" name="id" class="form-control d-inline w-25" placeholder="">
            <button class="btn btn-info mt-2">Tìm kiếm</button>

        </form>
        <div class="d-flex rounded justify-content-center align-items-center">
            <a href="/nem/home" class="btn btn-primary">Quay lại trang chủ</a>
        </div>
    </div>
    <div class="alert alert-danger mt-3" role="alert" id="errorMessage" style="display: none;">
        Vui lòng nhập ID Nhân Viên trước khi tìm kiếm.
    </div>
    <script>
    function validateForm() {
        const employeeId = document.getElementById('employeeId').value;
        const errorMessage = document.getElementById('errorMessage');

        if (!employeeId) {
            errorMessage.style.display = 'block'; // Hiện thông báo lỗi
            return false; // Ngăn không cho form gửi đi
        }

        errorMessage.style.display = 'none'; // Ẩn thông báo nếu có nhập ID
        return true; // Cho phép form gửi đi
    }


    </script>
    <table class="table table-striped table-hover table-success">
        <tr>
            <th>Id</th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Trạng thái</th>
            <th>Action</th>
        </tr>
        <c:forEach var="kt" items="${kichThuocs}">
            <tr>
                <td>${kt.id}</td>
                <td>${kt.ma}</td>
                <td>${kt.ten}</td>
                <td>${kt.trangThai ==1 ? "Hoạt động" : "Ngừng hoạt động"}</td>
                <td>
                    <button onclick="return confirm('Bạn chắc chắn xóa?')" type="button" class="btn btn-danger">
                        <a style="text-decoration: none; color: white;"
                           href="/nem/delete-kich-thuoc?id=${kt.id}">Xóa</a>
                    </button>
                    <button type="button" class="btn btn-warning">
                        <a style="text-decoration: none; color: black;" href="/nem/update-kich-thuoc/${kt.id}">Cập
                            nhật</a>
                    </button>
                    <button type="button" class="btn btn-info">
                        <a style="text-decoration: none; color: white;" href="/nem/detail-kich-thuoc/${kt.id}">Chi
                            tiết</a>
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>

    <button class="btn btn-info">
        <a style="text-decoration: none; color: white;" href="/nem/add-kich-thuoc"> Thêm </a>
    </button>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

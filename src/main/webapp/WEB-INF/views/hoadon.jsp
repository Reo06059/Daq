<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Hóa Đơn</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
            background-image: url('https://theme.hstatic.net/200000182297/1000887316/14/banner_section_coll_3.png?v=1533');

        }

        table {
            background-color: rgba(255, 255, 255, 0.4);
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


<body>

<h2 class="text-center text-primary m-4">Danh Sách Hóa Đơn</h2>
<%--<div class="my-3 d-flex">--%>

<%--    <form action="/nem/search-hoa-don" method="get">--%>
<%--        ID khách hàng: <input type="number" name="id" class="form-control d-inline w-25" placeholder="Nhập id hóa đơn">--%>
<%--        <button class="btn btn-info" >Tìm kiếm</button>--%>
<%--    </form>--%>
<%--    <div class="d-flex rounded justify-content-center align-items-center">--%>
<%--        <a href="/nem/home" class="btn btn-primary" >Quay lại trang chủ</a>--%>
<%--    </div>--%>
<%--</div>--%>

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
<div class="container ">

    <table class="table table-striped table-hover table-success">
        <thead>
        <tr>
            <th>ID Hóa Đơn</th>
            <th>Tên Nhân Viên</th>
            <th>Tên Khách Hàng</th>
            <th>Ngày Mua Hàng</th>
            <th>Trạng Thái</th>
            <th colspan="2">Chi Tiết Sản Phẩm</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hoaDon" items="${hoaDonList}">
            <tr>
                <th scope="row">${hoaDon.id}</th>
                <td>${hoaDon.nhanVien.ten}</td>
                <td>${hoaDon.khachHang.ten}</td>
                <td>${hoaDon.ngayMuaHang}</td>
                <td>
                    <c:choose>
                        <c:when test="${hoaDon.trangThai==1}">
                            <span class="badge bg-success">Đã thanh toán</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-warning">Chưa thanh toán</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td colspan="2" class="table-active">
                    <ul class="list-unstyled ">
                        <c:forEach var="hdct" items="${hoaDon.hoaDonChiTietList}">
                            <li>
                                <strong>Mã SP:</strong> ${hdct.sanPhamCT.maSPCT} |
                                    ${hdct.sanPhamCT.mauSac.ten} |
                                    ${hdct.sanPhamCT.kichThuoc.ten} |
                                <strong>Số lượng:</strong> ${hdct.soLuong} |
                                    ${hdct.donGia} VND
                            </li>
                        </c:forEach>
                    </ul>
                </td>

                <td>
                    <a href="/nem/sua-hoa-don/${hoaDon.id}" class="btn btn-sm btn-primary">Sửa</a>
                    <a href="/nem/chi-tiet-hoa-don/${hoaDon.id}" class="btn btn-sm btn-primary">Chi tiết</a>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>

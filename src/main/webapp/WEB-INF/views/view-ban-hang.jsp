<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
<div class="alert alert-success alert-dismissible fade show position-fixed top-0 end-0 mt-3 me-3" role="alert"
     id="successAlert">
    ${successMessage}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<div class="container my-3">

    <!-- Form thêm hóa đơn -->
    <form action="/nem/them-hd" method="post">

        <div class="d-flex row">
            <!-- Nhân viên -->
            <div class="mx-2 col-5">
                <label for="productSelect13" class="form-label">Chọn nhân viên bán hàng</label>
                <select id="productSelect13" name="NhanVien" class="form-select">
                    <c:forEach var="nhanVien" items="${nhanViens}">
                        <option value="${nhanVien.id}">${nhanVien.ten}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Khách hàng -->
            <div class="col-5">
                <label for="productSelect21" class="form-label">Chọn số điện thoại khách hàng</label>
                <select id="productSelect21" name="KhachHang" class="form-select">
                    <c:forEach var="khachHang" items="${khachHangs}">
                        <option value="${khachHang.id}">${khachHang.sdt}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- Chọn sản phẩm chi tiết -->
        <div id="productContainer" class="d-flex flex-column my-4 ">
            <div class="row product-row">
                <div class="mx-2 col-2">
                    <label for="productSelect22" class="form-label">Chọn sản phẩm </label>
                    <select class="form-select" name="sanPhamCT[]" onchange="updatePrice(this)">
                        <option>Chọn sản phẩm</option>

                        <c:forEach var="sanPhamCT" items="${sanPhamCTs}">
                            <option value="${sanPhamCT.id}" data-price="${sanPhamCT.donGia}"
                                    data-mauSac="${sanPhamCT.mauSac.ten}" data-kichThuoc="${sanPhamCT.kichThuoc.ten}">
                                    ${sanPhamCT.maSPCT}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-2">
                    <label class="form-label">Màu sắc:</label>
                    <input name="mauSac" type="text" class="form-control productPrice" readonly="true"/>
                </div>
                <div class="col-2">
                    <label class="form-label">kich thước:</label>
                    <input name="kichThuoc" type="text" class="form-control productPrice" readonly="true"/>
                </div>
                <!-- Đơn Giá -->
                <div class="col-2">
                    <label class="form-label">Đơn Giá:</label>
                    <input name="donGia[]" type="text" class="form-control productPrice" readonly="true"/>
                </div>

                <!-- Số Lượng -->
                <div class="mx-3 col-2">
                    <label for="soLuong" class="form-label">Số Lượng</label>
                    <input type="number" name="soLuong[]" class="form-control"/>
                </div>

                <div class="col-1 mx-2 mt-4">
                    <button type="button" class="btn btn-outline-danger " onclick="addProduct()">+</button>
                </div>
            </div>
        </div>

        <!-- Trạng thái thanh toán -->
        <div class="d-flex mx-2">
            <label class="form-label">Trạng Thái</label>
            <div class="mb-3 ms-3 form-check">
                <input type="radio" name="trangThai" value="1" id="trangThaiTrue" checked="checked"
                       class="form-check-input"/>
                <label class="form-check-label" for="trangThaiTrue">Đã thanh toán</label>
            </div>
            <div class="mb-3 ms-3 form-check">
                <input type="radio" name="trangThai" value="0" id="trangThaiFalse" class="form-check-input"/>
                <label class="form-check-label" for="trangThaiFalse">Chưa thanh toán</label>
            </div>
        </div>

        <!-- Nút submit -->
        <div class="mx-2">
            <button onclick="return confirm('Bạn chắc chắn thêm?')" type="submit" class="btn btn-outline-info"> Thêm
            </button>
        </div>
    </form>

    <img width="1300px" class="my-4" src="https://file.hstatic.net/200000182297/file/1__6_.png" alt="">


</div>
<script>

     setTimeout(function() {
        let alertElement = document.getElementById("successAlert");
        if (alertElement) {
            let bsAlert = new bootstrap.Alert(alertElement);
            bsAlert.close();
        }
    }, 3000);  // 3000 ms = 3 giây

    function addProduct() {
        var productContainer = document.getElementById("productContainer");

        // Tạo dòng sản phẩm mới
        var newRow = document.createElement("div");
        newRow.className = "row product-row";

        newRow.innerHTML = `
            <div id="productContainer" class="d-flex flex-column  ">
            <div class="row product-row">
                <div class="mx-2 col-2">
                    <select class="form-select" name="sanPhamCT[]" onchange="updatePrice(this)">
                        <option  >Chọn sản phẩm</option>

                        <c:forEach var="sanPhamCT" items="${sanPhamCTs}">
    <option value="${sanPhamCT.id}" data-price="${sanPhamCT.donGia}" data-mauSac="${sanPhamCT.mauSac.ten}" data-kichThuoc="${sanPhamCT.kichThuoc.ten}">
    ${sanPhamCT.maSPCT}
    </option>
</c:forEach>
                    </select>
                </div>
                <div class="col-2">
                    <input name="mauSac" type="text" class="form-control productPrice" readonly="true" />
                </div>
                <div class="col-2">
                    <input name="kichThuoc" type="text" class="form-control productPrice" readonly="true" />
                </div>
                <!-- Đơn Giá -->
                <div class="col-2">
                    <input name="donGia[]" type="text" class="form-control productPrice" readonly="true" />
                </div>

                <!-- Số Lượng -->
                <div class="mx-3 col-2">
                    <input type="number" name="soLuong[]" class="form-control" />
                </div>


                <div class="col-1 mx-2 my-1">
                <button type="button" class="btn btn-info" onclick="removeProduct(this)">-</button>
            </div>
            </div>
        </div>

        `;

        productContainer.appendChild(newRow);
    }

    function updatePrice(selectElement) {
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var price = selectedOption.getAttribute("data-price");
    var mauSac = selectedOption.getAttribute("data-mauSac");
    var kichThuoc = selectedOption.getAttribute("data-kichThuoc");

    // Cập nhật giá vào trường "Đơn Giá"
    var priceInput = selectElement.closest('.product-row').querySelector('input[name="donGia[]"]');
    priceInput.value = price || "";

    // Cập nhật màu sắc vào trường "Màu Sắc"
    var mauSacInput = selectElement.closest('.product-row').querySelector('input[name="mauSac"]');
    mauSacInput.value = mauSac || "";

    // Cập nhật kích thước vào trường "Kích Thước"
    var kichThuocInput = selectElement.closest('.product-row').querySelector('input[name="kichThuoc"]');
    kichThuocInput.value = kichThuoc || "";
}


    function removeProduct(button) {
        // Xóa dòng sản phẩm hiện tại
        var productRow = button.closest('.product-row');
        productRow.remove();
    }


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

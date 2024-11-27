<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Hóa Đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        padding: 20px;
        background-image: url('https://theme.hstatic.net/200000182297/1000887316/14/hb_image2_master.jpg?v=1533');

    }
</style>
<div class="container mt-5">
    <h2 class="text-center text-primary">Sửa Hóa Đơn</h2>

    <form action="/nem/sua-hd" method="post">
        <input type="hidden" name="id" value="${hoaDon.id}"/> <!-- Thêm trường ẩn cho ID -->

        <div class="d-flex row">
            <!-- Nhân viên -->
            <div class="mx-2 col-5">
                <label for="productSelect13" class="form-label">Chọn nhân viên bán hàng</label>
                <select id="productSelect13" name="NhanVien" class="form-select">
                    <c:forEach var="nhanVien" items="${nhanViens}">
                        <option value="${nhanVien.id}"
                                <c:if test="${nhanVien.id == hoaDon.nhanVien.id}">selected</c:if>>${nhanVien.ten}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Khách hàng -->
            <div class="col-5">
                <label for="productSelect21" class="form-label">Chọn số điện thoại khách hàng</label>
                <select id="productSelect21" name="KhachHang" class="form-select">
                    <c:forEach var="khachHang" items="${khachHangs}">
                        <option value="${khachHang.id}"
                                <c:if test="${khachHang.id == hoaDon.khachHang.id}">selected</c:if>>${khachHang.sdt}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- Chọn sản phẩm chi tiết -->
        <div id="productContainer" class="d-flex flex-column my-4">
            <c:forEach var="hdct" items="${hoaDon.hoaDonChiTietList}">
                <div class="row product-row">
                    <div class="mx-2 col-2">

                        <select class="form-select" name="sanPhamCT[]" onchange="updatePrice(this)">
                            <option value="">Chọn sản phẩm</option>
                            <c:forEach var="sanPhamCT" items="${sanPhamCTs}">
                                <option value="${sanPhamCT.id}" data-price="${sanPhamCT.donGia}"
                                        data-mauSac="${sanPhamCT.mauSac.ten}"
                                        data-kichThuoc="${sanPhamCT.kichThuoc.ten}"
                                        <c:if test="${hdct.sanPhamCT.id == sanPhamCT.id}">selected</c:if>>${sanPhamCT.maSPCT}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-2">
                        <input name="mauSac[]" type="text" class="form-control productPrice"
                               value="${hdct.sanPhamCT.mauSac.ten}" readonly="true"/>
                    </div>
                    <div class="col-2">
                        <input name="kichThuoc[]" type="text" class="form-control productPrice"
                               value="${hdct.sanPhamCT.kichThuoc.ten}" readonly="true"/>
                    </div>
                    <div class="col-2">
                        <input name="donGia[]" type="text" class="form-control productPrice" value="${hdct.donGia}"
                               readonly="true"/>
                    </div>
                    <div class="mx-3 col-2">
                        <input type="number" name="soLuong[]" class="form-control" value="${hdct.soLuong}" required
                               min="1"/> <!-- Thêm required và min để yêu cầu số lượng tối thiểu là 1 -->
                    </div>
                    <div class="col-1 d-flex">
                        <div class="">
                            <button type="button" class="btn btn-outline-danger" onclick="addNewRow()">+</button>
                        </div>
                        <div class="">
                            <button type="button" class="btn btn-outline-danger" onclick="removeRow(this)">-</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Trạng thái thanh toán -->
        <div class="d-flex mx-2">
            <label class="form-label">Trạng Thái</label>
            <div class="mb-3 ms-3 form-check">
                <input type="radio" name="trangThai" value="1" id="trangThaiTrue"
                       <c:if test="${hoaDon.trangThai == 1}">checked</c:if> class="form-check-input"/>
                <label class="form-check-label" for="trangThaiTrue">Đã thanh toán</label>
            </div>
            <div class="mb-3 ms-3 form-check">
                <input type="radio" name="trangThai" value="0" id="trangThaiFalse"
                       <c:if test="${hoaDon.trangThai == 0}">checked</c:if> class="form-check-input"/>
                <label class="form-check-label" for="trangThaiFalse">Chưa thanh toán</label>
            </div>
        </div>

        <!-- Nút submit -->
        <div class="mx-2">
            <button onclick="return confirm('Bạn chắc chắn sửa?')" type="submit" class="btn btn-outline-info"> Sửa
            </button>
        </div>
    </form>


</div>
<script>
function addNewRow() {
    // Tạo một div mới cho dòng sản phẩm
    var newRow = document.createElement('div');
    newRow.classList.add('row', 'product-row');
    newRow.innerHTML = `
        <div class="mx-2 col-2">

            <select class="form-select" name="sanPhamCT[]" onchange="updatePrice(this)">
                <option value="">Chọn sản phẩm</option>
                <c:forEach var="sanPhamCT" items="${sanPhamCTs}">
    <option value="${sanPhamCT.id}" data-price="${sanPhamCT.donGia}" data-mauSac="${sanPhamCT.mauSac.ten}" data-kichThuoc="${sanPhamCT.kichThuoc.ten}">${sanPhamCT.maSPCT}</option>
</c:forEach>
            </select>
        </div>
        <div class="col-2">
            <input name="mauSac[]" type="text" class="form-control productPrice" readonly="true" />
        </div>
        <div class="col-2">
            <input name="kichThuoc[]" type="text" class="form-control productPrice" readonly="true" />
        </div>
        <div class="col-2">
            <input name="donGia[]" type="text" class="form-control productPrice" readonly="true" />
        </div>
        <div class="mx-3 col-2">
            <input type="number" name="soLuong[]"   class="form-control" required min="1"/>
        </div>
        <div class="col-1 mx-1 ">
            <button type="button" class="btn btn-outline-danger" onclick="removeRow(this)">-</button>
        </div>
    `;

    // Thêm dòng sản phẩm mới vào container
    document.getElementById('productContainer').appendChild(newRow);
}

function removeRow(button) {
    // Tìm phần tử dòng (row) chứa nút bấm và xóa nó
    var productRow = button.closest('.product-row');
    productRow.remove();
}






function updatePrice(selectElement) {
    // Lấy thông tin từ option được chọn
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var mauSac = selectedOption.getAttribute('data-mauSac');
    var kichThuoc = selectedOption.getAttribute('data-kichThuoc');
    var donGia = selectedOption.getAttribute('data-price');

    // Tìm phần tử row hiện tại chứa selectElement
    var productRow = selectElement.closest('.product-row');

    // Cập nhật các trường màu sắc, kích thước, đơn giá tương ứng
    productRow.querySelector('input[name="mauSac[]"]').value = mauSac;
    productRow.querySelector('input[name="kichThuoc[]"]').value = kichThuoc;
    productRow.querySelector('input[name="donGia[]"]').value = donGia;
}



function updateDetails(selectElement) {
    // Lấy thông tin từ option được chọn
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var mau = selectedOption.getAttribute('data-mau');
    var kichthuoc = selectedOption.getAttribute('data-kichthuoc');
    var dongia = selectedOption.getAttribute('data-dongia'); // Lấy Đơn giá

    // Cập nhật thông tin màu, kích thước và đơn giá
    var liElement = selectElement.closest('li');
    liElement.querySelector('.mau').textContent = mau;
    liElement.querySelector('.kichthuoc').textContent = kichthuoc;
    liElement.querySelector('.dongia').textContent = dongia + ' VND'; // Cập nhật Đơn giá
}



</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

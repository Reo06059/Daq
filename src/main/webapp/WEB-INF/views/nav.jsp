<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <%@ page contentType="text/html; charset=UTF-8" %>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Nem Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="">

<div class="container">
    <div class="head">
        <nav class="navbar navbar-expand-lg bg-body-tertiary  text-info">
            <div class="container-fluid">
                <a class="navbar-brand" href="/nem/home"> <img
                        src="https://theme.hstatic.net/200000182297/1000887316/14/logo.png?v=1530" alt=""></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item ">
                            <a class="nav-link active text-primary" aria-current="page" href="/nem/ban-hang">Bán
                                hàng</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-info" href="/nem/hien-thi-mau-sac">Màu sắc</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-info" href="/nem/hien-thi-kich-thuoc">Kich thước</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-info" href="/nem/hien-thi-khach-hang">Khách hàng</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-info" href="/nem/hien-thi-nhan-vien">Nhân viên</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-info" href="/nem/hien-thi-san-pham">Sản phẩm</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-info" href="/nem/hien-thi-san-pham-ct">Sản phẩm chi tiết</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-info" href="/nem/hoa-don">Hóa đơn</a>
                        </li>

                        <%--                        <li class="nav-item">--%>
                        <%--                            <a class="nav-link text-info" href="/nem/hien-thi-hoa-don-ct">Hóa đơn chi tiết</a>--%>
                        <%--                        </li>--%>
                    </ul>

                </div>
            </div>
        </nav>
    </div>


    <div class="row d-flex p-0 m-0">
        <div class="col-12 bg-info p-0">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2000">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://theme.hstatic.net/200000182297/1000887316/14/ms_banner_img2_master.jpg?v=1530"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://theme.hstatic.net/200000182297/1000887316/14/ms_banner_img3_master.jpg?v=1530"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://theme.hstatic.net/200000182297/1000887316/14/hb_image2_master.jpg?v=1530"
                             class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>


</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        padding: 20px;
        background-image: url('https://theme.hstatic.net/200000182297/1000887316/14/hb_image2_master.jpg?v=1533');
    }

    .bg-login {
        position: relative;
        width: 100%;
        min-height: auto;
        background-position: right 0px top 0px;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        background-size: cover;
        -o-background-size: cover;
    }

    .login-form {
        border: 1px solid #DDD;
        border-radius: 4px;
        max-width: 400px;
        padding: 20px;
        margin-top: 100px;
        margin-left: auto;
        margin-right: auto;
    }

    .error {
        color: crimson;
    }
</style>
<c:if test="${not empty successMessage}">
    <div class="alert alert-success text-center">
            ${successMessage}
    </div>
    <!-- Script để điều hướng sau 3 giây -->
    <script>
                setTimeout(function(){
                    window.location.href = "/nem/home"; // Điều hướng đến trang home sau 3 giây
                }, 3000);


    </script>
</c:if>
<div class="bg-login">
    <div class="login-form">
        <h3>Login</h3>
        <br>
        <form action="/nem/login" method="POST">
            <div class="mb-3">
                <label class="form-label">Username:</label>
                <input name="username" type="text" class="form-control"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Password:</label>
                <input name="password" type="password" class="form-control"/>
            </div>

            <br>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>

        <!-- Hiển thị thông báo lỗi nếu có -->
        <span class="error">${errorMessage}</span>

        <!-- Hiển thị thông báo thành công -->


        <p class="text-center"><a href="#">Signup</a></p>
    </div>
</div>

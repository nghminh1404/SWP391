
<%@page import="Model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Register</title>

        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">

        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>

        <div class="main-wrapper login-body">
            <div class="login-wrapper">
                <div class="container">
                    <div class="loginbox">
                        <div class="login-left">
                            <img class="img-fluid" src="assets/img/logo-white.png" alt="Logo">
                        </div>
                        <div class="login-right">
                            <div class="login-right-wrap">
                                <h1>Register</h1>
                                <p class="account-subtitle">Code has already sent! <br/> Check your email!</p>

                                <form action="verify" method="post">
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="Input Code" name="code" required>
                                    </div>
                                    <div class="notify-below" style="color: #ff424f;">

                                    </div>
                                    <div class="form-group mb-0">
                                        <button class="btn btn-primary btn-block" type="submit">Verify</button>
                                    </div>
                                    <input type="text" name="full_name" value="${full_name}" hidden>
                                    <input type="text" name="email" value="${email}" hidden>
                                    <input type="text" name="password" value="${password}" hidden>
                                    <input type="text" name="confirm_password" value="${confirm_password}" hidden>
                                    <input type="text" name="mobile" value="${mobile}" hidden>
                                    <input type="text" name="authcode" value="${authcode}" hidden>
                                </form>




                                <div class="text-center dont-have">Already have an account? <a href="login">Login</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/js/script.js"></script>
        <script>
            document.querySelector('form[action="verify"]').onsubmit = (e) => {
                var notifyBelows = document.getElementsByClassName('notify-below');
                if (document.getElementsByName('code')[0].value !== document.getElementsByName('authcode')[0].value) {
                    notifyBelows[0].innerHTML = 'Code is incorrect!!!';
                    e.preventDefault();
                } else
                    notifyBelows[0].innerHTML = '';
            };

        </script>
    </body>

</html>
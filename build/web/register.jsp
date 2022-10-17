
<%@page import="Model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
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
                                <p class="account-subtitle">Access to our dashboard</p>

                                <form action="register" method="post">
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="Full Name" name="full_name" required>
                                    </div>
                                    <div class="form-group">
                                        <input oninput="disableNofity()" class="form-control" type="text" placeholder="Email" name="email" value="${email}" required>
                                    </div>
                                    <div class="notify-below" style="color: #ff424f;">
                                        <c:if test="${email != null}">Email is existed!!!</c:if>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="password" placeholder="Password" name="password" required>
                                    </div>
                                    <div class="notify-below" style="color: #ff424f;">

                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="password" placeholder="Confirm Password" name="confirm_password" required>
                                    </div>
                                    <div class="notify-below" style="color: #ff424f;">

                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="Phone Number" name="mobile">
                                    </div>
                                    <div class="notify-below" style="color: #ff424f;">

                                    </div>
                                    <div class="form-group mb-0">
                                        <button class="btn btn-primary btn-block" type="submit">Register</button>
                                    </div>
                                </form>
                                <div class="text-center dont-have">Already have an account? <a href="login.html">Login</a></div>
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
            var passwordRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
            var phoneRegex = new RegExp("[0-9]{10}");
            document.querySelector('form[action="register"]').onsubmit = (e) => {
                var notifyBelows = document.getElementsByClassName('notify-below');
                if (!passwordRegex.test(document.getElementsByName('password')[0].value)) {
                    notifyBelows[1].innerHTML = 'Password contains at least 8 characters including lowercase, uppercase, numbers and special characters';
                    e.preventDefault();
                } else
                    notifyBelows[1].innerHTML = '';
                if (document.getElementsByName('password')[0].value !== document.getElementsByName('confirm_password')[0].value) {
                    notifyBelows[2].innerHTML = 'Re-password is incorrect!!!';
                    e.preventDefault();
                } else
                    notifyBelows[2].innerHTML = '';
                if (!phoneRegex.test(document.getElementsByName('mobile')[0].value)) {
                    notifyBelows[3].innerHTML = 'Phone number must be contain 10 digits';
                    e.preventDefault();
                } else
                    notifyBelows[3].innerHTML = '';
                
            };
            
            function disableNofity(){
                document.getElementsByClassName('notify-below')[0].style.display = 'none';
            }
            
        </script>
    </body>

</html>

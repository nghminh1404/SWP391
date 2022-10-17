
<%@page import="Model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Change Password</title>

        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">

        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            #snackbar {
                visibility: hidden;
                min-width: 250px;
                margin-left: -125px;
                background-color: #333;
                color: #fff;
                text-align: center;
                border-radius: 2px;
                padding: 16px;
                position: fixed;
                z-index: 1;
                left: 50%;
                top: 30px;
                font-size: 17px;
            }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            @-webkit-keyframes fadein {
                from {
                    top: 0;
                    opacity: 0;
                }
                to {
                    top: 30px;
                    opacity: 1;
                }
            }

            @keyframes fadein {
                from {
                    top: 0;
                    opacity: 0;
                }
                to {
                    top: 30px;
                    opacity: 1;
                }
            }

            @-webkit-keyframes fadeout {
                from {
                    top: 30px;
                    opacity: 1;
                }
                to {
                    top: 0;
                    opacity: 0;
                }
            }

            @keyframes fadeout {
                from {
                    top: 30px;
                    opacity: 1;
                }
                to {
                    top: 0;
                    opacity: 0;
                }
            }
        </style>
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
                            <input type="number" name="update" value="${update}" hidden>

                            <div class="login-right-wrap">
                                <c:if test="${update == 1}">
                                    <div id="snackbar">Change Password Successfully!!!</div>
                                </c:if>
                                
                                <h1>Change Password</h1>
                                <p class="account-subtitle"></p>

                                <form action="changepassword" method="post">
                                    <div class="form-group">
                                        <input class="form-control" oninput="disableNofity()" type="password" placeholder="Password" name="password" value="${password}" required>
                                    </div>
                                    <div class="notify-below" style="color: #ff424f;">
                                        <c:if test="${password != null}">
                                            Password is incorrect!!!
                                        </c:if>
                                    </div>

                                    <div class="form-group">
                                        <input onkeydown="disableNotify1()" class="form-control" type="password" placeholder="New Password" name="new_password" required>
                                    </div>
                                    <div class="notify-below" style="color: #ff424f;">

                                    </div>


                                    <div class="form-group">
                                        <input class="form-control" type="password" placeholder="Confirm New Password" name="confirm_new_password" required>
                                    </div>
                                    <div class="notify-below" style="color: #ff424f;">

                                    </div>

                                    <div class="form-group mb-0">
                                        <button onclick="myFunction()" class="btn btn-primary btn-block" type="submit">Save Password</button>
                                    </div>
                                </form>
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
                                            document.querySelector('form[action="changepassword"]').onsubmit = (e) => {
                                                var notifyBelows = document.getElementsByClassName('notify-below');
                                                if (!passwordRegex.test(document.getElementsByName('new_password')[0].value)) {
                                                    notifyBelows[1].innerHTML = 'Password contains at least 8 characters including lowercase, uppercase, numbers and special characters';
                                                    e.preventDefault();
                                                } else
                                                    notifyBelows[1].innerHTML = '';
                                                if (document.getElementsByName('new_password')[0].value !== document.getElementsByName('confirm_new_password')[0].value) {
                                                    notifyBelows[2].innerHTML = 'Re-password is incorrect!!!';
                                                    e.preventDefault();
                                                } else
                                                    notifyBelows[2].innerHTML = '';

                                            };

                                            function disableNofity() {
                                                document.getElementsByClassName('notify-below')[0].style.display = 'none';
                                            }

                                            function disableNofity1() {
                                                document.getElementsByClassName('notify-below')[1].style.display = 'none';
                                            }

                                            function myFunction() {
                                                var x = document.getElementById("snackbar");
                                                x.className = "show";
                                                setTimeout(function () {
                                                    x.className = x.className.replace("show", "");
                                                }, 3000);
                                            }

        </script>
    </body>

</html>

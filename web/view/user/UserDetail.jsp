<%-- 
    Document   : UserDetail
    Created on : Sep 22, 2022, 10:13:49 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User detail page</title>
        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">
    </head>
    <body>
        <div class="main-wrapper">
            <%@include file="leftmenu.jsp" %>
            <div class="page-wrapper" style="min-height: 764px;">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row">
                            <div class="col">
                                <h3 class="page-title">User Detail</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">User detail</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="profile-header">
                                <div class="row align-items-center">
                                    <div class="col-auto profile-image">
                                        <a href="#">
                                            <img class="rounded-circle" alt="User Image" src="${requestScope.user.avatar_url}">
                                        </a>
                                    </div>
                                    <div class="col ml-md-n2 profile-user-info">
                                        <h4 class="user-name mb-0">${requestScope.user.full_name}</h4>           
                                        <div class="about-text">${requestScope.user.note}</div>
                                    </div>

                                </div>
                            </div>
                            <div class="profile-menu">

                            </div>
                            <div class="tab-content profile-tab-cont">
                                <div class="tab-pane fade show active" id="per_details_tab">
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title d-flex justify-content-between">
                                                        <span>Personal Details</span>

                                                    </h5>
                                                    <div class="row">
                                                        <p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Name</p>
                                                        <p class="col-sm-9">${requestScope.user.full_name}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-3 text-muted text-sm-right mb-0">Role</p>
                                                        <p class="col-sm-9">${requestScope.user.setting.setting_title}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Email</p>
                                                        <p class="col-sm-9">${requestScope.user.email}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Mobile</p>
                                                        <p class="col-sm-9">${requestScope.user.mobile}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title d-flex justify-content-between">
                                                        <span>Account Status</span>
                                                    </h5>
                                                    <c:if test="${requestScope.user.status == true}">
                                                        <button class="btn btn-success" type="button"> Activate </button>
                                                    </c:if> 
                                                    <c:if test="${requestScope.user.status == false}">
                                                        <button class="btn btn-danger" type="button"> Deactivate  </button>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="card">

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/script.js"></script><div class="sidebar-overlay"></div>

        <!-- Mirrored from preschool.dreamguystech.com/html-template/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:11:39 GMT -->
    </body>
</html>

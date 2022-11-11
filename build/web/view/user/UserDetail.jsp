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
<<<<<<< .merge_file_a17160
            <%@include file="leftmenu.jsp" %>
=======
            <div class="header">
                <div class="header-left">
                    <a href="index.html" class="logo">
                        <img src="assets/img/logo.png" alt="Logo">
                    </a>
                    <a href="index.html" class="logo logo-small">
                        <img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
                    </a>
                </div>
                <a href="javascript:void(0);" id="toggle_btn">
                    <i class="fas fa-align-left"></i>
                </a>
                <div class="top-nav-search">
                    <form>
                        <input type="text" class="form-control" placeholder="Search here">
                        <button class="btn" type="submit"><i class="fas fa-search"></i></button>
                    </form>
                </div>
                <a class="mobile_btn" id="mobile_btn">
                    <i class="fas fa-bars"></i>
                </a>
                <ul class="nav user-menu">
                    <li class="nav-item dropdown noti-dropdown">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            <i class="far fa-bell"></i> <span class="badge badge-pill">3</span>
                        </a>
                        <div class="dropdown-menu notifications">
                            <div class="topnav-dropdown-header">
                                <span class="notification-title">Notifications</span>
                                <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                            </div>
                            <div class="noti-content">
                                <ul class="notification-list">
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-02.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Carlson Tech</span> has approved <span class="noti-title">your estimate</span></p>
                                                    <p class="noti-time"><span class="notification-time">4 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-11.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">International Software Inc</span> has sent you a invoice in the amount of <span class="noti-title">$218</span></p>
                                                    <p class="noti-time"><span class="notification-time">6 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-17.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">John Hendry</span> sent a cancellation request <span class="noti-title">Apple iPhone XR</span></p>
                                                    <p class="noti-time"><span class="notification-time">8 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-13.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Mercury Software Inc</span> added a new product <span class="noti-title">Apple MacBook Pro</span></p>
                                                    <p class="noti-time"><span class="notification-time">12 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="topnav-dropdown-footer">
                                <a href="#">View all Notifications</a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            <span class="user-img"><img class="rounded-circle" src="${sessionScope.user.avatar_url}" width="31" alt="Ryan Taylor"></span>
                        </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm">
                                    <img src="${sessionScope.user.avatar_url}" alt="User Image" class="avatar-img rounded-circle">
                                </div>
                                <div class="user-text">
                                    <h6>${sessionScope.user.full_name}</h6>
                                    <p class="text-muted mb-0">${sessionScope.user.setting.setting_title}</p>
                                </div>
                            </div>
                            <a class="dropdown-item" href="profile.html">My Profile</a>
                            <a class="dropdown-item" href="inbox.html">Inbox</a>
                            <a class="dropdown-item" href="login.html">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: 100%; height: 704px;"><div class="sidebar-inner slimscroll" style="overflow: hidden; width: 100%; height: 704px;">
                        <div id="sidebar-menu" class="sidebar-menu">
                            <ul>
                                <li class="menu-title">
                                    <span>Main Menu</span>
                                </li>
                                <li class="submenu">
                                    <a href="#"><i class="fas fa-user-graduate"></i> <span> Dashboard</span> <span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="index.html">Admin Dashboard</a></li>
                                        <li><a href="teacher-dashboard.html">Teacher Dashboard</a></li>
                                        <li><a href="student-dashboard.html">Student Dashboard</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="#"><i class="fas fa-user-graduate"></i> <span> Students</span> <span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="students.html">Student List</a></li>
                                        <li><a href="student-details.html">Student View</a></li>
                                        <li><a href="add-student.html">Student Add</a></li>
                                        <li><a href="edit-student.html">Student Edit</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="#"><i class="fas fa-chalkboard-teacher"></i> <span> Teachers</span> <span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="teachers.html">Teacher List</a></li>
                                        <li><a href="teacher-details.html">Teacher View</a></li>
                                        <li><a href="add-teacher.html">Teacher Add</a></li>
                                        <li><a href="edit-teacher.html">Teacher Edit</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="#"><i class="fas fa-building"></i> <span> Departments</span> <span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="departments.html">Department List</a></li>
                                        <li><a href="add-department.html">Department Add</a></li>
                                        <li><a href="edit-department.html">Department Edit</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="#"><i class="fas fa-book-reader"></i> <span> Subjects</span> <span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="subjects.html">Subject List</a></li>
                                        <li><a href="add-subject.html">Subject Add</a></li>
                                        <li><a href="edit-subject.html">Subject Edit</a></li>
                                    </ul>
                                </li>
                                <li class="menu-title">
                                    <span>Management</span>
                                </li>
                                <li class="submenu">
                                    <a href="#"><i class="fas fa-file-invoice-dollar"></i> <span> Accounts</span> <span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="fees-collections.html">Fees Collection</a></li>
                                        <li><a href="expenses.html">Expenses</a></li>
                                        <li><a href="salary.html">Salary</a></li>
                                        <li><a href="add-fees-collection.html">Add Fees</a></li>
                                        <li><a href="add-expenses.html">Add Expenses</a></li>
                                        <li><a href="add-salary.html">Add Salary</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="holiday.html"><i class="fas fa-holly-berry"></i> <span>Holiday</span></a>
                                </li>
                                <li>
                                    <a href="fees.html"><i class="fas fa-comment-dollar"></i> <span>Fees</span></a>
                                </li>
                                <li>
                                    <a href="exam.html"><i class="fas fa-clipboard-list"></i> <span>Exam list</span></a>
                                </li>
                                <li>
                                    <a href="event.html"><i class="fas fa-calendar-day"></i> <span>Events</span></a>
                                </li>
                                <li>
                                    <a href="time-table.html"><i class="fas fa-table"></i> <span>Time Table</span></a>
                                </li>
                                <li>
                                    <a href="library.html"><i class="fas fa-book"></i> <span>Library</span></a>
                                </li>
                                <li class="menu-title">
                                    <span>Pages</span>
                                </li>
                                <li class="submenu">
                                    <a href="#"><i class="fas fa-shield-alt"></i> <span> Authentication </span> <span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="login.html">Login</a></li>
                                        <li><a href="register.html">Register</a></li>
                                        <li><a href="forgot-password.html">Forgot Password</a></li>
                                        <li><a href="error-404.html">Error Page</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="blank-page.html"><i class="fas fa-file"></i> <span>Blank Page</span></a>
                                </li>
                                <li class="menu-title">
                                    <span>Others</span>
                                </li>
                                <li>
                                    <a href="sports.html"><i class="fas fa-baseball-ball"></i> <span>Sports</span></a>
                                </li>
                                <li>
                                    <a href="hostel.html"><i class="fas fa-hotel"></i> <span>Hostel</span></a>
                                </li>
                                <li>
                                    <a href="transport.html"><i class="fas fa-bus"></i> <span>Transport</span></a>
                                </li>
                                <li class="menu-title">
                                    <span>UI Interface</span>
                                </li>
                                <li>
                                    <a href="components.html"><i class="fas fa-vector-square"></i> <span>Components</span></a>
                                </li>
                                <li class="submenu">
                                    <a href="#"><i class="fas fa-columns"></i> <span> Forms </span> <span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="form-basic-inputs.html">Basic Inputs </a></li>
                                        <li><a href="form-input-groups.html">Input Groups </a></li>
                                        <li><a href="form-horizontal.html">Horizontal Form </a></li>
                                        <li><a href="form-vertical.html"> Vertical Form </a></li>
                                        <li><a href="form-mask.html"> Form Mask </a></li>
                                        <li><a href="form-validation.html"> Form Validation </a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="#"><i class="fas fa-table"></i> <span> Tables </span> <span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="tables-basic.html">Basic Tables </a></li>
                                        <li><a href="data-tables.html">Data Table </a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"><i class="fas fa-code"></i> <span>Multi Level</span> <span class="menu-arrow"></span></a>
                                    <ul>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"> <span>Level 1</span> <span class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="javascript:void(0);"><span>Level 2</span></a></li>
                                                <li class="submenu">
                                                    <a href="javascript:void(0);"> <span> Level 2</span> <span class="menu-arrow"></span></a>
                                                    <ul>
                                                        <li><a href="javascript:void(0);">Level 3</a></li>
                                                        <li><a href="javascript:void(0);">Level 3</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="javascript:void(0);"> <span>Level 2</span></a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);"> <span>Level 1</span></a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div><div class="slimScrollBar" style="background: rgb(204, 204, 204); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 390.864px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
            </div>
>>>>>>> .merge_file_a12872
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
<<<<<<< .merge_file_a17160
            <%@include file="footer.jsp" %>
=======
>>>>>>> .merge_file_a12872
        </div>
        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/script.js"></script><div class="sidebar-overlay"></div>

        <!-- Mirrored from preschool.dreamguystech.com/html-template/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:11:39 GMT -->
    </body>
</html>

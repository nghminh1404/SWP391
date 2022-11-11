<%-- 
    Document   : profile
    Created on : Sep 25, 2022, 10:39:40 AM
    Author     : Hp
--%>
<<<<<<< .merge_file_a04628
=======

>>>>>>> .merge_file_a13372
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <!-- Mirrored from preschool.dreamguystech.com/html-template/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:11:38 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>SWP - Profile</title>
        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <div class="main-wrapper">
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
<<<<<<< .merge_file_a04628
                            <span class="user-img"><img class="rounded-circle" src="${sessionScope.user.avatar_url}" width="31" height="31" style="object-fit: cover;" alt="Ryan Taylor"></span>
=======
                            <span class="user-img"><img class="rounded-circle" src="${sessionScope.user.avatar_url}" width="31" alt="Ryan Taylor"></span>
>>>>>>> .merge_file_a13372
                        </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm">
                                    <img src="${sessionScope.user.avatar_url}" alt="User Image" class="avatar-img rounded-circle">
                                </div>
                                <div class="user-text">
                                    <h6>${sessionScope.user.full_name}</h6>
                                    <p class="text-muted mb-0">Administrator</p>
                                </div>
                            </div>
                            <a class="dropdown-item" href="profile">My Profile</a>
                            <a class="dropdown-item" href="#">Inbox</a>
                            <a class="dropdown-item" href="login">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
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
                </div>
            </div>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row">
                            <div class="col">
                                <h3 class="page-title">Profile</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Profile</li>
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
<<<<<<< .merge_file_a04628
                                            <img class="rounded-circle" style="width: 200px; height: 122px; object-fit: cover;" alt="User Image" src="${sessionScope.user.avatar_url}"/>                                            
                                        </a>
                                    </div>
                                    <div class="col ml-md-n2 profile-user-info">
                                        <form action="editprofile?action=changeavatar" enctype="multipart/form-data" method="post">
                                            <input type="file" name="avatar">
                                            <button class="btn btn-primary" type="submit">Save Changes</button>
                                        </form>
                                    </div>
                                    <div class="col-auto profile-btn">
                                        <a href="editprofile" class="btn btn-primary">
                                            Edit
                                        </a>
                                    </div>
                                </div>
                            </div>       
=======
                                            <img class="rounded-circle" alt="User Image" src="${sessionScope.user.avatar_url}">
                                        </a>
                                    </div>
                                    <div class="col ml-md-n2 profile-user-info">
                                        <!--<h6 class="text-muted">Link avatar</h6>-->
                                        <form action="changeavatar">
                                            <input type="file" name="file">
                                            <button class="btn btn-primary" type="submit">Save Changes</button>
                                        </form>
                                    </div>                                    
                                </div>
                            </div>
>>>>>>> .merge_file_a13372
                            <div class="profile-menu">
                                <ul class="nav nav-tabs nav-tabs-solid">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#per_details_tab">About</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#password_tab">Password</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content profile-tab-cont">
                                <div class="tab-pane fade show active" id="per_details_tab">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title d-flex justify-content-between">
                                                        <span>Personal Details</span>                                                        
                                                    </h5>
                                                    <div class="row">
                                                        <div class="col-md-10 col-lg-6">
<<<<<<< .merge_file_a04628
                                                            <form action="editprofile?action=editpersonalinfo" method="post">
=======
                                                            <form action="editpersonalinfo" method="post">
>>>>>>> .merge_file_a13372
                                                                <div class="form-group">
                                                                    <label>Name</label>
                                                                    <input type="text" class="form-control" name="name" value="${sessionScope.user.full_name}" required>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Email ID</label>
                                                                    <input type="email" class="form-control" name="email" value="${sessionScope.user.email}" disabled="true">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Mobile</label>
                                                                    <input type="number" class="mobile" value="${sessionScope.user.mobile}" name="mobile" required>
<<<<<<< .merge_file_a04628
                                                                </div>    
                                                                <p style="color: red;">${requestScope.error}</p>
=======
                                                                </div>
>>>>>>> .merge_file_a13372
                                                                <button class="btn btn-primary" type="submit">Save Changes</button>
                                                            </form>
                                                        </div>
                                                    </div>                                     
                                                </div>
                                            </div>
                                        </div>                                        
                                    </div>
                                </div>
                                <div id="password_tab" class="tab-pane fade">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Change Password</h5>
                                            <div class="row">
                                                <div class="col-md-10 col-lg-6">
                                                    <form action="changepassword" method="post">
                                                        <div class="form-group">
                                                            <label>Old Password</label>
                                                            <input type="password" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>New Password</label>
                                                            <input type="password" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Confirm Password</label>
                                                            <input type="password" class="form-control">
                                                        </div>
                                                        <button class="btn btn-primary" type="submit">Save Changes</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<<<<<<< .merge_file_a04628
            <%@include file="footer.jsp" %>
=======
>>>>>>> .merge_file_a13372
        </div>
        <script data-cfasync="false" src="../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
    <!-- Mirrored from preschool.dreamguystech.com/html-template/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:11:39 GMT -->
</html>
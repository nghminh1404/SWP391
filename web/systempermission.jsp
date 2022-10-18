<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from preschool.dreamguystech.com/html-template/edit-books.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:12:21 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - System Permission</title>

        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">

        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
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
            z-index: 1002;
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
        th{
            cursor: pointer;
        }

        .arrow {
            border: solid black;
            border-width: 0 3px 3px 0;
            display: inline-block;
            padding: 3px;
        }

        .right {
            transform: rotate(-45deg);
            -webkit-transform: rotate(-45deg);
        }

        .left {
            transform: rotate(135deg);
            -webkit-transform: rotate(135deg);
        }

        .up {
            transform: rotate(-135deg);
            -webkit-transform: rotate(-135deg);
        }

        .down {
            transform: rotate(45deg);
            -webkit-transform: rotate(45deg);
        }

        
    </style>
    <body onload="myFunction()">
        <div class="main-wrapper">
            
            <input type="number" name="update" value="${update}" hidden>
            <c:if test="${update == 1}">
                <div id="snackbar">Update Successfully!!!</div>
            </c:if>
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
                            <span class="user-img"><img class="rounded-circle" src="assets/img/profiles/avatar-01.jpg" width="31" alt="Ryan Taylor"></span>
                        </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm">
                                    <img src="assets/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle">
                                </div>
                                <div class="user-text">
                                    <h6>Ryan Taylor</h6>
                                    <p class="text-muted mb-0">Administrator</p>
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
                            <li class="">
                                <a href="web_contact"><i class="fas fa-holly-berry"></i> <span>Web Contact</span></a>
                            </li>
                            <li>
                                <a href="fees.html"><i class="fas fa-comment-dollar"></i> <span>Fees</span></a>
                            </li>
                            <li class="active">
                                <a href="/SWP/systempermission"><i class="fas fa-clipboard-list"></i> <span>System Permission</span></a>
                            </li>
                            <li>
                                <a href="event.html"><i class="fas fa-calendar-day"></i> <span>Events</span></a>
                            </li>
                            <li>
                                <a href="time-table.html"><i class="fas fa-table"></i> <span>Time Table</span></a>
                            </li>
                            <li class="">
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
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">System Permission</h3>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <form action="systempermission" method="post">
                                        <div class="row" style="padding-left: 10px; justify-content: space-around">
                                            <select name="role">
                                                <option value="0">--- All Roles ---</option>
                                                <c:forEach items="${roles}" var="r">
                                                    <c:if test="${role != r.key}">
                                                        <option value="${r.key}">${r.value}</option>
                                                    </c:if>
                                                    <c:if test="${role == r.key}">
                                                        <option value="${r.key}" selected>${r.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <select name="screen">
                                                <option value="0">--- All Screens ---</option>
                                                <c:forEach items="${screens}" var="s">
                                                    <c:if test="${screen != s.key}">
                                                        <option value="${s.key}">${s.value}</option>
                                                    </c:if>

                                                    <c:if test="${screen == s.key}">
                                                        <option value="${s.key}" selected>${s.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <div class="top-nav-search">
                                                <input id="myInput" style="color: black" type="search" class="form-control" placeholder="Search here" name="input_search" value="${input_search}">
                                            </div>
                                            <button class="btn" type="submit"><i class="fas fa-search"></i></button>
                                        </div>
                                    </form>
                                    <div class="table-responsive" style="padding-top: 20px;">
                                        <table id="myTable" class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th onclick="sortTable(0)"><i class="arrow down" style="float: right"></i>Role</th>
                                                    <th onclick="sortTable(1)"><i class="arrow down" style="float: right"></i>Screen</th>
                                                    <th>Can Get Data</th>
                                                    <th>Can Add</th>
                                                    <th>Can Delete</th>
                                                    <th>Can Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${permissionList}" var="pl">
                                                    <tr>
                                                        <td>${pl.role_name}</td>
                                                        <td>${pl.screen_name}</td>
                                                <form action="systempermission?screen_id=${pl.screen_id}&setting_id=${pl.setting_id}&col=get_all_data" method="post">
                                                    <c:if test="${pl.get_all_data == false}">
                                                        <td><button type="submit" name="get_all_data" class="btn btn-danger" value="0">Denied</button></td>
                                                    </c:if>
                                                    <c:if test="${pl.get_all_data == true}">
                                                        <td><button type="submit" name="get_all_data" class="btn btn-success" value="1">Accepted</button></td>
                                                    </c:if>
                                                </form>

                                                <form action="systempermission?screen_id=${pl.screen_id}&setting_id=${pl.setting_id}&col=can_add" method="post">
                                                    <c:if test="${pl.can_add == false}">
                                                        <td><button type="submit" name="can_add" class="btn btn-danger" value="0">Denied</button></td>
                                                    </c:if>
                                                    <c:if test="${pl.can_add == true}">
                                                        <td><button type="submit" name="can_add" class="btn btn-success" value="1">Accepted</button></td>
                                                    </c:if>
                                                </form>

                                                <form action="systempermission?screen_id=${pl.screen_id}&setting_id=${pl.setting_id}&col=can_delete" method="post">
                                                    <c:if test="${pl.can_delete == false}">
                                                        <td><button type="submit" name="can_delete" class="btn btn-danger" value="0">Denied</button></td>
                                                    </c:if>
                                                    <c:if test="${pl.can_delete == true}">
                                                        <td><button type="submit" name="can_delete" class="btn btn-success" value="1">Accepted</button></td>
                                                    </c:if>
                                                </form>

                                                <form action="systempermission?screen_id=${pl.screen_id}&setting_id=${pl.setting_id}&col=can_edit" method="post">
                                                    <c:if test="${pl.can_edit == false}">
                                                        <td><button type="submit" name="can_edit" class="btn btn-danger" value="0">Denied</button></td>
                                                    </c:if>
                                                    <c:if test="${pl.can_edit == true}">
                                                        <td><button type="submit" name="can_edit" class="btn btn-success" value="1">Accepted</button></td>
                                                    </c:if>
                                                </form>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate" style="padding-top: 20px; float: right">
                                        <ul class="pagination">
                                            <c:if test="${page == 1}">
                                                <li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous">
                                                    <a href="#" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page != 1}">
                                                <li class="paginate_button page-item previous" id="DataTables_Table_0_previous">
                                                    <a href="systempermission?page=${page-1}" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                                </li>
                                                <li class="paginate_button page-item">
                                                    <a href="systempermission?page=${page-1}" aria-controls="DataTables_Table_0" data-dt-idx="${page-1}" tabindex="0" class="page-link">${page-1}</a>
                                                </li>
                                            </c:if>

                                            <li class="paginate_button page-item active">
                                                <a href="systempermission?page=${page}" aria-controls="DataTables_Table_0" data-dt-idx="${page}" tabindex="0" class="page-link">${page}</a>
                                            </li>

                                            <c:if test="${page < end_page}">
                                                <li class="paginate_button page-item ">
                                                    <a href="systempermission?page=${page+1}" aria-controls="DataTables_Table_0" data-dt-idx="${page+1}" tabindex="0" class="page-link">${page+1}</a>
                                                </li>
                                                <li class="paginate_button page-item next" id="DataTables_Table_0_next">
                                                    <a href="systempermission?page=${page+1}" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0" class="page-link">Next</a>
                                                </li>
                                            </c:if>

                                            <c:if test="${page >= end_page}">
                                                <li class="paginate_button page-item next disabled" id="DataTables_Table_0_next">
                                                    <a href="#" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0" class="page-link">Next</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/js/script.js"></script>
        <script>
            function sortTable(n) {
                var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                table = document.getElementById("myTable");
                switching = true;
                //Set the sorting direction to ascending:
                dir = "asc";
                /*Make a loop that will continue until
                 no switching has been done:*/
                while (switching) {
                    //start by saying: no switching is done:
                    switching = false;
                    rows = table.rows;
                    /*Loop through all table rows (except the
                     first, which contains table headers):*/
                    for (i = 1; i < (rows.length - 1); i++) {
                        //start by saying there should be no switching:
                        shouldSwitch = false;
                        /*Get the two elements you want to compare,
                         one from current row and one from the next:*/
                        x = rows[i].getElementsByTagName("TD")[n];
                        y = rows[i + 1].getElementsByTagName("TD")[n];
                        /*check if the two rows should switch place,
                         based on the direction, asc or desc:*/
                        var element = document.getElementsByClassName("arrow")[n];
                        if (dir === "asc") {
                            element.classList.remove("up");
                            element.classList.add("down");
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                //if so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        } else if (dir === "desc") {
                            element.classList.remove("down");
                            element.classList.add("up");

                            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                //if so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        }
                    }
                    if (shouldSwitch) {
                        /*If a switch has been marked, make the switch
                         and mark that a switch has been done:*/
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                        //Each time a switch is done, increase this count by 1:
                        switchcount++;
                    } else {
                        /*If no switching has been done AND the direction is "asc",
                         set the direction to "desc" and run the while loop again.*/
                        if (switchcount === 0 && dir === "asc") {
                            dir = "desc";
                            switching = true;
                        }
                    }
                }
            }
            
function myFunction() {
  var x = document.getElementById("snackbar");
  x.className = "show";
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}

        </script>
    </body>

</html>
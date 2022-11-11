<%-- 
    Document   : UserlList
    Created on : Sep 23, 2022, 12:11:28 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Class List</title>
        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="../../assets/js/script.js" type="text/javascript"></script>
        <style>
            #changes {
                float:left;
                width: 50%
            }
            #frmSearch {
                float:right;

            }
        </style>
    </head>
    <body>
        <div class="main-wrapper">

<<<<<<< .merge_file_a14484
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
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="${sessionScope.user.avatar_url}">
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
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="${sessionScope.user.avatar_url}">
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
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="${sessionScope.user.avatar_url}">
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
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="${sessionScope.user.avatar_url}">
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
                            <a class="dropdown-item" href="login.jsp">Logout</a>
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
                            <!--                            <li class="submenu">
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
                                                        </li>-->
                            <li class="submenu">
                                <a href="#"><i class="fas fa-book-reader"></i> <span> Class</span> <span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="classlist">Class List</a></li>
                                    <li><a href="classadd">Class Add</a></li>
                                    <!--                                    <li><a href="edit-subject.html">Subject Edit</a></li>-->
                                </ul>
                            </li>
                            <!--                           <li class="menu-title">
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
                                                      <li class="active">
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
                            -->                        </ul>
                    </div>
                </div>
            </div>


>>>>>>> .merge_file_a16660
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">Class List</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Class list</li>
                                </ul>
                            </div>
                            <div class="col-auto text-right float-right ml-auto">
                                <a href="classadd" class="btn btn-primary"><i class="fas fa-plus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body">
                                    <div>
                                        <form  id= "changes" action="classfilter" method="GET">
                                            <select onchange="document.g" name="subject_id">
                                                <option value="-1">-- ALL SUBJECT --</option>
                                                <c:forEach items="${requestScope.subjects}" var="sj">
                                                    <option
                                                        <c:if test="${param.subject_id eq sj.subject_id}">
                                                            selected="selected"
                                                        </c:if>
                                                        value="${sj.subject_id}">${sj.subject_name}</option>
                                                </c:forEach>
                                            </select> 
                                            <select onchange="document.g" name="setting_id">
                                                <option value="-1">-- ALL TERM --</option>
                                                <c:forEach items="${requestScope.settings}" var="s">
                                                    <option
                                                        <c:if test="${param.setting_id eq s.setting_id}">
                                                            selected="selected"
                                                        </c:if>
                                                        value="${s.setting_id}">${s.setting_title}</option>
                                                </c:forEach>
                                            </select>
                                            <select onchange="document.g" name="trainer_id">
                                                <option value="-1">-- ALL TRAINER --</option>
                                                <c:forEach items="${requestScope.trainers}" var="t">
                                                    <option
                                                        <c:if test="${param.trainer_id eq t.user_id}">
                                                            selected="selected"
                                                        </c:if>
                                                        value="${t.user_id}">${t.full_name}</option>
                                                </c:forEach>
                                            </select>    
                                            <select onchange="document.g" name="supporter_id">
                                                <option value="-1">-- ALL SUPPORTER --</option>
                                                <c:forEach items="${requestScope.supporters}" var="sp">
                                                    <option
                                                        <c:if test="${param.supporter_id eq sp.user_id}">
                                                            selected="selected"
                                                        </c:if>
                                                        value="${sp.user_id}">${sp.full_name}</option>
                                                </c:forEach>
                                            </select> 
                                            <br>
                                            Status: <input 
                                                <c:if test="${param.status eq 'activate'}">
                                                    checked="checked"
                                                </c:if>
                                                type="radio" name="status" value= "activate" /> Activate
                                            <input type="radio"
                                                   <c:if test="${param.status eq 'deactivate'}">
                                                       checked="checked"
                                                   </c:if>
                                                   name="status" value="deactivate" /> Deactivate
                                            <input type="radio"
                                                   <c:if test="${param.status eq null or param.status eq 'both'}">
                                                       checked="checked"
                                                   </c:if>
                                                   name="status" value="both"/> Both
                                            <br/>
                                            <input type="submit" value="Search"/>

                                        </form>
                                        <form id = "frmSearch" action ="classsearch" method ="POST">
                                            <input type="text" name="keyword" class="form-control" placeholder="${param.keyword}" value="${param.keyword}">
                                            <button class="btn" type="submit" hidden ><i class="fas fa-search"></i></button>
                                        </form>                                       
                                    </div>

                                    <div class="table-responsive">
                                        <br>
                                        <form id= "frmUpdate" action ="classlist" method = "POST">
                                            <table class="table table-hover table-center mb-0 datatable">                                          
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Code</th>
                                                        <th>Subject code</th>
                                                        <th>Subject name</th>
                                                        <th>Term</th>
                                                        <th>Trainer</th>
                                                        <th>Supporter</th>
                                                        <th>Status</th>
                                                        <th class="text-right">Action</th>
                                                    </tr>
                                                </thead>
<<<<<<< .merge_file_a14484
                                                <tbody>
                                                    <c:forEach items= "${requestScope.classes}" var="u">
                                                        <tr>
                                                            <td>${u.class_id}</td>
                                                            <td> 
                                                                <h2 class="table-avatar">
                                                                    ${u.class_code}
                                                                </h2>
                                                            </td>
                                                            <td>${u.subject.subject_code}</td>
                                                            <td>${u.subject.subject_name}</td>
                                                            <td>${u.term_id.setting_title}</td>
                                                            <td>${u.trainer_id.full_name}</td>
                                                            <td>${u.supporter_id.full_name}</td>
                                                            <td>
                                                                <span class="badge badge-success"><c:if test="${u.status == true}"> Activate </c:if></span> 
                                                                <span class="badge badge-danger"><c:if test="${u.status == false}"> Deactivate </c:if></span>
                                                                </td>
                                                                <td>
                                                                    <a href="classdetail?id=${u.class_id}">View</a>                                                           

=======
                                            <tbody>
                                                <c:forEach items= "${requestScope.classes}" var="u">
                                                    <tr>
                                                        <td>${u.class_id}</td>
                                                        <td> 
                                                            <h2 class="table-avatar">
                                                                ${u.class_code}
                                                            </h2>
                                                        </td>
                                                        <td>${u.subject.subject_code}</td>
                                                        <td>${u.subject.subject_name}</td>
                                                        <td>${u.term_id.setting_title}</td>
                                                        <td>${u.trainer_id.full_name}</td>
                                                        <td>${u.supporter_id.full_name}</td>
                                                        <td>
                                                            <span class="badge badge-success"><c:if test="${u.status == true}"> Activate </c:if></span> 
                                                            <span class="badge badge-danger"><c:if test="${u.status == false}"> Deactivate </c:if></span>
                                                            </td>
                                                            <td>
                                                                <a href="classdetail?id=${u.class_id}">View</a>                                                           
                                                            
>>>>>>> .merge_file_a16660
                                                                <input hidden value ="${u.class_id}" type="text" class="form-control" name="class_id">
                                                                <input hidden value ="${sessionScope.user.user_id}" type="text" class="form-control" name="user">
                                                                <select name="statusupdate" onchange="document.getElementById('frmUpdate').submit()">
                                                                    <option <c:if test="${u.status == true}">selected</c:if> value="1">
                                                                            Activate
                                                                        </option>
                                                                        <option <c:if test="${u.status == false}">selected</c:if> value="0">
                                                                            Deactivate
                                                                        </option>                                 
                                                                    </select>
<<<<<<< .merge_file_a14484

                                                                </td> 
                                                            </tr>
                                                    </c:forEach>  
                                                    <!--                                           <td class="text-right">
                                                                                                    <div class="actions">
                                                                                                        <a href="edit-books.html" class="btn btn-sm bg-success-light mr-2">
                                                                                                            <i class="fas fa-pen"></i>
                                                                                                        </a>
                                                                                                        <a href="#" class="btn btn-sm bg-danger-light">
                                                                                                            <i class="fas fa-trash"></i>
                                                                                                        </a>
                                                                                                    </div>
                                                                                                </td>-->                                          
                                                </tbody></form>
                                        </table>
=======
                                                                
                                                            </td> 
                                                        </tr>
                                                </c:forEach>  
                                                <!--                                           <td class="text-right">
                                                                                                <div class="actions">
                                                                                                    <a href="edit-books.html" class="btn btn-sm bg-success-light mr-2">
                                                                                                        <i class="fas fa-pen"></i>
                                                                                                    </a>
                                                                                                    <a href="#" class="btn btn-sm bg-danger-light">
                                                                                                        <i class="fas fa-trash"></i>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </td>-->                                          
                                            </tbody></form>
                                            </table>
>>>>>>> .merge_file_a16660
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <footer>
                    <p>Copyright © 2020 Dreamguys.</p>
                </footer>

            </div>
<<<<<<< .merge_file_a14484
            <%@include file="footer.jsp" %>
=======

>>>>>>> .merge_file_a16660
        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/plugins/datatables/datatables.min.js"></script>

        <script src="assets/js/script.js"></script>
        <script>
<<<<<<< .merge_file_a14484
                                                                    function changeStatus(id) {
                                                                        var changed = document.getElementById("status_change_" + id);

                                                                        const input = document.createElement("input");
                                                                        input.setAttribute("name", "status_change_check");
                                                                        input.setAttribute("type", "hidden");
                                                                        input.setAttribute("value", id);

                                                                        changed.appendChild(input);

                                                                        document.getElementById("frmUpdate").submit();
                                                                    }
=======
            function changeStatus(id) {
                                                    var changed = document.getElementById("status_change_" + id);

                                                    const input = document.createElement("input");
                                                    input.setAttribute("name", "status_change_check");
                                                    input.setAttribute("type", "hidden");
                                                    input.setAttribute("value", id);

                                                    changed.appendChild(input);

                                                    document.getElementById("frmUpdate").submit();
                                                }
>>>>>>> .merge_file_a16660
        </script>
    </body>
</html>

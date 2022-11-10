<%-- 
    Document   : demodashboard
    Created on : Sep 27, 2022, 9:41:04 AM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .submenu a:visited {
        color: #18aefa;
    }

    .submenu a:link {
        color: #6f6f6f;
    }
</style>

<div class="header">
    <div class="header-left">
        <a href="demodashboard.html" class="logo">
            <img src="assets/img/logo.png" alt="Logo">
        </a>
        <a href="demodashboard.html" class="logo logo-small">
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
                <span class="user-img"><img class="rounded-circle" src="${sessionScope.user.avatar_url}" width="31" height="31" style="object-fit: cover;" alt="Ryan Taylor"></span>
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
                <a class="dropdown-item" href="profile">Change password</a>
                <a class="dropdown-item" href="index.html">Logout</a>
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
                <li class="submenu active">
                    <a href="#"><i class="fas fa-user-graduate"></i> <span> Dashboard</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="demodashboard.html" class="active">Admin Dashboard</a></li>
                        <li><a href="teacher-dashboard.html">Teacher Dashboard</a></li>
                        <li><a href="student-dashboard.html">Student Dashboard</a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="classes"><i class="fas fa-user-graduate"></i> <span> Class</span> <span class="menu-arrow"></span></a>                    
                    <ul>
                        <li><a href="classes">Class List</a></li>
                        <li><a href="classdetail">Class Details</a></li>                        
                    </ul>
                </li>
                <li class="submenu">
                    <a href="classsetting"><i class="fas fa-chalkboard-teacher"></i> <span>Class Setting</span> <span class="menu-arrow"></span></a>                    
                    <ul>
                        <li><a href="classsetting">Class Setting List</a></li>
                        <li><a href="classsettingdetail">Class Setting Details</a></li>                        
                    </ul>
                </li>
                <li class="submenu">
                    <a href="milestone"><i class="fas fa-book-reader"></i> <span> Milestone</span> <span class="menu-arrow"></span></a>                    
                    <ul>
                        <li><a href="milestone">Milestone List</a></li>
                        <li><a href="milestonedetail">Milestone Details</a></li>                        
                    </ul>
                </li>
                <li class="submenu">
                    <a href="schedule"><i class="fas fa-building"></i> <span> Schedule</span> <span class="menu-arrow"></span></a>                    
                    <ul>
                        <li><a href="schedule">Schedule List</a></li>
                        <li><a href="scheduledetail">Schedule Details</a></li>                        
                    </ul>
                </li>
                <li class="submenu">
                    <a href="setting"><i class="fas fa-building"></i> <span> Setting</span> <span class="menu-arrow"></span></a>                    
                    <ul>
                        <li><a href="setting">Setting List</a></li>
                        <li><a href="settingdetail">Setting Details</a></li>                        
                    </ul>
                </li>                            
                <li class="submenu">
                    <a href="team"><i class="fas fa-building"></i> <span> Team</span> <span class="menu-arrow"></span></a>                    
                    <ul>
                        <li><a href="team">Team List</a></li>
                        <li><a href="teamdetail">Team Details</a></li>                        
                    </ul>
                </li>
                <li class="submenu">
                    <a href="webcontact"><i class="fas fa-building"></i> <span> Web Contact</span> <span class="menu-arrow"></span></a>                    
                    <ul>
                        <li><a href="web_contact">web Contact List</a></li>
                        <li><a href="web_contact_detail">Web Contact Details</a></li>                        
                    </ul>
                </li>
                <li class="submenu">
                    <a href="systempermission"><i class="fas fa-building"></i> <span> Permission</span> <span class="menu-arrow"></span></a>                    
                    <ul>
                        <li><a href="systempermission">Permission List</a></li>
                        <li><a href="permissiondetail">Class Details</a></li>                        
                    </ul>
                </li>
                <li class="submenu">
                    <a href="userlist"><i class="fas fa-building"></i> <span> User Management</span> <span class="menu-arrow"></span></a>                    
                    <ul>
                        <li><a href="userlist">User List</a></li>
                        <li><a href="userdetail">User Details</a></li>                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>             

<script>
    var menuItems = document.querySelectorAll('li a ul li a');
    var changeneed = document.getElementsByClassName("submenu");
    var clicked = document.getElementsByClassName("active");
    for (var i = 0; i < menuItems.length - 1; i++) {
        var menuItem = menuItems[i];
        menuItem.onclick = function (event) {
            for (var i = 0; i < clicked.length-1; i++){
                clicked[i].classList.remove("active");
            }
            menuItem.classList.add("active");
            changeneed[i].classList.add("active");
        };
    }
</script>
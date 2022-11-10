<%-- 
    Document   : profile
    Created on : Sep 25, 2022, 10:39:40 AM
    Author     : Hp
--%>

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
            <%@include file="leftmenu.jsp" %>


            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row">
                            <div class="col">
                                <h3 class="page-title">Member</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="team">Team</a></li>
                                    <li class="breadcrumb-item active">Member</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="profile-header">
                                <div class="row align-items-center">                                    
                                    <div class="col ml-md-n2 profile-user-info">
                                        <h4 class="user-name mb-0">${team.team_code}</h4>
                                        <h6 class="text-muted">${team.topic_name}</h6>                                       
                                    </div>                                                                        
                                    <div class="col-auto profile-btn">
                                        <a href="teamdetail?action=clone&&sid=${team.team_id}" class="btn btn-primary">
                                            Clone
                                        </a>
                                    </div>
                                </div>
                            </div>                            
                            <div class="tab-content profile-tab-cont">
                                <div class="tab-pane fade show active" id="per_details_tab">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title d-flex justify-content-between">
                                                        <span>Member Details</span>                                          
                                                        <a class="edit-link" href="editprofile"><i class="far fa-edit mr-1"></i>Edit</a>
                                                    </h5>
                                                    <c:forEach items="${member}" var="m">
                                                        <div class="row">
                                                            <p class="col-sm-3 text-muted text-sm-left mb-0 mb-sm-3">${m.getUser().getFull_name()}</p>
                                                            <c:if test="${m.is_leader}"><b>  (Leader)</b></c:if>
                                                            </div>   
                                                    </c:forEach>                                                                                         
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
            <%@include file="footer.jsp" %>
        </div>
        <script data-cfasync="false" src="../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
    <!-- Mirrored from preschool.dreamguystech.com/html-template/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:11:39 GMT -->
</html>
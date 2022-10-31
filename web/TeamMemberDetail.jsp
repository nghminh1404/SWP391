<%-- 
    Document   : Class SettingDetail
    Created on : Sep 25, 2022, 8:30:46 PM
    Author     : kieut
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from preschool.dreamguystech.com/html-template/edit-books.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:12:21 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Books</title>

        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/teams2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">

        <link rel="stylesheet" href="assets/plugins/bootstrap/teams/bootstrap.min.teams">

        <link rel="stylesheet" href="assets/plugins/fontawesome/teams/fontawesome.min.teams">
        <link rel="stylesheet" href="assets/plugins/fontawesome/teams/all.min.teams">

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
        </style>
        <link rel="stylesheet" href="assets/teams/style.teams">
    </head>
    <body onload="myFunction()">
        <input type="number" name="update" value="${update}" hidden>
        <c:if test="${update == 1}">
            <div id="snackbar">Update Successfully!!!</div>
        </c:if>
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
                                                            <c:if test="${m.is_leader}"><b class="col-sm-3 text-sm-right">Leader:</b></c:if>
                                                            <p class="col-sm-3 text-muted text-sm-left mb-0 mb-sm-3">${m.getUser().getFull_name()}</p>
                                                            <select name="member">
                                                                <option value="first">text1</option>
                                                                <option value="second">text2</option>
                                                                <option value="third">text3</option>
                                                            </select>

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
            

        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/js/script.js"></script>
        <script>
        function myFunction() {
            var x = document.getElementById("snackbar");
            x.className = "show";
            setTimeout(function () {
                x.className = x.className.replace("show", "");
            }, 3000);
        }
        </script>
    </body>

    <!-- Mirrored from preschool.dreamguystech.com/html-template/edit-books.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:12:21 GMT -->
</html>
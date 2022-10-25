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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">

        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

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
        <link rel="stylesheet" href="assets/css/style.css">
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
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">Schedule Detail</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="schedule">Schedule</a></li>
                                    <li class="breadcrumb-item active">Schedule Detail</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <c:choose>                                                                
                                        <c:when test="${add eq 'true'}">
                                            <form action="scheduledetail?action=add" method="post">
                                        </c:when>   
                                        <c:otherwise>
                                            <form action="scheduledetail?action=update&&sid=${sdetail.schedule_id}" method="post">
                                        </c:otherwise>
                                    </c:choose>
                                            <div class="row">
                                                <div class="col-12">
                                                    <h5 class="form-title"><span>Schedule</span></h5>
                                                </div>                                            
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Slot</label>
                                                        <select name="slot">
                                                            <c:forEach begin="1" end="6" var="slot">
                                                                <c:choose>                                                                
                                                                    <c:when test="${sdetail.slot_id == slot}" >
                                                                        <option selected value="${slot}">${slot}</option>
                                                                    </c:when>   
                                                                    <c:otherwise>
                                                                        <option value="${slot}">${slot}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach> 
                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Class</label>

                                                        <select name="classmodel">                                                        
                                                            <c:forEach items="${classlist}" var="class1">
                                                                <c:choose>                                                                
                                                                    <c:when test="${sdetail.class_id == class1.class_id}" >
                                                                        <option selected value="${class1.class_id}">${class1.class_code}</option>
                                                                    </c:when>   
                                                                    <c:otherwise>
                                                                        <option value="${class1.class_id}">${class1.class_code}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>                                            
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Room</label>
                                                        <input type="text" name="room" class="form-control" value="${sdetail.room_id}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Training Date</label>                                                             
                                                        <c:choose>                                                                
                                                            <c:when test="${add eq 'true'}">
                                                                <%
                                                                    SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd");
                                                                    String date = dateformat.format(new Date());
                                                                %>
                                                                <input type="date" class="form-control" name="date" value="<%=date.trim()%>">
                                                            </c:when>   
                                                            <c:otherwise>
                                                                <input type="date" class="form-control" name="date" value="${sdetail.training_date}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>

                                                <c:if test="${add != 'true'}">                                                    
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label>From Time</label>
                                                            <input type="text" class="form-control" value="${sdetail.from_time}" disabled>                                                    
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label>To Time</label>
                                                            <input type="text" class="form-control" value="${sdetail.to_time}" disabled> 
                                                        </div>
                                                    </div>
                                                </c:if>   
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label>Status</label>
                                                            <select class="form-control" name="status">
                                                                <c:choose>                                                                                                                                
                                                                    <c:when test="${sdetail.status eq false}" >
                                                                        <option>Active</option>
                                                                        <option selected>Deactive</option>
                                                                    </c:when>   

                                                                    <c:otherwise>
                                                                        <option selected>Active</option>
                                                                        <option>Deactive</option>
                                                                    </c:otherwise>
                                                                </c:choose>                                                            
                                                            </select>
                                                        </div>
                                                    </div>                                                
                                                    <div class="col-12">
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>
                                            </div>
                                        </form>
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
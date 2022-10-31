<%-- 
    Document   : ClassSetting
    Created on : Oct 17, 2022, 11:26:20 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from preschool.dreamguystech.com/html-template/library.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:11:58 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Schedule</title>

        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">

        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <script type="text/javascript">
            function sortDisplay() {

            }
        </script>
        <script src="https://kit.fontawesome.com/4d809b9711.js" crossorigin="anonymous"></script>
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

            .fa-solid {
                font-size: 13px;
                display: none;
                color: #bdbebf;
            }

            .fa-arrow-up-long{
                padding-left: 10px;
            }

            .table .th:hover .fa-solid {
                display: block;
            }
        </style>
    </head>
    <body onload="myFunction()">        
        <c:if test="${delete == 1}">
            <div id="snackbar1">Delete Successfully!!!</div>
        </c:if>        
        <c:if test="${insert == 1}">
            <div id="snackbar2">Insert Successfully!!!</div>
        </c:if>

        <div class="main-wrapper">

            <%@include file="leftmenu.jsp" %>


            <div class="page-wrapper">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">Schedule List</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Schedule List</li>
                                </ul>
                            </div>
                            <div class="col-auto text-right float-right ml-auto">
                                <a href="#" class="btn btn-outline-primary mr-2"><i class="fas fa-download"></i> Download</a>
                                <a href="scheduledetail?action=add" class="btn btn-primary"><i class="fas fa-plus"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body">
                                    <div style="background-color: #f7f7f7; padding: 25px; margin-bottom: 10px;">
                                        <form action="schedule" method="post" class="row">
                                            <div class="col-sm-5" style="margin-right: 0;">
                                                Class:<select name="classmodel" style="width: 100%;">
                                                    <option value="All">All</option>    
                                                    <c:forEach items="${classlist}" var="c">
                                                        <option value="${c.class_id}">${c.class_code}</option>
                                                    </c:forEach>                                            
                                                </select>  
                                            </div>              
                                            <div class="col-sm-5">
                                                Status: <select name = "status" style="width: 100%;">
                                                    <option value="All">All</option>
                                                    <option value="ongoing">Ongoing</option>
                                                    <option value="closed">Closed</option>                                                
                                                </select>                                            
                                            </div>

                                            <br/>                                            
                                            <input class="col-sm-2" type="submit" value="Filter" style="background-color: #FFBC53; border: 1px solid #FFBC53; color: white; padding: 10px; height: 27 !important;" />
                                        </form>
                                    </div>

                                    <div class="table-responsive">                                     
                                        <table class="table table-hover table-center mb-0 datatable">
                                            <thead>
                                                <tr>                                                    
                                                    <th>Class<a href=""><i class="fa-solid fa-arrow-up-long"></i><i class="fa-solid fa-arrow-down-long"></i></a></th>
                                                    <th>Slot<a href=""><i class="fa-solid fa-arrow-up-long"></i><i class="fa-solid fa-arrow-down-long"></i></a></th>
                                                    <th>Room<a href=""><i class="fa-solid fa-arrow-up-long"></i><i class="fa-solid fa-arrow-down-long"></i></a></th>                                                    
                                                    <th>Date<a href=""><i class="fa-solid fa-arrow-up-long"></i><i class="fa-solid fa-arrow-down-long"></i></a></th>
                                                    <th>Time<a href=""><i class="fa-solid fa-arrow-up-long"></i><i class="fa-solid fa-arrow-down-long"></i></a></th>
                                                    <th>Status<a href=""><i class="fa-solid fa-arrow-up-long"></i><i class="fa-solid fa-arrow-down-long"></i></a></th>
                                                    <th>Attendance<a href=""><i class="fa-solid fa-arrow-up-long"></i><i class="fa-solid fa-arrow-down-long"></i></a></th>
                                                    <th class="text-right">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody class="content" id="content">
                                                <c:forEach items="${schedulelist}" var="cs">
                                                    <tr>                                                                                                                                                    
                                                        <td>${cs.searchByID().getClass_code()}</td>
                                                        <td>${cs.slot_id}</td>                                                        
                                                        <td>${cs.room_id}</td>
                                                        <td>${cs.training_date}</td>
                                                        <td>${cs.from_time} - ${cs.to_time}</td>
                                                        <td>
                                                            <c:if test="${cs.status eq true}">
                                                                <span class="badge badge-success">Ongoing</span>
                                                            </c:if>
                                                            <c:if test="${cs.status eq false}">
                                                                <span class="badge badge-danger">Closed</span>
                                                            </c:if>
                                                        </td>
                                                        <td><a href="">Open</a></td>
                                                        <td class="text-right">
                                                            <div class="actions">
                                                                <a href="scheduledetail?action=update&&sid=${cs.schedule_id}" class="btn btn-sm bg-success-light mr-2">
                                                                    <i class="fas fa-pen"></i>
                                                                </a>
                                                                <a href="scheduledetail?action=delete&&sid=${cs.schedule_id}" class="btn btn-sm bg-danger-light">
                                                                    <i class="fas fa-trash"></i>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">                                    
                                    <div class="col-sm-12 col-md-7">
                                        <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
                                            <ul class="pagination">
                                                <c:choose>
                                                    <c:when test="${curpage == 1}">
                                                        <li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous">
                                                            <a href="schedule?curpage=${curpage-1}" aria-controls="DataTables_Table_0" data-dt-idx="${curpage-1}" tabindex="0" class="page-link">Previous</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="paginate_button page-item previous" id="DataTables_Table_0_previous">
                                                            <a href="schedule?curpage=${curpage-1}" aria-controls="DataTables_Table_0" data-dt-idx="${curpage-1}" tabindex="0" class="page-link">Previous</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:forEach begin="1" end="${page}" var="i" step="1">
                                                    <c:choose>
                                                        <c:when test="${curpage == i}">
                                                            <li class="paginate_button page-item active">
                                                                <a href="schedule?curpage=${i}" aria-controls="DataTables_Table_0" data-dt-idx="${i}" tabindex="0" class="page-link">${i}</a>
                                                            </li>                       
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li class="paginate_button page-item active">
                                                                <a href="schedule?curpage=${i}" aria-controls="DataTables_Table_0" data-dt-idx="${i}" tabindex="0" class="page-link" style="color:#FFBC53; background-color:#fff;">${i}</a>
                                                            </li>                       
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:choose>
                                                    <c:when test="${curpage == page}">
                                                        <li class="paginate_button page-item next disabled" id="DataTables_Table_0_next">
                                                            <a href="schedule?curpage=${curpage+1}" aria-controls="DataTables_Table_0" data-dt-idx="${curpage+1}" tabindex="0" class="page-link">Next</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="paginate_button page-item next" id="DataTables_Table_0_next">
                                                            <a href="schedule?curpage=${curpage+1}" aria-controls="DataTables_Table_0" data-dt-idx="${curpage+1}" tabindex="0" class="page-link">Next</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </div>
        <%--<%@include file="footer.jsp" %>--%>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/plugins/datatables/datatables.min.js"></script>

        <script src="assets/js/script.js"></script>
        <script>
            function myFunction() {
                var x = document.getElementById("snackbar1");
                x.className = "show";
                setTimeout(function () {
                    x.className = x.className.replace("show", "");
                }, 3000);
            }
            function myFunction2() {
                var x = document.getElementById("snackbar2");
                x.className = "show";
                setTimeout(function () {
                    x.className = x.className.replace("show", "");
                }, 3000);
            }
            function myFunction2() {
                var object = document.getElementsByTagName("th");
                object.addEventListener('mousemove', function (e) {
                    document.getElementsByClassName("fa-solid").style.display = "block";
                }
            }
        </script>
    </body>

    <!-- Mirrored from preschool.dreamguystech.com/html-template/library.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:11:58 GMT -->
</html>
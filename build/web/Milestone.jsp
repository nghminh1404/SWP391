<%-- 
    Document   : ClassSetting
    Created on : Oct 17, 2022, 11:26:20 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from preschool.dreamguystech.com/html-template/library.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:11:58 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Milestone</title>

        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">

        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <script type="text/javascript">
            function defaultValue() {
                document.getElementById("fromDate").defaultValue = "2020-01-01";
                document.getElementById("toDate").defaultValue = "2023-01-01";
            }
            function minDate(param) {
                document.getElementById("toDate").min = param;
            }
        </script>
    </head>
    <body>

        <div class="main-wrapper">

            <%@include file="leftmenu.jsp" %>
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">Milestone List</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Milestone List</li>
                                </ul>
                            </div>
                            <div class="col-auto text-right float-right ml-auto">
                                <a href="#" class="btn btn-outline-primary mr-2"><i class="fas fa-download"></i> Download</a>
                                <a href="add-books.html" class="btn btn-primary"><i class="fas fa-plus"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body">
                                    <div style="background-color: #f7f7f7; padding: 25px; margin-bottom: 10px;">
                                        <form action="milestone" method="post">
                                            Class:<select name="classmodel">
                                                <option value="All">All</option>    
                                                <c:forEach items="${classlist}" var="class1">
                                                    <option value="${class1.class_id}">${class1.class_code}</option>
                                                </c:forEach>                                            
                                            </select>       
                                            <br/>
                                            Status: 
                                            <input type="radio" name="status" value="active">  Active
                                            <input type="radio" name="status" value="deactive">  Deactive
                                            <input type="radio" name="status" value="both" checked="true">  Both
                                            <br/>
                                            Title: <input name ="title" type="search" placeholder="Title">
                                            <br/>
                                            <!--                                            From Date: <input type="date" name="fromdate" id="fromdate" min="2020-01-01" onchange="minDate(this)">
                                                                                        To Date: <input type="date" name="todate" id="todate" min="2020-01-01">-->
                                            <input type="submit" value="Search" style="float: right; background-color: #FFBC53; border: 1px solid #FFBC53; color: white; padding: 10px; transform: translateY(-50%);" />
                                        </form>
                                    </div>

                                    <div class="table-responsive">                                     
                                        <table class="table table-hover table-center mb-0 datatable">
                                            <thead>
                                                <tr>                                                    
                                                    <th>Assignment</th>
                                                    <th>Class</th>
                                                    <th>Title</th>                                                    
                                                    <th>Date</th>
                                                    <th>Status</th>
                                                    <th class="text-right">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody class="content" id="content">
                                                <c:forEach items="${milestonelist}" var="cs">
                                                    <tr>                                                        
                                                        <td>
                                                            ${cs.ass_id}                                                            
                                                        </td>                                                       
                                                        <td>${cs.searchByID().getClass_code()}</td>
                                                        <td>${cs.title}</td>                                                        
                                                        <td>${cs.from_date} to ${cs.to_date}</td>
                                                        <td>
                                                            <c:if test="${cs.status eq true}">
                                                                <span class="badge badge-success">Active</span>
                                                            </c:if>
                                                            <c:if test="${cs.status eq false}">
                                                                <span class="badge badge-danger">Deactive</span>
                                                            </c:if>
                                                        </td>
                                                        <td class="text-right">
                                                            <div class="actions">
                                                                <a href="milestonedetail?csid=${cs.milestone_id}" class="btn btn-sm bg-success-light mr-2">
                                                                    <i class="fas fa-pen"></i>
                                                                </a>
                                                                <a href="milestonedelete?csid=${cs.milestone_id}" class="btn btn-sm bg-danger-light">
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
                                                            <a href="milestone?curpage=${curpage-1}" aria-controls="DataTables_Table_0" data-dt-idx="${curpage-1}" tabindex="0" class="page-link">Previous</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="paginate_button page-item previous" id="DataTables_Table_0_previous">
                                                            <a href="milestone?curpage=${curpage-1}" aria-controls="DataTables_Table_0" data-dt-idx="${curpage-1}" tabindex="0" class="page-link">Previous</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:forEach begin="1" end="${page}" var="i" step="1">
                                                    <c:choose>
                                                        <c:when test="${curpage == i}">
                                                            <li class="paginate_button page-item active">
                                                                <a href="milestone?curpage=${i}" aria-controls="DataTables_Table_0" data-dt-idx="${i}" tabindex="0" class="page-link">${i}</a>
                                                            </li>                       
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li class="paginate_button page-item active">
                                                                <a href="milestone?curpage=${i}" aria-controls="DataTables_Table_0" data-dt-idx="${i}" tabindex="0" class="page-link" style="color:#FFBC53; background-color:#fff;">${i}</a>
                                                            </li>                       
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:choose>
                                                    <c:when test="${curpage == page}">
                                                        <li class="paginate_button page-item next disabled" id="DataTables_Table_0_next">
                                                            <a href="milestone?curpage=${curpage+1}" aria-controls="DataTables_Table_0" data-dt-idx="${curpage+1}" tabindex="0" class="page-link">Next</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="paginate_button page-item next" id="DataTables_Table_0_next">
                                                            <a href="milestone?curpage=${curpage+1}" aria-controls="DataTables_Table_0" data-dt-idx="${curpage+1}" tabindex="0" class="page-link">Next</a>
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
            <%@include file="footer.jsp" %>
        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/plugins/datatables/datatables.min.js"></script>

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

    <!-- Mirrored from preschool.dreamguystech.com/html-template/library.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:11:58 GMT -->
</html>
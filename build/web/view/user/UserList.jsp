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
        <title>User List</title>
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

            <%@include file="leftmenu.jsp" %>
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">User List</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">User list</li>
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
                                    <div>
                                        <form  id= "changes" action="filter" method="GET">
                                            Role: <select onchange="document.g" name="setting_id">
                                                <option value="-1">------ALL------</option>
                                                <c:forEach items="${requestScope.settings}" var="s">
                                                    <option
                                                        <c:if test="${param.setting_id eq s.setting_id}">
                                                            selected="selected"
                                                        </c:if>
                                                        value="${s.setting_id}">${s.setting_title}</option>
                                                </c:forEach>
                                            </select> <br/>
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
                                        <form id = "frmSearch" action ="usersearch" method ="POST">
                                            <input type="text" name="keyword" class="form-control" placeholder="Search here">
                                            <button class="btn" type="submit" hidden><i class="fas fa-search"></i></button>
                                        </form>                                       
                                    </div>

                                    <div class="table-responsive">
                                        <br>
                                        <table class="table table-hover table-center mb-0 datatable">                                          
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Mobile</th>
                                                    <th>Role</th>
                                                    <th>Status</th>
                                                    <th class="text-right">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items= "${requestScope.users}" var="u">
                                                    <tr>
                                                        <td>${u.user_id}</td>
                                                        <td> 
                                                            <h2 class="table-avatar">
                                                                ${u.full_name}
                                                            </h2>
                                                        </td>
                                                        <td>${u.email}</td>
                                                        <td>${u.mobile}</td>
                                                        <td>${u.setting.setting_title}</td>
                                                        <td>
                                                            <span class="badge badge-success"><c:if test="${u.status == true}"> Activate </c:if></span> 
                                                            <span class="badge badge-danger"><c:if test="${u.status == false}"> Deactivate </c:if></span>
                                                            </td>
                                                            <td>
                                                                <a href="userdetail?id=${u.user_id}">View</a>
                                                            <!-- <a href="#">Edit</a></td>-->  
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
                                            </tbody>
                                        </table>
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
            <%@include file="footer.jsp" %>
        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/plugins/datatables/datatables.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>

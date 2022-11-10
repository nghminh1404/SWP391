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
        th{
            cursor: pointer;
        }
    </style>
    <body>

        <div class="main-wrapper">

            <%@include file="leftmenu.jsp" %>
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
                                                <input id="myInput" style="color: black" type="search" class="form-control" placeholder="Search here">
                                            </div>
                                            <button class="btn" type="submit"><i class="fas fa-search"></i></button>
                                        </div>
                                    </form>
                                    <div class="table-responsive" style="padding-top: 20px;">
                                        <table id="myTable" class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th onclick="sortTable(0)">Role</th>
                                                    <th onclick="sortTable(1)">Screen</th>
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
                                                                    if (dir === "asc") {
                                                                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                                                            //if so, mark as a switch and break the loop:
                                                                            shouldSwitch = true;
                                                                            break;
                                                                        }
                                                                    } else if (dir === "desc") {
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
        </script>
    </body>

</html>
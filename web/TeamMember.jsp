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
        <title>Preskool - Team Member</title>

        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">

        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

        <link rel="stylesheet" href="assets/css/style.css">        
        <script src="https://kit.fontawesome.com/4d809b9711.js" crossorigin="anonymous"></script>
        <style>

            #insert-member-form{
                display: none;
            }
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

            .custom-select {
                position: relative;
                font-family: Arial;
            }

            .custom-select select {
                display: none; /*hide original SELECT element:*/
            }

            /*style the arrow inside the select element:*/
            .select-selected:after {
                position: absolute;
                content: "";
                top: 14px;
                right: 10px;
                width: 0;
                height: 0;
                border: 6px solid transparent;
                border-color: #fff transparent transparent transparent;
            }

            /*point the arrow upwards when the select box is open (active):*/
            .select-selected.select-arrow-active:after {
                border-color: transparent transparent #fff transparent;
                top: 7px;
            }

            /*style the items (options), including the selected item:*/
            .select-items div,.select-selected {
                padding: 8px 16px;
                border: 1px solid transparent;
                border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
                cursor: pointer;
                user-select: none;
            }

            div.select-selected{
                padding: 0 !important;
                border: none;
            }

            /*style items (options):*/
            .select-items {
                position: absolute;
                height: 300px;
                overflow: scroll;
                background-color: white;
                top: 100%;
                left: 0;
                right: 0;
                z-index: 99;
            }

            /*hide the items when the select box is closed:*/
            .select-hide {
                display: none;
            }

            .select-items div:hover, .same-as-selected {
                background-color: rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body onload="myFunction()">        
        <c:if test="${delete == 1}">
            <div id="snackbar">Delete Successfully!!!</div>
        </c:if>        


        <div class="main-wrapper">

            <%@include file="leftmenu.jsp" %>


            <div class="page-wrapper">
                <div class="content container-fluid">

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
                    <br>
                    <div class="col-auto ml-auto">                                
                        <button class="btn btn-primary" style="background-color: #18aefa !important; border: none;" id="insert-member-btn" onclick="myFunction2()">Add member</button>                        
                    </div>
                    <div id="insert-member-form">
                        <form action="teammember?tid=${team.team_id}" method="post" class="row" style="padding-left: 30px;">
                            <div class="custom-select col-sm-4" style="width:200px;">
                                <select name="member">
                                    <option value="0">Select member:</option>
                                    <c:forEach items="${userlist}" var="u">
                                        <option value="${u.user_id}">${u.full_name}</option>
                                    </c:forEach>                                    
                                </select>
                            </div>
                            <div class="col-sm-4" style="padding-top:10px;">

                                <c:if test="${leader == '1'}">
                                    <input type="radio" name="role" value="leader" disabled> Leader
                                </c:if>
                                <c:if test="${leader == '0'}">
                                    <input type="radio" name="role" value="leader"> Leader
                                </c:if>

                                <input type="radio" name="role" value="member" checked> Member
                            </div>
                            <div class="col-auto profile-btn col-sm-4">                                
                                <input type="submit" name="name" value="Save" class="btn btn-primary">
                            </div>
                        </form>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body">                                    
                                    <div class="table-responsive">                                     
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>                                                    
                                                    <th>Role<a href=""><i class="fa-solid fa-arrow-up-long"></i><i class="fa-solid fa-arrow-down-long"></i></a></th>
                                                    <th>Name<a href=""><i class="fa-solid fa-arrow-up-long"></i><i class="fa-solid fa-arrow-down-long"></i></a></th>                                                    
                                                    <th class="text-right">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody class="content" id="content">
                                                <c:forEach items="${member}" var="m">

                                                    <tr>             
                                                        <c:choose>
                                                            <c:when test="${m.is_leader}">
                                                                <td style="color: red;">Leader</td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td>Member</td>
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <td>${m.getUser().getFull_name()}</td>                                                                                                                
                                                        <td class="text-right">
                                                            <div class="actions">                                                                
                                                                <a style="background-color: #18aefa !important;" href="teammember?action=delete&&tid=${team.team_id}&&mid=${m.user_id}" class="btn btn-sm bg-danger-light">
                                                                    Remove member
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <%@include file="footer.jsp" %>
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
                                var x = document.getElementById("snackbar");
                                var insertBtn = document.getElementById("insert-member-btn");
                                x.className = "show";
                                setTimeout(function () {
                                    x.className = x.className.replace("show", "");
                                }, 3000);
                                var insertForm = document.getElementById("insert-member-form");

                                insertBtn.style.display = "block";
                                insertForm.style.display = "none";
                            }
                            function myFunction2() {
                                var insertBtn = document.getElementById("insert-member-btn");
                                var insertForm = document.getElementById("insert-member-form");

                                insertBtn.style.display = "none";
                                insertForm.style.display = "block";
                            }

        </script>
        <script>
            var x, i, j, l, ll, selElmnt, a, b, c;
            /*look for any elements with the class "custom-select":*/
            x = document.getElementsByClassName("custom-select");
            l = x.length;
            for (i = 0; i < l; i++) {
                selElmnt = x[i].getElementsByTagName("select")[0];
                ll = selElmnt.length;
                /*for each element, create a new DIV that will act as the selected item:*/
                a = document.createElement("DIV");
                a.setAttribute("class", "select-selected");
                a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
                x[i].appendChild(a);
                /*for each element, create a new DIV that will contain the option list:*/
                b = document.createElement("DIV");
                b.setAttribute("class", "select-items select-hide");
                for (j = 1; j < ll; j++) {
                    /*for each option in the original select element,
                     create a new DIV that will act as an option item:*/
                    c = document.createElement("DIV");
                    c.innerHTML = selElmnt.options[j].innerHTML;
                    c.addEventListener("click", function (e) {
                        /*when an item is clicked, update the original select box,
                         and the selected item:*/
                        var y, i, k, s, h, sl, yl;
                        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                        sl = s.length;
                        h = this.parentNode.previousSibling;
                        for (i = 0; i < sl; i++) {
                            if (s.options[i].innerHTML == this.innerHTML) {
                                s.selectedIndex = i;
                                h.innerHTML = this.innerHTML;
                                y = this.parentNode.getElementsByClassName("same-as-selected");
                                yl = y.length;
                                for (k = 0; k < yl; k++) {
                                    y[k].removeAttribute("class");
                                }
                                this.setAttribute("class", "same-as-selected");
                                break;
                            }
                        }
                        h.click();
                    });
                    b.appendChild(c);
                }
                x[i].appendChild(b);
                a.addEventListener("click", function (e) {
                    /*when the select box is clicked, close any other select boxes,
                     and open/close the current select box:*/
                    e.stopPropagation();
                    closeAllSelect(this);
                    this.nextSibling.classList.toggle("select-hide");
                    this.classList.toggle("select-arrow-active");
                });
            }
            function closeAllSelect(elmnt) {
                /*a function that will close all select boxes in the document,
                 except the current select box:*/
                var x, y, i, xl, yl, arrNo = [];
                x = document.getElementsByClassName("select-items");
                y = document.getElementsByClassName("select-selected");
                xl = x.length;
                yl = y.length;
                for (i = 0; i < yl; i++) {
                    if (elmnt == y[i]) {
                        arrNo.push(i)
                    } else {
                        y[i].classList.remove("select-arrow-active");
                    }
                }
                for (i = 0; i < xl; i++) {
                    if (arrNo.indexOf(i)) {
                        x[i].classList.add("select-hide");
                    }
                }
            }
            /*if the user clicks anywhere outside the select box,
             then close all select boxes:*/
            document.addEventListener("click", closeAllSelect);
        </script>
    </body>

    <!-- Mirrored from preschool.dreamguystech.com/html-template/library.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:11:58 GMT -->
</html>
<%-- 
    Document   : ClassAdd
    Created on : Oct 12, 2022, 10:28:32 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Class</title>
        <link rel="shortcut icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">
    </head>
    <body>

        <div class="main-wrapper">

            <%@include file="leftmenu.jsp" %>

            <div class="page-wrapper" style="min-height: 764px;">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">Add Class</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="library.html">Library</a></li>
                                    <li class="breadcrumb-item active">Add Class</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <form class="needs-validation" novalidate action="classadd" method="POST">
                                        <div class="row">
                                            <div class="col-12">
                                                <h5 class="form-title"><span>Class Information</span></h5>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <label for="validationCustom01">Class Code*</label>
                                                <input type="text" class="form-control" id="validationCustom01" placeholder="Class code" name="code" maxlength="10" required>
                                                <div class="valid-feedback" hidden>
                                                    Please enter a class code
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="form-group">
                                                    <label for="validationCustom02">Class subject*</label>
                                                    <select class="form-control" name = "subject" id="validationCustom02" required>
                                                        <option  value ="" hidden>Select Subject</option>
                                                        <c:forEach items="${requestScope.subjects}" var="s">
                                                            <option 
                                                                value="${s.subject_id}">${s.subject_code} - ${s.subject_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="invalid-feedback">
                                                    Please choose a subject.
                                                </div>
                                            </div>                                                      
                                            <div class="col-12 col-sm-6">
                                                <div class="form-group">
                                                    <label for="validationCustom03">Trainer*</label>
                                                    <select class="form-control" name="trainers" required id="validationCustom03">
                                                        <option value ="" hidden>Select Trainer</option>
                                                        <c:forEach items="${requestScope.trainers}" var="t">
                                                            <option 
                                                                value="${t.user_id}">${t.full_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="invalid-feedback">
                                                    Please choose a Trainer.
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="form-group">
                                                    <label for="validationCustom04">Supporter*</label>
                                                    <select class="form-control" name ="supporters" required id="validationCustom04">
                                                        <option  value ="" hidden>Select Supporter</option>
                                                        <c:forEach items="${requestScope.supporters}" var="sp">
                                                            <option 
                                                                value="${sp.user_id}">${sp.full_name}</option>
                                                        </c:forEach>
                                                    </select>                                              
                                                </div>
                                                <div class="invalid-feedback">
                                                    Please choose a Supporter.
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">                                               
                                                <div class="form-group">
                                                    <label for="validationCustom05">Term*</label>
                                                    <select class="form-control" name="term" id="validationCustom05" required>
                                                        <option value ="" hidden>Select Term</option>
                                                        <c:forEach items="${requestScope.settings}" var="st">
                                                            <option 
                                                                value="${st.setting_id}">${st.setting_title}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="invalid-feedback">
                                                    Please choose a term.
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="form-group">
                                                    <label for="validationCustom06">Status*</label>
                                                    <select class="form-control" name="status" id="validationCustom06" required>
                                                        <option value =""  hidden>Select Status</option>
                                                        <option  value ="1">Active</option>
                                                        <option  value ="0">Inactive</option>
                                                    </select>
                                                </div>
                                                <div class="invalid-feedback">
                                                    Please choose a status.
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="validationCustom07">Class Description</label>
                                                    <textarea class="form-control" id="validationCustom07" name="description" maxlength="500"></textarea>
                                                </div>
                                                <div class="invalid-feedback">
                                                    Please enter this field.
                                                </div>
                                            </div>
                                            <input hidden value ="${sessionScope.user.user_id}" type="text" class="form-control" name="user" required>

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
            <%@include file="footer.jsp" %>
        </div>
        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/script.js"></script><div class="sidebar-overlay"></div>
        <script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';
                window.addEventListener('load', function () {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');
                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
        </script>
        <!-- Mirrored from preschool.dreamguystech.com/html-template/add-books.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Oct 2021 11:12:21 GMT -->
    </body>
</html>

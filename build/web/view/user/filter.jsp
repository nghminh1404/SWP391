<%-- 
    Document   : filter
    Created on : Sep 25, 2022, 1:54:23 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
       <body>
        <form action="filter" method="GET">
            Role: <select name="setting_id">
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
        <table>
            <tr>
                <td>Id</td>
                <td>Full Name</td>
                <td>Email</td>
                <td>Mobile</td>
                <td>Role</td>
                <td>Status</td>
            </tr>
            <c:forEach items= "${requestScope.users}" var="u"> 
                <tr>
                    <td>${u.user_id}</td>
                    <td>${u.full_name}</td>
                    <td>${u.email}</td>
                    <td>${u.mobile}</td>
                    <td>${u.setting.setting_title}</td>
                    <td>
                        <c:if test="${u.status == true}"> Activate </c:if>
                        <c:if test="${u.status == false}"> Deactivate </c:if>
                        </td>
                        <td>
                            <a href="userdetail?id=${u.user_id}">View</a>
                        <a href="#">Edit</a>
                    </td>
                </tr>
            </c:forEach>    
        </table>
    </body>
</html>

<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <%@ page language="java" contentType="text/html; charset=utf-8"
             pageEncoding="utf-8" errorPage="/index.jsp"  isErrorPage="true" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <title>list</title>
</head>
<body>
<div>

   <%-- request和requestScope其实是一样的吗--%>
    <c:if test="${empty requestScope.employees }">
        没有员工信息
    </c:if>
    <c:if test="${!empty requestScope.employees }">
        <table border="1" >
            <tr>
                <th>ID</th>
                <th>lastName</th>
                <th>email</th>
                <th>gender</th>
                <th>department</th>
                <th>edit</th>
                <th>delete</th>
            </tr>

            <c:forEach items="${requestScope.employees }" var="emp">
                <tr>
                    <td>${emp.id }</td>
                    <td>${emp.lastName }</td>
                    <td>${emp.email }</td>
                    <td>${emp.gender == 0 ? 'Female' : 'Male' }</td>
                    <td>${emp.department.departmentName }</td>
                    <td><a class="edit" href="emp/${emp.id }">Edit</a></td>
                    <!-- 因为a标签是get请求， 要转成Delete请求， 可以使用jquery -->
                    <td><a class="delete" href="emp/${emp.id }">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

<!--post请求改造的delete-->
<form action="" method="post">
    <input type="hidden" name="_method" value="DELETE"/>
    <!--必须这样写-->
</form>
<script type="text/javascript">
    //class=delete的a链接 点击触发 通过jquery修改form表单的action
    $(function(){
        $(".delete").click(function(){
            var href = $(this).attr("href");
            $("form").attr("action", href).submit();
            return false;
        })
    })
</script>
</body>
</html>
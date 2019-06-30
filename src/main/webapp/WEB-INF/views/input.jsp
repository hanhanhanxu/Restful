<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <%@ page language="java" contentType="text/html; charset=utf-8"
             pageEncoding="utf-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
<div>
    <form:form action="${pageContext.request.contextPath }/emp" method="post" modelAttribute="employee" >
        <c:if test="${employee.id == null }">
            <!-- 新增 -->
            lastName: <form:input path="lastName" /><br/>
        </c:if>
        <c:if test="${employee.id != null }">
            <!--修改-->
            <form:hidden path="id" />
            <input type="hidden" name="_method" value="PUT" />
            <!-- 新增 -->
            lastName: <form:input path="lastName" /><br/>
        </c:if>

        email: <form:input path="email" /><br/>
        <%
            Map<String , String> genders = new HashMap<String , String>();
            genders.put("1", "male");
            genders.put("0", "female");
            request.setAttribute("genders",genders); //必须放在域对象中，才可以被${}访问到
        %>
        gender:<form:radiobuttons path="gender" items="${genders }" /><br/>
        department:<form:select path="department.id" items="${departments }" itemLabel="departmentName" itemValue="id"></form:select><br/>
        <input type="submit" />
    </form:form>
</div>
</body>
</html>
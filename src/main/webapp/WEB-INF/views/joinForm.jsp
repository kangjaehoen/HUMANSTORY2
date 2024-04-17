<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h1>회원가입 페이지</h1>
<hr>
    <form role="form" action="/join" method="post">


        <div class="form-group">
            <label>empName</label>
            <input class="form-control" name='empName'>
        </div>

        <div class="form-group">
            <label>pw</label>
            <input class="form-control" name='pw'>
        </div>

        <div class="form-group">
            <label>job</label>
            <input class="form-control" name='job'>
        </div>
        <div class="form-group">
            <label>phoneNum</label>
            <input class="form-control" name='phoneNum'>
        </div>
        <div class="form-group">
            <label>hireDate</label>
            <input type="text" class="form-control" name='hireDate'>
        </div>
        <div class="form-group">
            <label>email</label>
            <input class="form-control" name='email'>
        </div>

        <div class="form-group">
            <label>address</label>
            <input class="form-control" name='address'>
        </div>
        <div class="form-group">
            <label>workDate</label>
            <input class="form-control" name='workDate'>
        </div>
        <div class="form-group">
            <label>birthDate</label>
            <input class="form-control" name='birthDate'>
        </div>
        <div class="form-group">
            <label>deptNum</label>
            <input class="form-control" name='deptNum'>
        </div>
        <div class="form-group">
            <input type="hidden" class="form-control" name='Enabled' value="1">
        </div>
        <div class="form-group">
            <input type="hidden" class="form-control" name='role'>
        </div>

        <button type="submit" class="btn btn-primary">회원가입
            </button>
        <button type="reset" class="btn btn-default">Reset Button</button>
    </form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Department Update</title>
</head>
<body>
<div>
    <form role="form"  action="modify.jsp" method="post">
        <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/> '>
        <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/> '>
        <input type="hidden" name="type" value='<c:out value="${cri.type}"/> '>
        <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/> '>

        <div>
            <label>deptNum</label>
            <input name="deptNum">
        </div>

        <div>
            <label>deptName</label>
            <input name="deptName">
        </div>

        <button type="submit">Submit button</button>
        <button type="reset">Reset button</button>
    </form>
</div>

</body>
</html>
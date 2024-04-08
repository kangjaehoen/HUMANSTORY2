<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>




<body>
<div class="p-1 sm:m1">
    <div class="flex">
            <h1>사원관리 </h1>
    </div>

    <div>
        <button id="regBtn" type="button">신규 직원 등록</button>
        <button id="modiBtn" type="button">정보 수정</button>
    </div>
    <%--button 위치들--%>
    <div>
        <form id="searchForm" action="/emp/list" method="get">
            <select name="type">
                <option value="">---</option>
                <option value="T">사원번호</option>
                <option value="C">사원명</option>
                <option value="W">부서명</option>
                <option value="TC">사원번호 or 사원명</option>
                <option value="WC">사원명 or 부서명</option>
                <option value="TWC">사원명 or 부서명 or 사원번호</option>
            </select>
            <input type="text" name="keyword"
<%--                value='<c:out value="${emppageMaker.cri.keyword}"/>' >--%>
            <button > 검색</button>
        </form>
    </div>
    <%-- search form--%>
</div>
<div>
    <table>
        <thead>
            <tr>
                <th>사원번호</th>
                <th>사원명</th>
                <th>직책</th>
                <th>전화 번호</th>
                <th>입사일</th>
                <th>이메일</th>
                <th>연차일 </th>
                <th>주소</th>
                <th>근무일</th>
                <th>생년월일</th>
                <th>부서</th>
            </tr>
        </thead>
        <c:forEach items="${list}" var="emp">

            <tr>
                <td><c:out value="${emp.empNum}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.empName}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.pw}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.job}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.phoneNum}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.hireDate}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.email}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.annualLeaveNum}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.address}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.workDate}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.birthDate}"/></td>
            </tr>
            <tr>
                <td><c:out value="${emp.departNum}"/></td>
            </tr>
        </c:forEach>
    </table>
<%-- table 들--%>
</div>



</body>
</html>

<script type="text/javascript">

</script>

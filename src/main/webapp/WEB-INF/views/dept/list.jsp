<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
<div class="p-1 sm:m1">
    <div class="flex">
        <h1>부서관리</h1>
    </div>

    <div>
        <button id="regBtn" type="button">신규 부서 등록</button>
        <button id="modiBtn" type="button">부서 수정</button>
    </div>

    <div>
        <form id="searchForm" action="/dept/list" method="get">
            <select name="type">
                <option value=" ">---</option>
                <option value="T">부서번호</option>
                <option value="C"> 부서명</option>
                <option value="TC">부서번호 or 부서명</option>
            </select>
            <input type="text" name="keyword"
            value='<c:out value="${pageMaker.cri.keyword}"/>'>
            <button> 검색</button>
        </form>
    </div>

</div>
<div>
    <table>
        <thead>
            <tr>
                <th>부서번호</th>
                <th>부서명</th>
            </tr>
        </thead>

        <tbody>
        <c:forEach items="${list}" var="dept">
            <tr>
                <td><c:out value="${dept.deptNum}"/> </td>
                <td><c:out value="${dept.deptName}"/> </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


</body>
</html>


<script type="text/javascript">
    $(document)
        .ready(
            function (){
                $("#regBtn").on("click",function (){
                    self.location="/dept/register";
                    console.log("등록이동")
                })
                var actionForm=$("#actionForm");

                $(".move").on("click",function (e){
                    e.preventDefault();
                    actionForm
                        .append("<input type='hidden' name='deptNum' value='"
                        +$(this).attr(
                            "href")
                        +"'>");
                    actionForm.attr("action","/dept/get");
                    actionForm.submit();

                });
                var searchForm=$("#searchForm");
                $("#searchForm button").on(
                    "click",
                    function (e){
                        if(!searchForm.find("option:selected")
                            .val()){
                            alert("검색종류를 선택하세요");
                            return false;
                        }

                        if (!searchForm.find(
                            "input[name='keyword']").val()){
                            alert("키워드를 입력하세요");
                            return false;
                        }
                        searchForm.find("input[name='pageNum']")
                            .val("1");
                        e.preventDefault();
                        searchForm.submit();

                    });
            });
</script>
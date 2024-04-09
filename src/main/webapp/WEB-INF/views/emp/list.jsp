<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet"
      href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
        src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<style>
    td{
        padding: 10px;
    }
</style>




<body>
<div class="container">

    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-heading">직원 출력 </div>
            <div class="panel-body">
                <div >
                    <button id="regBtn" type="button">신규 직원 등록</button>
                </div>
                <%--button 위치들--%>
                <div>
                    <form class="form-inline" id="searchForm" action="/emp/list" method="get">
                        <select class="form-control" id="key" name="type">
                            <option value="">---</option>
                            <option value="T">사원번호</option>
                            <option value="C">사원명</option>
                            <option value="W">부서명</option>
                            <option value="TC">사원번호 or 사원명</option>
                            <option value="WC">사원명 or 부서명</option>
                            <option value="TWC">사원명 or 부서명 or 사원번호</option>
                        </select>
                        <input type="text" name="keyword" class="form-control"
                          value='<c:out value="${pageMaker.cri.keyword}"/>' >
                        <button type="submit" class="btn btn-default">
                        <span class="glyphicon glyphicon-search"></span> Search
                        </button>
                    </form>
                </div>
            </div>
            <div>
                <table class="table">
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
                            <th>사진등록</th>
                            <th>삭제</th>
                            <th>수정</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${list}" var="emp">
                            <tr>
                                <td class="empNum" ><c:out value="${emp.empNum}"/></td>

                                <td><span>${emp.empName}</span>
                                    <%--<c:if test="${not empty emp.empFileName}">  &lt;%&ndash;이거 사진 파일&ndash;%&gt;
                                        <button type="button" class="btn btn-default btn-xs picture"
                                                value="${emp.empNum}">사진</button>
                                    </c:if>--%>
                                </td>

                                <td>${emp.job}</td>
                                <td>${emp.phoneNum}</td>
                                <td>${emp.hireDate}</td>
                                <td>${emp.email}</td>
                                <td>${emp.annualLeaveNum}</td>
                                <td>${emp.address}</td>
                                <td>${emp.workDate}</td>
                                <td>${emp.birthDate}</td>
                                <td>${emp.departNum}</td>
                                <td><button class="btn btn-default btn-xs btnPictureInsert pictureInsertForm">
                                    사진등록
                                </button></td>
                                <td>
                                    <button type="button" class="btn btn-default btn-xs delete"
                                            value="${emp.empNum}">삭제</button>
                                </td>
                                <td>
                                    <a href="/emp/modify?empNum=${emp.empNum}" role="button"
                                       class="btn btn-default btn-xs">수정</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <form class="form-inline" role="form" method="post">
                    <a href="/emp/register" class="btn btn-default">register</a>
                </form>
                <%-- table 들--%>
            </div>
        </div>
    </div>
    <%-- search form--%>

    <%--사진 보기 모달--%>
    <div id
</div>




</body>
</html>



<script type="text/javascript">
    $(document)
        .ready(
            function() {
                <%--$("#myModal").modal("hide");--%>
                <%--var result = '<c:out value="${result}"/>';--%>

                <%--checkModal(result);--%>

                <%--history.replaceState({}, null, null);--%>

                <%--function checkModal(result) {--%>

                <%--    if (result === '' || history.state) {--%>
                <%--        return;--%>
                <%--    }--%>

                <%--    $("#myModal").modal("show");--%>
                <%--}--%>

                $("#regBtn").on("click",function (){
                    self.location="/emp/register";
                    console.log("등록이동");
                });

                $(".empNum").on(
                    "click",
                    function() {
                        self.location.href = "/emp/modify?empNum="
                            +empNum;

                    });

                var actionForm = $("#actionForm");

                // $(".paginate_button a").on(
                //     "click",
                //     function(e) {
                //
                //         e.preventDefault();
                //
                //         console.log('click');
                //
                //         actionForm.find("input[name='emppageNum']")
                //             .val($(this).attr("href"));
                //         actionForm.submit();
                //     });

                $(".move")
                    .on(
                        "click",
                        function(e) {

                            e.preventDefault();
                            actionForm
                                .append("<input type='hidden' name='empNum' value='"
                                    + $(this).attr(
                                        "href")
                                    + "'>");
                            actionForm.attr("action",
                                "/emp/get");
                            actionForm.submit();

                        });

                var searchForm = $("#searchForm");

                $("#searchForm button").on(
                    "click",
                    function(e) {

                        if (!searchForm.find("option:selected")
                            .val()) {
                            alert("검색종류를 선택하세요");
                            return false;
                        }

                        if (!searchForm.find(
                            "input[name='keyword']").val()) {
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

























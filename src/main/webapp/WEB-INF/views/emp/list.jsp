<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="sideBar.jsp" %>

<link rel="stylesheet"
      href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
        src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>




<style>
    td{
        padding: 10px;
    }
    .container{
        margin-top: 20px;
        margin-left: 200px;
    }
</style>
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
                var formObj=$("form");

                $("button.delete").on("click",function (e){
                    e.preventDefault();



                    $("#deleteFormModal #empNum").val($(this).val());
                     $("#deleteFormModal #comment").text("이름:"+$(this).parents("tr").find("span").text());
                    $("#deleteFormModal").modal();

                    var operation=$(this).data("oper");
                    //
                    console.log(operation);
                    //
                    if (operation==='remove'){
                        formObj.attr("action","/emp/remove");
                    }
                    formObj.submit();
                });
            });
</script>

</head>
<body>
<div class="container">
    <div style="margin-bottom: 1%;">
        <div>
            <h1 style="font-size: x-large;">
                <img src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
                     alt="logo" style="vertical-align: bottom;"> 직원관리<small>v3.0</small>
            </h1>
        </div>
        <div>
            <ul class="nav nav-pills nav-justified ">
                <li class="active"><a href="/emp/list">직원관리</a></li>
                <li><a href="regionlist.it">지역관리</a></li>
                <li><a href="/dept/list">부서관리</a></li>
                <li><a href="positionlist.it">직위관리</a></li>
                <%-- 세션 정보를 EL 표현으로 출력 --%>
<%--                <li><a href="j_spring_security_logout" style="color: red">--%>
<%--                    ${pageContext.request.userPrincipal.name} 로그아웃</a></li>--%>

            </ul>
        </div>

    </div>

    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-heading">직원 출력 </div>
            <div class="panel-body">

                <%--button 위치들--%>
<%--                <div>--%>
<%--                    <form class="form-inline" id="searchForm" action="/emp/list" method="get">--%>
<%--                        <select class="form-control" id="key" name="type">--%>
<%--                            <option value="T">사원번호</option>--%>
<%--                            <option value="C">사원명</option>--%>
<%--                            <option value="W">부서명</option>--%>
<%--                        </select>--%>

<%--                        <input type="text" name="keyword" required="required" class="form-control"--%>
<%--                               value='<c:out value="${pageMaker.cri.keyword}"/>'--%>
<%--                        >--%>
<%--                        <button type="submit" class="btn btn-default">--%>
<%--                        <span class="glyphicon glyphicon-search"></span> Search--%>
<%--                        </button>--%>
<%--                    </form>--%>
<%--                </div>--%>

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
<%--                                    <c:if test="${not empty emp.empFileName}">  &lt;%&ndash;&lt;%&ndash;이거 사진 파일&ndash;%&gt;&ndash;%&gt;--%>
<%--                                        <button type="button" class="btn btn-default btn-xs picture"--%>
<%--                                                value="${emp.empNum}">사진</button>--%>
<%--                                    </c:if>--%>
                                </td>
                                <td>${emp.job}</td>
                                <td>${emp.phoneNum}</td>
                                <c:if test="${not empty emp.hireDate}">
                                    <fmt:formatDate value="${emp.hireDate}" pattern="yyyy/mm/dd" var="formattedhireDate"/>
                                <td>${formattedhireDate}</td>
                                </c:if>
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
                    <a href="/emp/register" class="btn btn-default">Add</a>
<%--                    <button type="button" class="btn btn-default">--%>
<%--                        totalCount <span class="badge">${totalcount}</span>--%>
<%--                    </button>--%>
<%--                    <button type="button" class="btn btn-default">--%>
<%--                        Count <span class="badge">${count}</span>--%>
<%--                    </button>--%>
                </form>
                <%-- table 들--%>
            </div>
        </div>
    </div>
    <%-- search form--%>

    <%--사진 보기 모달--%>
    <div id="pictureModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <%-- 사진 보기 선택한 사용자의 이름 출력 --%>
                    <h4 class="modal-title pictureName">홍길동의 사진</h4>

                </div>
                <div class="modal-body">
                    <div style="text-align: center;">

                        <%-- Ajax 요청에 대한 응답 결과를 가지고 이미지 처리 --%>
                        <img src="resources/picture/noimage.jpg" width="100%">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

</div>

<div id="pictureInsertForm" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">사진 등록</h4>
            </div>
            <div class="modal-body">

                <%-- 파일 업로드를 위한 설정 추가. enctype="multipart/form-data" --%>
                <form id="fileUpload" role="form" action="employeepictureinsert.it" method="post"
                      enctype="multipart/form-data">

                    <%-- 파일 업로드를 위한 직원 번호 전송 준비 --%>
                    <input type="hidden" id="empNum" name="empNum" value="">
                    <%-- 파일 업로드를 위한 사진 액션 구분(신규 등록 0, 수정 1) --%>
                    <input type="hidden" id="picturekey" name="picturekey" value="0">

                    <div class="form-group">
                        <%--<label for="fileName">사진등록 (only JPG, 100K byte 이내):</label> <input
                            type="file" class="form-control" id="file"
                            name="file" required="required">--%>
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<div id="deleteFormModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">직원 삭제</h4>
            </div>
            <div class="modal-body">

                <p>현재 선택한 직원 정보(<span id="comment"></span>)를 삭제할까요?</p>
                <!-- 삭제 진행시 번호와 패스워드를 서버로 전송해야 한다. -->
                <form action="remove" method="post">

                    <!-- 번호 전송은 hidden form 사용 -->
                    <%-- hidden form 추가 --%>
                    <input type="hidden" id="empNum" name="empNum" value="">

                    <button type="submit" data-oper='remove'
                              class="btn btn-default">삭제</button>

                </form>

            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-default btn-sm"
                        data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>


</body>




</html>

<%@ include file="footer.jsp" %>



























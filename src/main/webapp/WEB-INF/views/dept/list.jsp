<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
                function (){
                    $("#regBtn").on("click",function (){
                        self.location="/dept/register";
                        console.log("등록이동")
                    });

                    $(".deptNum").on(
                        "click",
                        function() {
                            self.location.href = "/dept/modify?deptNum="
                                +deptNum;

                        });


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

                    var formObj=$("form");

                    $("button.delete").on("click",function (e){
                        e.preventDefault();



                        $("#deleteFormModal #deptNum").val($(this).val());
                        $("#deleteFormModal #comment").text("이름:"+$(this).parents("tr").find("span").text());
                        $("#deleteFormModal").modal();

                        var operation=$(this).data("oper");
                        //
                        console.log(operation);
                        //
                        if (operation==='remove'){
                            formObj.attr("action","/dept/remove");
                        }
                        formObj.submit();
                    });
                });
    </script>

</head>

<body>
<div class="container">
    <div>
        <h1 style="font-size: x-large;">
            <img src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
                 alt="logo" style="vertical-align: bottom;"> 부서관리<small>v3.0</small>
        </h1>
    </div>

    <div>
        <button id="regBtn" type="button">신규 부서 등록</button>
        <button id="modiBtn" type="button">부서 수정</button>
    </div>

    <div>
        <ul class="nav nav-pills nav-justified ">
            <li ><a href="/emp/list">직원관리</a></li>
            <li ><a href="regionlist.it">지역관리</a></li>
            <li class="active"><a href="/dept/list">부서관리</a></li>
            <li><a href="positionlist.it">직위관리</a></li>
            <%-- 세션 정보를 EL 표현으로 출력 --%>
<%--            <li><a href="j_spring_security_logout" style="color: red">--%>
<%--                ${pageContext.request.userPrincipal.name} 로그아웃</a></li>--%>

        </ul>
    </div>







    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-heading">부서 출력</div>
            <div class="panel-body">
<%--                    <div>--%>
<%--                        <form id="searchForm" action="/dept/list" method="get">--%>
<%--                            <select name="type">--%>
<%--                                <option value=" ">---</option>--%>
<%--                                <option value="T">부서번호</option>--%>
<%--                                <option value="C"> 부서명</option>--%>
<%--                                <option value="TC">부서번호 or 부서명</option>--%>
<%--                            </select>--%>
<%--&lt;%&ndash;                            <input type="text" name="keyword"&ndash;%&gt;--%>
<%--&lt;%&ndash;                            value='<c:out value="${pageMaker.cri.keyword}"/>'>&ndash;%&gt;--%>
<%--                            <button> 검색</button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
            </div>
            <div >
                <table class="table">
                    <thead>
                        <tr>
                            <th>부서번호</th>
                            <th>부서명</th>
                            <th>삭제</th>
                            <th>수정</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${list}" var="dept">
                        <tr>
                            <td class="deptNum">${dept.deptNum} </td>

                            <td>${dept.deptName} </td>
                            <td>
                                <button type="button" class="btn btn-default btn-xs delete"
                                        value="${dept.deptNum}">삭제</button>
                            </td>
                            <td>
                                <a href="/dept/modify?deptNum=${dept.deptNum}" role="button"
                                   class="btn btn-default btn-xs">수정</a>
                            </td>


                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <form class="form-inline" role="form" method="post">
                    <a href="/dept/register" class="btn btn-default">Add</a>
                </form>
            </div>
        </div>
    </div>
</div>
<%--containner finished--%>


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
                    <input type="hidden" id="deptNum" name="deptNum" value="">

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


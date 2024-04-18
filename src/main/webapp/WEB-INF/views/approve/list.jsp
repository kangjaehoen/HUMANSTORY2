<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../ShareView/sideBar.jsp"%>

<style>
    .card-body {
        font-family: "Helvetica Neue", Helvetica, Arial;
        font-size: 14px;
        line-height: 20px;
        font-weight: 400;
        color: #3b3b3b;
        -webkit-font-smoothing: antialiased;
        font-smoothing: antialiased;
        background: #8793a9;
    }

    @media screen and (max-width: 580px) {
        .card-body {
            font-size: 16px;
            line-height: 22px;
        }
    }

    .wrapper {
        margin-top:60px ;
        margin-left: 320px;
        padding: 40px;
        max-width: 800px;
    }

    .ttt {
        margin: 0 0 40px 0;
        width: 100%;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        display: table;
    }

    @media screen and (max-width: 580px) {
        .ttt {
            display: block;
        }
    }

    .row {
        display: table-row;
        background: #f6f6f6;
    }

    .row:nth-of-type(odd) {
        background: #e9e9e9;
    }

    .row.header {
        font-weight: 900;
        color: #ffffff;
        background: #ea6153;
    }

    .row.green {
        background: #27ae60;
    }

    .row.blue {
        background: #2980b9;
    }

    @media screen and (max-width: 580px) {
        .row {
            padding: 14px 0 7px;
            display: block;
        }

        .row.header {
            padding: 0;
            height: 6px;
        }

        .row.header .cell {
            display: none;
        }

        .row .cell {
            margin-bottom: 10px;
        }

        .row .cell:before {
            margin-bottom: 3px;
            content: attr(data-title);
            min-width: 98px;
            font-size: 10px;
            line-height: 10px;
            font-weight: bold;
            text-transform: uppercase;
            color: #969696;
            display: block;
        }
        .row tr:before {
            margin-bottom: 3px;
            content: attr(data-title);
            min-width: 98px;
            font-size: 10px;
            line-height: 10px;
            font-weight: bold;
            text-transform: uppercase;
            color: #969696;
            display: block;
        }

    }

    .cell {
        padding: 6px 12px;
        display: table-cell;
    }

    @media screen and (max-width: 580px) {
        .cell {
            padding: 2px 16px;
            display: block;
        }
    }

    .move {
        color: #0000ff;
        text-decoration: none;
        font-weight: bold;
    }

    /*!* 마우스 호버 시 스타일 변경 *!*/
     .move:hover {
         color: red;

     }

</style>


<div class="card-body">

    <form id='actionForm' action="/approve/list" method='get'>
        <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
        <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

    </form>


    <div class="wrapper">

        <div class="ttt">

            <div class="row header">
                <div class="cell">결재 대기중</div>
            </div>

            <div class="row header">
                <div class="cell">사원 번호</div>
                <div class="cell">휴가 유형</div>
                <div class="cell">휴가 일수</div>
                <div class="cell">요청 날짜</div>
            </div>



            <c:forEach items="${list}" var="leave">
                <div class="row">
                    <div class="cell" data-title="Name11">
                        <a class='move' href='<c:out value="${leave.leaveNum}"/>'>
                            <c:out value="${leave.empNum}"/>
                        </a>
                    </div>
                    <div class="cell" data-title="Age">
                        <c:out value="${leave.leaveType}"/>
                    </div>
                    <div class="cell" data-title="Occupation">
                        <c:out    value="${leave.leaveDays}"/>
                    </div>
                    <div class="cell" data-title="Location">
                        <c:out    value="${leave.requestDate}"/>
                    </div>
                </div>
            </c:forEach>

            <div class='pull-right'>
                <ul class="pagination">

                    <c:if test="${pageMaker.prev}">
                        <li class="paginate_button previous"><a
                                href="${pageMaker.startPage -1}">Previous</a></li>
                    </c:if>

                    <c:forEach var="num" begin="${pageMaker.startPage}"
                               end="${pageMaker.endPage}">
                        <li class="paginate_button  ${pageMaker.cri.pageNum == num ? " active":""} ">
                            <a href="${num}">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageMaker.next}">
                        <li class="paginate_button next"><a
                                href="${pageMaker.endPage +1 }">Next</a></li>
                    </c:if>

                </ul>
            </div>
        </div>

        <div class="ttt">

            <div class="row header green">
                <div class="cell">결재 완료</div>
            </div>

            <div class="row header green">
                <div class="cell">사원 번호</div>
                <div class="cell">부서명</div>
                <div class="cell">휴가 일수</div>
                <div class="cell">요청 날짜</div>
                <div class="cell">결재 날짜</div>
            </div>

            <div class="row">
                <div class="cell" data-title="Product">201</div>
                <div class="cell" data-title="Unit Price">회계</div>
                <div class="cell" data-title="Quantity">3일</div>
                <div class="cell" data-title="Date Sold">24-05-02</div>
                <div class="cell" data-title="Status">24-04-30</div>
            </div>

            <div class='pull-right'>
                <ul class="pagination">

                    <c:if test="${pageMaker.prev}">
                        <li class="paginate_button previous"><a
                                href="${pageMaker.startPage -1}">Previous</a></li>
                    </c:if>

                    <c:forEach var="num" begin="${pageMaker.startPage}"
                               end="${pageMaker.endPage}">
                        <li class="paginate_button  ${pageMaker.cri.pageNum == num ? " active":""} ">
                            <a href="${num}">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageMaker.next}">
                        <li class="paginate_button next"><a
                                href="${pageMaker.endPage +1 }">Next</a></li>
                    </c:if>

                </ul>
            </div>
        </div>

        <div class="ttt">
            <div class="row header blue">
                <div class="cell">시기 변경 권유</div>
            </div>

            <div class="row header blue">
                <div class="cell">사원 번호</div>
                <div class="cell">부서명</div>
                <div class="cell">휴가 일수</div>
                <div class="cell">요청 날짜</div>
                <div class="cell">반려 날짜</div>
            </div>

            <div class="row">
                <div class="cell" data-title="Username">202</div>
                <div class="cell" data-title="Email">인사</div>
                <div class="cell" data-title="Password">4일</div>
                <div class="cell" data-title="Active">24-04-20</div>
                <div class="cell" data-title="Active">24-04-10</div>
            </div>
            <div class='pull-right'>
                <ul class="pagination">

                    <c:if test="${pageMaker.prev}">
                        <li class="paginate_button previous"><a
                                href="${pageMaker.startPage -1}">Previous</a></li>
                    </c:if>

                    <c:forEach var="num" begin="${pageMaker.startPage}"
                               end="${pageMaker.endPage}">
                        <li class="paginate_button  ${pageMaker.cri.pageNum == num ? " active":""} ">
                            <a href="${num}">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageMaker.next}">
                        <li class="paginate_button next"><a
                                href="${pageMaker.endPage +1 }">Next</a></li>
                    </c:if>

                </ul>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document)
        .ready(
            function() {

                var result = '<c:out value="${result}"/>';

                checkModal(result);

                history.replaceState({}, null, null);

                function checkModal(result) {

                    if (result === '' || history.state) {
                        return;
                    }

                    if (parseInt(result) > 0) {
                        $(".modal-body").html(
                            "게시글 " + parseInt(result)
                            + " 번이 등록되었습니다.");
                    }

                    $("#myModal").modal("show");
                }

                $("#regBtn").on("click", function() {

                    self.location = "/approve/register";

                });

                var actionForm = $("#actionForm");

                $(".paginate_button a").on(
                    "click",
                    function(e) {

                        e.preventDefault();

                        console.log('click');

                        actionForm.find("input[name='pageNum']")
                            .val($(this).attr("href"));
                        actionForm.submit();
                    });

                $(".move")
                    .on(
                        "click",
                        function(e) {

                            e.preventDefault();
                            actionForm
                                .append("<input type='hidden' name='leaveNum' value='"
                                    + $(this).attr(
                                        "href")
                                    + "'>");
                            actionForm.attr("action",
                                "/approve/get");
                            actionForm.submit();

                        });

            });
</script>


</body>
</html>

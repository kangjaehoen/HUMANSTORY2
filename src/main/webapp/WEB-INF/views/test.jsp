<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">

    <title>Title</title>

    <style>
        .card-body {
            font-family: "Helvetica Neue", Helvetica, Arial;
            font-size: 14px;
            line-height: 20px;
            font-weight: 400;
            color: #3b3b3b;
            -webkit-font-smoothing: antialiased;
            font-smoothing: antialiased;
            background: #5a7094;
        }

        @media screen and (max-width: 580px) {
            .card-body {
                font-size: 16px;
                line-height: 22px;
            }
        }

        .wrapper {
            margin: 0 auto;
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

    </style>

</head>
<body>

<div class="card-body">

    <form id='actionForm' action="/approve/list" method='get'>
        <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
        <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
    </form>


    <div class="wrapper">

        <div class="ttt">

            <div class="row header">
                <div class="cell">
                    결재 대기중
                </div>
            </div>

            <div class="row header">
                <div class="cell">
                    사원 번호
                </div>
                <div class="cell">
                    부서명
                </div>
                <div class="cell">
                    휴가 일수
                </div>
                <div class="cell">
                    요청 날짜
                </div>
            </div>

            <%--<div class="row">

                <div class="cell">

                </div>

                <table class="table table-striped table-bordered table-hover">
                    <thead >
                    <tr>
                        <th class="cell">1</th>
                        <th>2</th>
                        <th>3</th>
                        <th>4</th>
                        <th>5</th>
                    </tr>
                    </thead>

                    <c:forEach items="${list}" var="leave">
                        <tr>

                            <td><a class='move' href='<c:out value="${leave.empNum}"/>'>
                                <c:out value="${leave.empNum}"/>
                            </a></td>


                            <td>
                                value="${leave.leaveDays}"/>
                            </td>
                            <td>
                                value="${leave.requestDate}"/>
                            </td>
                        </tr>
                    </c:forEach>
                </table>


            </div>--%>


            <c:forEach items="${list}" var="leave">
                <div class="row">
                    <div class="cell" data-title="Name">
                        <a class='move' href='<c:out value="${leave.empNum}"/>'>
                            <c:out value="${leave.empNum}"/>
                        </a>
                    </div>
                    <div class="cell" data-title="Age">
                        <c:out value="${leave.empNum}"/>
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
                <div class="cell">
                    결재 완료
                </div>
            </div>

            <div class="row header green">
                <div class="cell">
                    사원 번호
                </div>
                <div class="cell">
                    부서명
                </div>
                <div class="cell">
                    휴가 일수
                </div>
                <div class="cell">
                    요청 날짜
                </div>
                <div class="cell">
                    결재 날짜
                </div>
            </div>

            <div class="row">
                <div class="cell" data-title="Product">
                    201
                </div>
                <div class="cell" data-title="Unit Price">
                    회계
                </div>
                <div class="cell" data-title="Quantity">
                    3일
                </div>
                <div class="cell" data-title="Date Sold">
                    24-05-02
                </div>
                <div class="cell" data-title="Status">
                    24-04-30
                </div>
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
                <div class="cell">
                    시기 변경 권유
                </div>
            </div>

            <div class="row header blue">
                <div class="cell">
                    사원 번호
                </div>
                <div class="cell">
                    부서명
                </div>
                <div class="cell">
                    휴가 일수
                </div>
                <div class="cell">
                    요청 날짜
                </div>
                <div class="cell">
                    반려 날짜
                </div>
            </div>

            <div class="row">
                <div class="cell" data-title="Username">
                    202
                </div>
                <div class="cell" data-title="Email">
                    인사
                </div>
                <div class="cell" data-title="Password">
                    4일
                </div>
                <div class="cell" data-title="Active">
                    24-04-20
                </div>
                <div class="cell" data-title="Active">
                    24-04-10
                </div>
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
                $(".modal-content").load("/leave/calendar");

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
                                .append("<input type='hidden' name='empNum' value='"
                                    + $(this).attr(
                                        "href")
                                    + "'>");
                            actionForm.attr("action",
                                "/leave/calendar");
                            actionForm.submit();

                        });
            });
</script>


</body>
</html>

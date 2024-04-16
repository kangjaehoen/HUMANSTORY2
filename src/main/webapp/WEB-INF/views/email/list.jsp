<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="sideBar.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
        href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css"
        rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="navigation">
    <nav class="dark:bg-gray-900 pt-4">
        <div class="max-w-screen-xl justify-between mx-auto p-4">
            <div class="hidden w-full md:block md:w-auto" id="navbar-default">
                <ul class="font-medium flex flex-col p-4 md:p-0 mt-4 rounded-lg bg-gray-800 md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-gray-800 dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                    <li>
                        <a href="/" class="block py-2 px-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white md:dark:text-blue-500" aria-current="page">메인페이지</a>
                    </li>
                    <li>
                        <a href="/system/annualForm" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 일수 부여 설정</a>
                    </li>
                    <li>
                        <a href="/email/list" id="empEmail" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 촉진 대상자</a>
                    </li>
                    <li>
                        <a href="/leavePromote/list"  id="promoteNav" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 촉진</a>
                    </li>
                    <li>
                        <a href="/leavePolicy/list" id="policyNav" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 정책</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>



<div id="sessionBox">
    <section class="bg-gray-100 dark:bg-gray-900 p-3 sm:p-5">
        <div class="mx-auto max-w-screen-xl px-4 lg:px-12">
            <!-- Start coding here -->
            <div
                    class="bg-white dark:bg-gray-800 relative shadow-md sm:rounded-lg overflow-hidden">
                <div
                        class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0 md:space-x-4 p-4">
                    <div class="w-full md:w-1/2">
                        <form class="flex items-center">
                            <label for="simple-search" class="sr-only">Search</label>
                            <div class="relative w-full">
                                <div
                                        class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                    <svg aria-hidden="true"
                                         class="w-5 h-5 text-gray-500 dark:text-gray-400"
                                         fill="currentColor" viewbox="0 0 20 20"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                              clip-rule="evenodd" />
                                    </svg>
                                </div>
                                <input type="text" id="simple-search"
                                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 p-2 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                       placeholder="Search" required="">
                            </div>
                        </form>
                    </div>


                    <div
                            class="w-full md:w-auto flex flex-col md:flex-row space-y-2 md:space-y-0 items-stretch md:items-center justify-end md:space-x-3 flex-shrink-0">



                        <div class="flex items-center space-x-3 w-full md:w-auto">
                            <button id="actionsDropdownButton"
                                    class="w-full md:w-auto flex items-center justify-center py-2 px-4 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700"
                                    type="button">
                                <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 16v-5.5A3.5 3.5 0 0 0 7.5 7m3.5 9H4v-5.5A3.5 3.5 0 0 1 7.5 7m3.5 9v4M7.5 7H14m0 0V4h2.5M14 7v3m-3.5 6H20v-6a3 3 0 0 0-3-3m-2 9v4m-8-6.5h1"/>
                                </svg>


                                이메일 발송
                            </button>
                            <div id="actionsDropdown"
                                 class="hidden z-10 w-44 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                                <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
                                    aria-labelledby="actionsDropdownButton">
                                    <li><a href="#"
                                           class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Mass
                                        Edit</a></li>
                                </ul>
                                <div class="py-1">
                                    <a href="#"
                                       class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Delete
                                        all</a>
                                </div>
                            </div>
                            <button id="notifySendBtn"
                                    class="w-full md:w-auto flex items-center justify-center py-2 px-4 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700"
                                    type="button">
                                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                                     class="h-4 w-4 mr-2 text-gray-400" viewbox="0 0 20 20"
                                     fill="currentColor">
                                    <path fill-rule="evenodd"
                                          d="M3 3a1 1 0 011-1h12a1 1 0 011 1v3a1 1 0 01-.293.707L12 11.414V15a1 1 0 01-.293.707l-2 2A1 1 0 018 17v-5.586L3.293 6.707A1 1 0 013 6V3z"
                                          clip-rule="evenodd" />
                                </svg>
                                알림 발송
                            </button>
<%--                            <div id="filterDropdown"--%>
<%--                                 class="z-10 hidden w-48 p-3 bg-white rounded-lg shadow dark:bg-gray-700">--%>
<%--                                <h6--%>
<%--                                        class="mb-3 text-sm font-medium text-gray-900 dark:text-white">Choose--%>
<%--                                    brand</h6>--%>
<%--                                <ul class="space-y-2 text-sm"--%>
<%--                                    aria-labelledby="filterDropdownButton">--%>
<%--                                    <li class="flex items-center"><input id="apple"--%>
<%--                                                                         type="checkbox" value=""--%>
<%--                                                                         class="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">--%>
<%--                                        <label for="apple"--%>
<%--                                               class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-100">Apple--%>
<%--                                            (56)</label></li>--%>
<%--                                    <li class="flex items-center"><input id="fitbit"--%>
<%--                                                                         type="checkbox" value=""--%>
<%--                                                                         class="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">--%>
<%--                                        <label for="fitbit"--%>
<%--                                               class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-100">Microsoft--%>
<%--                                            (16)</label></li>--%>
<%--                                    <li class="flex items-center"><input id="razor"--%>
<%--                                                                         type="checkbox" value=""--%>
<%--                                                                         class="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">--%>
<%--                                        <label for="razor"--%>
<%--                                               class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-100">Razor--%>
<%--                                            (49)</label></li>--%>
<%--                                    <li class="flex items-center"><input id="nikon"--%>
<%--                                                                         type="checkbox" value=""--%>
<%--                                                                         class="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">--%>
<%--                                        <label for="nikon"--%>
<%--                                               class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-100">Nikon--%>
<%--                                            (12)</label></li>--%>
<%--                                    <li class="flex items-center"><input id="benq"--%>
<%--                                                                         type="checkbox" value=""--%>
<%--                                                                         class="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">--%>
<%--                                        <label for="benq"--%>
<%--                                               class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-100">BenQ--%>
<%--                                            (74)</label></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </div>
                <div class="overflow-x-auto" #click="">
                    <table
                            class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead
                                class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                        <tr>

                            <th scope="col" class="px-4 py-3"><input id="allCheck"
                                                                     type="checkbox" /></th>
                            <th scope="col" class="px-4 py-3">사원번호</th>
                            <th scope="col" class="px-4 py-3">사원명</th>
                            <th scope="col" class="px-4 py-3">잔여 연차 일수</th>
                            <th scope="col" class="px-4 py-3">이메일</th>
                            <th scope="col" class="px-4 py-3"></th>
                        </tr>
                        </thead>
                        <tbody id="listTbody">
                        <c:forEach items="${list}" var="mail">
                            <tr class="border-b dark:border-gray-700">
                                <td class="px-4 py-3"><input class="tdCheck"
                                                             type="checkbox"></td>
                                <th scope="row"
                                    class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap dark:text-white" id="empNum">${mail.empNum }</th>
                                <td class="px-4 py-3" id="empName">${mail.empName}</td>
                                <td class="px-4 py-3" id="it_days">${mail.it_days}</td>
                                <td class="px-4 py-3" id="email">${mail.email}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <nav
                        class="flex flex-col md:flex-row justify-between items-start md:items-center space-y-3 md:space-y-0 p-4"
                        aria-label="Table navigation">
					<span class="text-sm font-normal text-gray-500 dark:text-gray-400">
						Showing <span class="font-semibold text-gray-900 dark:text-white">1-10</span>
						of <span class="font-semibold text-gray-900 dark:text-white">1000</span>
					</span>
                    <ul class="inline-flex items-stretch -space-x-px">
                        <li><c:if test="${page.prev }">
                        <li id="pagePrev"><a href="#" class="pagination-link">Previous</a></li>
                        </c:if> <c:forEach var="num" begin="${page.startPage }"
                                           end="${page.endPage}">
                        <li id="pageClick"><a href="#" class="pagination-link">${num}</a></li>
                    </c:forEach>
                        <li><c:if test="${page.next }">
                        <li id="pageNext"><a href="#" class="pagination-link">Next</a></li>
                        </c:if></li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
</div>


<div>
    <form id="pageNum" action="list" method="get">
        <input type="hidden" name="pageNum" value="${page.cri.pageNum }">
    </form>
</div>

<div>
    <form id="empEmailInfo" action="emailSend" method="post">
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
    </form>
</div>



<style type="text/css">
    .w-6 h-6 text-gray-800 dark:text-white {
        margin-right: 10px;
    }

    #sessionBox {
        margin-top: 80px;
    }

    #page li {
        display: inline;
        margin-right: 30px;
    }

    #pagingBox {
        margin-left: 700px;
        margin-top: 35px;
    }

    .pagination-link {
        list-style-type: none;
        display: inline;
        padding: 4px 10px;
        text-decoration: none;
        color: #333;
        border: 1px solid #ccc;
        border-radius: 4px;
        transition: background-color 0.3s;
        font-weight: bold;
    }

    .pagination-link:hover {
        background-color: #c9c9c9;
        color: white;
    }

    .pagination-link.active {
        background-color: #c9c9c9;
        color: #fff;
        border-color: #c9c9c9;
    }

    .navigation {
        margin-top: 25px;
        margin-left: 255px;
    }

    .navigation div {
        display: inline;

        margin-right: 20px;


    }

    .navigation div a {
        text-decoration: none;
        color: #dae0eb;
        font-weight: bold;
        display: block; /* a태그는 글자성격 = inline */
        float: left;
        font-size: 16px;
        font-weight: 900;
        line-height: 80px;
        padding: 0 30px;
        margin-right: 10px;
    }

    .navigation div a:hover {
        color: #2900c5;
    }

    #empEmail{
        color: #676767;
    }

    #empEmail:hover{
        color: #2900c5;
    }


    .flex items-center space-x-3 w-full md:w-auto{
        margin-right: 5px;
    }
</style>

<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("#actionsDropdownButton").click(function() {
            $("#empEmailInfo").submit();
        });

        $("#listTbody tr").hover(function() {
            $(this).css("background-color", "#f0f0f0");
        }, function() {
            $(this).css("background-color", "");
        });

        $(".tdCheck").change(function() {
            if ($(this).prop("checked")) {
                var empRow = $(this).closest("tr");
                var empNum = empRow.find("#empNum").text();
                var empName = empRow.find("#empName").text();
                var it_days = empRow.find("#it_days").text();
                var email = empRow.find("#email").text();
                console.log("empNum"+empNum);
                console.log("empName :" + empName);
                console.log("email :" + email);
                console.log("it_days :" + it_days);

                // hidden input 필드 추가
                $('<input>').attr({
                    type: 'hidden',
                    name: 'empName',
                    value: empName
                }).appendTo('#empEmailInfo');

                $('<input>').attr({
                    type: 'hidden',
                    name: 'it_days',
                    value: it_days
                }).appendTo('#empEmailInfo');

                $('<input>').attr({
                    type: 'hidden',
                    name: 'email',
                    value: email
                }).appendTo('#empEmailInfo');

            } else {
                $('#empEmailInfo input[name="empName"]').remove();
                $('#empEmailInfo input[name="it_days"]').remove();
                $('#empEmailInfo input[name="email"]').remove();
            }
        });

        $("#pageClick a").click(function(e) {
            e.preventDefault();
            let num = $(this).text();
            console.log(num);

            $("#pageNum").find("input[name='pageNum']").val(num);
            $("#pageNum").submit();
        });

        $("#pagePrev a").click(function(e) {
            e.preventDefault();
            let prev = ${page.startPage}-1;
            $("#pageNum").find("input[name='pageNum']").val(prev);
            $("#pageNum").submit();
        });

        $("#pageNext a").click(function(e) {
            e.preventDefault();
            let next = ${page.endPage}+1;
            $("#pageNum").find("input[name='pageNum']").val(next);
            $("#pageNum").submit();
        });




        $('#notifySendBtn').click(function(e){
            console.log("ajax");
            console.log("click+empNum" , empNum);

            


            let url = '/email/sideBar';
            // 전송한 정보를 db에 저장
            $.ajax({
                type: 'post',
                url: '/email/sideBar',
                dataType: 'text',
                data: {
                    empNum : empNum,
                    empName: empName,
                    it_days: it_days,
                    url: url
                },
                success: function(){    // db전송 성공시 실시간 알림 전송
                    // 소켓에 전달되는 메시지
                    // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
                    socket.send("관리자,"+empNum+","+empName+","+it_days+","+url);
                    console.log(empNum);
                    console.log(empName);
                    console.log(it_days);
                    console.log(url);
                }
            });
            // modal.find('.modal-body textarea').val('');	// textarea 초기화
        });
    });
</script>

<%@include file="footer.jsp"%>


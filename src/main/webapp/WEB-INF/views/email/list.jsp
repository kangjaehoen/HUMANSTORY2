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


<nav class="bg-gray-800 mt-[58.5px]">
    <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
        <div class="relative flex h-16 items-center justify-between">
            <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                <!-- Mobile menu button-->
                <button type="button" class="relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
                    <span class="absolute -inset-0.5"></span>
                    <span class="sr-only">Open main menu</span>
                    <!--
                      Icon when menu is closed.

                      Menu open: "hidden", Menu closed: "block"
                    -->
                    <svg class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                    </svg>
                    <!--
                      Icon when menu is open.

                      Menu open: "block", Menu closed: "hidden"
                    -->
                    <svg class="hidden h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>
            <div class="flex flex-1 items-center justify-left sm:items-stretch sm:justify-start">
                <div class="flex flex-shrink-0 items-center">
                    <svg class="w-8 h-8 text-white transition duration-75" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                        <path fill-rule="evenodd" d="M17 10v1.126c.367.095.714.24 1.032.428l.796-.797 1.415 1.415-.797.796c.188.318.333.665.428 1.032H21v2h-1.126c-.095.367-.24.714-.428 1.032l.797.796-1.415 1.415-.796-.797a3.979 3.979 0 0 1-1.032.428V20h-2v-1.126a3.977 3.977 0 0 1-1.032-.428l-.796.797-1.415-1.415.797-.796A3.975 3.975 0 0 1 12.126 16H11v-2h1.126c.095-.367.24-.714.428-1.032l-.797-.796 1.415-1.415.796.797A3.977 3.977 0 0 1 15 11.126V10h2Zm.406 3.578.016.016c.354.358.574.85.578 1.392v.028a2 2 0 0 1-3.409 1.406l-.01-.012a2 2 0 0 1 2.826-2.83ZM5 8a4 4 0 1 1 7.938.703 7.029 7.029 0 0 0-3.235 3.235A4 4 0 0 1 5 8Zm4.29 5H7a4 4 0 0 0-4 4v1a2 2 0 0 0 2 2h6.101A6.979 6.979 0 0 1 9 15c0-.695.101-1.366.29-2Z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <div class="hidden sm:ml-6 sm:block">
                    <div class="flex space-x-4">
                        <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                        <a href="/system/annualForm" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">휴가 일수 부여 설정</a>
                        <a href="/email/list" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">휴가 촉진 대상자</a>
                        <a href="/leavePromote/list" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">휴가 촉진 게시판</a>
                        <a href="/leavePolicy/list" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">휴가 정책 게시판</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
    </div>

    <!-- Mobile menu, show/hide based on menu state. -->
    <div class="sm:hidden" id="mobile-menu">
        <div class="space-y-1 px-2 pb-3 pt-2">
            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
            <a href="/system/annualForm" class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">휴가 일수 부여 설정</a>
            <a href="/email/list" class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">휴가 촉진 대상자</a>
            <a href="/leavePromote/list" class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">휴가 촉진</a>
            <a href="/leavePolicy/list" class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">휴가 정책</a>
        </div>
    </div>
</nav>


<div id="sessionBox">
    <section class="bg-gray-100 dark:bg-gray-900 p-3 sm:p-5 h-screen">
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
                                <td class="px-4 py-3" id="lt_days">${mail.lt_days}</td>
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

<%--<div id="myModal" class="modal">--%>
<%--    <div class="modal-content">--%>
<%--        <span class="close">&times;</span>--%>
<%--        <div class="modal-body">--%>
<%--            <input type="text" placeholder="Target">--%>
<%--            <textarea placeholder="Content"></textarea>--%>
<%--            <button id="modalSendBtn">Send</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<div class="flex justify-center m-5">
    <button id="readProductButton"  data-modal-target="readProductModal" data-modal-toggle="readProductModal" class="block text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800" type="button">
        Show read modal
    </button>
</div>


<div id="readProductModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-modal md:h-full">
    <div class="relative p-4 w-full max-w-xl h-full md:h-auto">
        <!-- Modal content -->
        <div class="relative p-4 bg-white rounded-lg shadow dark:bg-gray-800 sm:p-5">
            <!-- Modal header -->
            <div class="flex justify-between mb-4 rounded-t sm:mb-5">
                <div class="text-lg text-gray-900 md:text-xl dark:text-white">
                    <h3 id="modalTitle" class="font-semibold ">
                        사원명 :
                    </h3>
                    <p id="modalEmpNum" class="font-bold">
                        사원번호 :
                    </p>
                </div>
                <div>
                    <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 inline-flex dark:hover:bg-gray-600 dark:hover:text-white" data-modal-toggle="readProductModal">
                        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                        <span class="sr-only">Close modal</span>
                    </button>
                </div>
            </div>
            <dl>
                <dt class="mb-2 font-semibold leading-none text-gray-900 dark:text-white">휴가 촉진 메일 대상 정보</dt>
                <dd id="mailInfo" class="mb-4 font-light text-gray-500 sm:mb-5 dark:text-gray-400">Standard glass ,3.8GHz 8-core 10th-generation Intel Core i7 processor, Turbo Boost up to 5.0GHz, 16GB 2666MHz DDR4 memory, Radeon Pro 5500 XT with 8GB of GDDR6 memory, 256GB SSD storage, Gigabit Ethernet, Magic Mouse 2, Magic Keyboard - US.</dd>
                <dt class="mb-2 font-semibold leading-none text-gray-900 dark:text-white">이메일</dt>
                <dd id="modalEmail" class="mb-4 font-light text-gray-500 sm:mb-5 dark:text-gray-400"></dd>
            </dl>
            <div class="flex justify-between items-center">
                <div class="flex items-center space-x-3 sm:space-x-4">
                    <button type="button" class="text-white inline-flex items-center bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                        <svg aria-hidden="true" class="mr-1 -ml-1 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z"></path><path fill-rule="evenodd" d="M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z" clip-rule="evenodd"></path></svg>
                        Edit
                    </button>
                    <button id="emailSendModal" type="button" class="py-2.5 px-5 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">
                        <?xml version="1.0" ?><svg data-name="Layer 45" height="24" id="Layer_45" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><title/><rect height="8.875" style="fill:#fff" width="15.5" x="4.3125" y="6.0625"/><path d="M19,5H5A2,2,0,0,0,3,7V17a2,2,0,0,0,2,2H19a2,2,0,0,0,2-2V7A2,2,0,0,0,19,5Zm0,4-7,5L5,9V7l7,5,7-5Z" style="fill:#4c9ae8"/></svg>
                        이메일 전송
                    </button>
                </div>
                <button type="button" class="inline-flex items-center text-white bg-red-600 hover:bg-red-700 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-red-500 dark:hover:bg-red-600 dark:focus:ring-red-900">
                    <svg aria-hidden="true" class="w-5 h-5 mr-1.5 -ml-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path></svg>
                    Delete
                </button>
            </div>
        </div>
    </div>
</div>



<style type="text/css">
    /*.w-6 h-6 text-gray-800 dark:text-white {*/
    /*    margin-right: 10px;*/
    /*}*/

    /*#sessionBox {*/
    /*    margin-top: 80px;*/
    /*}*/

    /*#page li {*/
    /*    display: inline;*/
    /*    margin-right: 30px;*/
    /*}*/

    /*#pagingBox {*/
    /*    margin-left: 700px;*/
    /*    margin-top: 35px;*/
    /*}*/

    /*.pagination-link {*/
    /*    list-style-type: none;*/
    /*    display: inline;*/
    /*    padding: 4px 10px;*/
    /*    text-decoration: none;*/
    /*    color: #333;*/
    /*    border: 1px solid #ccc;*/
    /*    border-radius: 4px;*/
    /*    transition: background-color 0.3s;*/
    /*    font-weight: bold;*/
    /*}*/

    /*.pagination-link:hover {*/
    /*    background-color: #c9c9c9;*/
    /*    color: white;*/
    /*}*/

    /*.pagination-link.active {*/
    /*    background-color: #c9c9c9;*/
    /*    color: #fff;*/
    /*    border-color: #c9c9c9;*/
    /*}*/

    /*.navigation {*/
    /*    margin-top: 25px;*/
    /*    margin-left: 255px;*/
    /*}*/

    /*.navigation div {*/
    /*    display: inline;*/

    /*    margin-right: 20px;*/


    /*}*/

    /*.navigation div a {*/
    /*    text-decoration: none;*/
    /*    color: #dae0eb;*/
    /*    font-weight: bold;*/
    /*    display: block; !* a태그는 글자성격 = inline *!*/
    /*    float: left;*/
    /*    font-size: 16px;*/
    /*    font-weight: 900;*/
    /*    line-height: 80px;*/
    /*    padding: 0 30px;*/
    /*    margin-right: 10px;*/
    /*}*/

    /*.navigation div a:hover {*/
    /*    color: #2900c5;*/
    /*}*/




    .flex items-center space-x-3 w-full md:w-auto{
        margin-right: 5px;
    }

</style>

<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">

    var empNum;
    var empName;
    var lt_days;
    var email;
    var socket = new WebSocket('ws://localhost:8081/echo-ws');

    $(function() {


        $("#listTbody tr").hover(function() {
            $(this).css("background-color", "#f0f0f0");
        }, function() {
            $(this).css("background-color", "");
        });

        $(".tdCheck").change(function() {
            if ($(this).prop("checked")) {
                var empRow = $(this).closest("tr");
                 empNum = empRow.find("#empNum").text();
                 empName = empRow.find("#empName").text();
                 lt_days = empRow.find("#lt_days").text();
                 email = empRow.find("#email").text();

                console.log("empNum"+empNum);
                console.log("empName :" + empName);
                console.log("email :" + email);
                console.log("lt_days :" + lt_days);

                // hidden input 필드 추가
                $('<input>').attr({
                    type: 'hidden',
                    name: 'empName',
                    value: empName
                }).appendTo('#empEmailInfo');

                $('<input>').attr({
                    type: 'hidden',
                    name: 'lt_days',
                    value: lt_days
                }).appendTo('#empEmailInfo');

                $('<input>').attr({
                    type: 'hidden',
                    name: 'email',
                    value: email
                }).appendTo('#empEmailInfo');

            } else {
                $('#empEmailInfo input[name="empName"]').remove();
                $('#empEmailInfo input[name="lt_days"]').remove();
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


        $("#actionsDropdownButton").click(function() {

            $("#readProductButton").click();

            $("#modalTitle").text("사원명 : "+ empName);

            $("#modalEmpNum").text("사원번호 : "+empNum);

            $("#mailInfo").text(empName+"님에게 촉구 메일을 발송하시겠습니까? (연차 잔여일 "+lt_days+"일)" );

            $("#modalEmail").text("이메일 주소 : "+email);
            // $("#empEmailInfo").submit();
        });


        $("#emailSendModal").click(function (){

            $("#empEmailInfo").submit();
        })





        $('#notifySendBtn').click(function (){

            $('#myModal').css('display', 'block');

            // 모달 닫기 버튼
            $('.close').click(function(){
                $('#myModal').css('display', 'none');
            });

        })




        $('#modalSendBtn').click(function(e){
            let modal = $('.modal-content').has(e.target);
            let type = '70';
            let target = modal.find('.modal-body input').val();
            let content = modal.find('.modal-body textarea').val();
            let url = '/echo-ws/email/alarm';
            // 전송한 정보를 db에 저장
            $.ajax({
                type: 'get',
                url: url,
                contentType: 'text', // 수정된 부분
                data: {
                    target: target,
                    content: content,
                    type: type, // 'type'를 'alarmType' 또는 다른 이름으로 변경
                    url: url
                },
                success: function(){    // db전송 성공시 실시간 알림 전송
                    // 소켓에 전달되는 메시지
                    // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
                    socket.send("관리자,"+target+","+content+","+url);
                } ,



            });
            modal.find('.modal-body textarea').val('');	// textarea 초기화
        });
    });

</script>

<%@include file="footer.jsp"%>


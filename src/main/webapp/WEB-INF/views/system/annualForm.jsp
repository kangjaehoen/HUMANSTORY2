<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="sideBar.jsp"%>


<style>

    /*#sessionBox{*/
    /*    margin-top:70px;*/
    /*}*/



    /*#divBox {*/
    /*    margin-left: 300px;*/
    /*    margin-top: 100px;*/
    /*}*/

    h2 {
        font-size: 20px;
        font-weight: bold;
        margin-top : 50px;
        margin-left: 20px;
        display: inline;
    }

    input[type="date"] {
        appearance: none;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 8px;
        font-size: 16px;
        outline: none;
    }

    input[type="date"]:focus {
        border-color: #007bff;
    }

    p {
        color: red;
    }


    .bg-blue-700 {
        --tw-bg-opacity: 1;
        background-color: rgb(26 39 67);
    }

    #guideMessage{
        font-size: 12px;

    }
    #box1 {
        margin-top: 30px;
    }
    #nav1{
        margin-top: 58.5px;
    }


</style>








<form id="myForm" action="leaveGrant" method="post">
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
</form>



<form id="myForm2" action="annualNumSetting" method="post">
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
</form>


<form id="manualBtn" action="annualLeave" method="post">
<%--    <!-- 	<input type="submit" value="관리자 수동 등록"> --> <input type="hidden"--%>
<%--                                                                name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
</form>



<nav class="bg-gray-800 mt-[58.5px]">
    <div id="nav1" class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
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
    <section class="bg-gray-50 dark:bg-gray-900  h-screen  items-center">
        <div class="max-w-screen-xl px-4 mx-auto lg:px-12 w-full">


            <!-- Start coding here -->
            <br>
            <div id ="box1" class="relative bg-white shadow-md dark:bg-gray-800 sm:rounded-lg">
                <h2>1. 휴가 부여일 설정</h2>
                <div
                        class="flex flex-col items-center justify-between p-4 space-y-3 md:flex-row md:space-y-0 md:space-x-4">
                    <div class="w-full md:w-1/2">
                        <form class="flex items-center">
                            <!-- <label for="simple-search" class="sr-only">Search</label> -->
                            <div class="relative w-full">
                                <div
                                        class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                    <!--     <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewbox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"> -->
                                    <path fill-rule="evenodd"
                                          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                          clip-rule="evenodd" />
                                    </svg>
                                </div>
                                <input type="date" id="simple-search"
                                       class="block w-1/2 p-2 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                       placeholder="Search" required="">
                            </div>
                        </form>
                    </div>
                    <div
                            class="flex flex-col items-stretch justify-end flex-shrink-0 w-full space-y-2 md:w-auto md:flex-row md:space-y-0 md:items-center md:space-x-3">
                        <button type="button"
                                class="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 focus:outline-none dark:focus:ring-primary-800">
                            <p>현재 연차 휴가 설정일은 ${day.grantDay } 입니다.</p>
                        </button>
                        <div class="flex items-center w-full space-x-3 md:w-auto">
                            <button id="actionsDropdownButton"
                                    data-dropdown-toggle="actionsDropdown"
                                    class="flex items-center justify-center w-full px-4 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg md:w-auto focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700"
                                    type="button">
                                <svg class="w-6 h-6 text-gray-800 dark:text-white"
                                     aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                     width="24" height="24" fill="none" viewBox="0 0 24 24">
                                    <path stroke="currentColor" stroke-linecap="round"
                                          stroke-linejoin="round" stroke-width="2"
                                          d="M12 8v4l3 3m6-3a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                </svg>

                                <path clip-rule="evenodd" fill-rule="evenodd"
                                      d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" />
                                </svg>
                                연차 휴가 부여일 설정 등록
                            </button>
                        </div>
                    </div>
                </div>
            </div> <br><br>




            <div
                    class="relative bg-white shadow-md dark:bg-gray-800 sm:rounded-lg">
                <h2>2. 휴가 부여 일수 설정</h2>
                <div
                        class="flex flex-col items-center justify-between p-4 space-y-3 md:flex-row md:space-y-0 md:space-x-4">
                    <div class="w-full md:w-1/2">
                        <form class="flex items-center">
                            <!-- <label for="simple-search" class="sr-only">Search</label> -->
                            <div class="relative w-full">
                                <div
                                        class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                    <!--     <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewbox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"> -->
                                    <path fill-rule="evenodd"
                                          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                          clip-rule="evenodd" />
                                    </svg>
                                </div>
                                <input type="text" id="simple-search2"
                                       class="block w-1/2 p-2 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                       placeholder="부여할 휴가일수 ex)15" required="">
                            </div>
                        </form>
                    </div>
                    <div
                            class="flex flex-col items-stretch justify-end flex-shrink-0 w-full space-y-2 md:w-auto md:flex-row md:space-y-0 md:items-center md:space-x-3">
                        <button type="button"
                                class="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 focus:outline-none dark:focus:ring-primary-800">
                            <p>현재 연차 부여일은 ${num.grantDate }일입니다.(추가로 2년이상 근무시 +1일)</p>
                        </button>
                        <div class="flex items-center w-full space-x-3 md:w-auto">
                            <button id="actionsDropdownButton2"
                                    data-dropdown-toggle="actionsDropdown"
                                    class="flex items-center justify-center w-full px-4 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg md:w-auto focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700"
                                    type="button">
                                <svg class="w-6 h-6 text-gray-800 dark:text-white"
                                     aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                     width="24" height="24" fill="none" viewBox="0 0 24 24">
                                    <path stroke="currentColor" stroke-linecap="round"
                                          stroke-linejoin="round" stroke-width="2"
                                          d="M12 8v4l3 3m6-3a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                </svg>

                                <path clip-rule="evenodd" fill-rule="evenodd"
                                      d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" />
                                </svg>
                                연차 휴가 부여일수 설정 등록
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>


            <button id="modalBtn" type="button" data-modal-target="crypto-modal" data-modal-toggle="crypto-modal" class="text-gray-900 bg-white hover:bg-gray-100 border border-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:focus:ring-gray-600 dark:bg-gray-800 dark:border-gray-700 dark:text-white dark:hover:bg-gray-700">
                <svg aria-hidden="true" class="w-4 h-4 me-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"></path></svg>
                휴가일 수동 부여
            </button><br><br>


        </div>
    </section>
</div>







<!-- Main modal -->
<div id="crypto-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4  max-width:500-md max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
                    사용자 휴가 관리
                </h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm h-8 w-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-toggle="crypto-modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->



            <div class="p-4 md:p-5">
                <p class="text-sm font-normal text-gray-500 dark:text-gray-400">This is a list of users. Click and give the event you want to give..</p>
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
                            <th scope="col" class="px-4 py-3">직책</th>
                            <th scope="col" class="px-4 py-3">입사일</th>
                            <th scope="col" class="px-4 py-3">이메일</th>
                            <th scope="col" class="px-4 py-3"></th>
                        </tr>
                        </thead>
                        <tbody id="listTbody">
                        <c:forEach items="${user}" var="list">
                            <tr class="border-b dark:border-gray-700">
                                <td class="px-4 py-3"><input class="tdCheck"
                                                             type="checkbox"></td>
                                <th scope="row"
                                    class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap dark:text-white" id="empNum">${list.empNum }</th>
                                <td class="px-4 py-3" id="empName">${list.empName}</td>
                                <td class="px-4 py-3" id="job">${list.job}</td>
                                <td class="px-4 py-3" id="lt_days"><fmt:formatDate pattern="yyyy-MM-dd"
                                                                                   value="${list.hireDate}"/></td>
                                <td class="px-4 py-3" id="email">${list.email}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <ul class="my-4 space-y-3">
                    <li>
                        <a href="#1" id="userList" class="flex items-center p-3 text-base font-bold text-gray-900 rounded-lg bg-gray-50 hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white">
                            <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                <path stroke="currentColor" stroke-width="2" d="M7 17v1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-1a3 3 0 0 0-3-3h-4a3 3 0 0 0-3 3Zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
                            </svg>

                            <span class="flex-1 ms-3 whitespace-nowrap">휴가 부여 (관리자 전용) </span>
                            <span class="inline-flex items-center justify-center px-2 py-0.5 ms-3 text-xs font-medium text-gray-500 bg-gray-200 rounded dark:bg-gray-700 dark:text-gray-400">Popular</span>
                        </a>
                    </li>

                    <button id="multiLevelDropdownButton" data-dropdown-toggle="multi-dropdown" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">휴가 목록 <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                    </svg>
                    </button>

                    <!-- Dropdown menu -->
                    <div id="multi-dropdown" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
                        <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="multiLevelDropdownButton">
                            <li>
                                <a href="#" class="flex items-center p-3 text-base font-bold text-gray-900 rounded-lg bg-gray-50 hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white">
                                <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                                    <path fill-rule="evenodd" d="M2 12C2 6.477 6.477 2 12 2s10 4.477 10 10-4.477 10-10 10S2 17.523 2 12Zm13.707-1.293a1 1 0 0 0-1.414-1.414L11 12.586l-1.793-1.793a1 1 0 0 0-1.414 1.414l2.5 2.5a1 1 0 0 0 1.414 0l4-4Z" clip-rule="evenodd"/>
                                </svg>
                                    <span class="flex-1 ms-3 whitespace-nowrap">연차</span>
                                </a>
                            </li>
                    <li>
                        <a href="#" id="laeveList1" class="flex items-center p-3 text-base font-bold text-gray-900 rounded-lg bg-gray-50 hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white">
                            <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                                <path fill-rule="evenodd" d="M2 12C2 6.477 6.477 2 12 2s10 4.477 10 10-4.477 10-10 10S2 17.523 2 12Zm11-4a1 1 0 1 0-2 0v4a1 1 0 0 0 .293.707l3 3a1 1 0 0 0 1.414-1.414L13 11.586V8Z" clip-rule="evenodd"/>
                            </svg>
                            <span class="flex-1 ms-3 whitespace-nowrap">반차</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="flex items-center p-3 text-base font-bold text-gray-900 rounded-lg bg-gray-50 hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white">
                            <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M13.5 2c-.178 0-.356.013-.492.022l-.074.005a1 1 0 0 0-.934.998V11a1 1 0 0 0 1 1h7.975a1 1 0 0 0 .998-.934l.005-.074A7.04 7.04 0 0 0 22 10.5 8.5 8.5 0 0 0 13.5 2Z"/>
                                <path d="M11 6.025a1 1 0 0 0-1.065-.998 8.5 8.5 0 1 0 9.038 9.039A1 1 0 0 0 17.975 13H11V6.025Z"/>
                            </svg>

                            <span class="flex-1 ms-3 whitespace-nowrap">반반차</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="flex items-center p-3 text-base font-bold text-gray-900 rounded-lg bg-gray-50 hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white">
                           <svg enable-background="new 0 0 64 64"  height="24" id="Layer_1" version="1.1" viewBox="0 0 64 64" width="24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M55.239,3.555c-6.69-5.466-16.548-4.475-22.018,2.219L6.542,38.425c-5.468,6.69-4.477,16.552,2.216,22.019  c6.694,5.469,16.552,4.478,22.021-2.216l26.678-32.654C62.925,18.882,61.934,9.024,55.239,3.555z M31.896,49.095l-2.92,3.574  c-3.946,4.832-11.17,5.455-16.138,1.396c-0.308-0.252-0.594-0.519-0.87-0.794c-0.532-0.655,0.34-0.804,0.34-0.804l0.01-0.02  c3.082,0.411,11.245,0.868,18.823-4.207l0.012,0.029c0,0,0.415-0.181,0.614,0C31.967,48.452,32.106,48.837,31.896,49.095z   M54.242,24.131l-4.572,5.597c-0.086,0.112-0.16,0.23-0.251,0.341l-5.705,6.984L24.96,22.259L35.765,9.037  c4.169-5.103,11.686-5.859,16.787-1.691C57.655,11.515,58.41,19.03,54.242,24.131z" fill="#241F20"/></svg>
                            <span class="flex-1 ms-3 whitespace-nowrap">병가</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="flex items-center p-3 text-base font-bold text-gray-900 rounded-lg bg-gray-50 hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white">
                           <svg  height="30" width="23" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><g id="Low_birth_rate"><path d="M278.57,155.9458c-10.0166,8.1172-20.0362.8276-21.169-.0493a6,6,0,0,0-7.457,9.4014,31.2863,31.2863,0,0,0,18.6328,6.4086,27.37,27.37,0,0,0,17.5479-6.4365,6,6,0,0,0-7.5547-9.3242Z"/><path d="M219.4684,165.27a6,6,0,0,0-7.5547-9.3242c-10.0166,8.1162-20.0351.8281-21.167-.0493a6,6,0,0,0-7.459,9.4009,31.2892,31.2892,0,0,0,18.6329,6.4091A27.37,27.37,0,0,0,219.4684,165.27Z"/><path d="M234.5387,200.45a7.1345,7.1345,0,1,0,7.1343,7.1345A7.1344,7.1344,0,0,0,234.5387,200.45Z"/><path d="M262.4245,185.0742a22.3388,22.3388,0,0,0-9.7774,2.2442,27.129,27.129,0,0,0-36.2168,0,22.51,22.51,0,1,0,0,40.5326,27.1283,27.1283,0,0,0,36.2163,0,22.5067,22.5067,0,1,0,9.7776-42.7768Zm-55.7715,34.021a11.5105,11.5105,0,1,1,0-23.021,11.3891,11.3891,0,0,1,3.0625.4256,27.0955,27.0955,0,0,0,0,22.17A11.386,11.386,0,0,1,206.653,219.0952Zm27.8857,4.6841a16.1946,16.1946,0,1,1,16.1944-16.1948A16.2129,16.2129,0,0,1,234.5387,223.7793Zm27.8858-4.6841a11.3884,11.3884,0,0,1-3.0628-.4256,27.095,27.095,0,0,0,0-22.17,11.3846,11.3846,0,0,1,3.0625-.4256,11.5105,11.5105,0,1,1,0,23.021Z"/><path d="M216.0426,99.88a6.0292,6.0292,0,0,0-5.52,2.97,5.8088,5.8088,0,0,0-.82,2.65,5.9913,5.9913,0,0,0,3.07,5.6,5.9174,5.9174,0,0,0,2.55.75c.11.01.68.04,1.63.04a61.5078,61.5078,0,0,0,25.95-6,51.6413,51.6413,0,0,0,22.53-21.13,123.9771,123.9771,0,0,0-11.9631-3.5754C240.4289,100.86,217.3924,99.95,216.0426,99.88Z"/><path d="M352.4127,186.04a29.0785,29.0785,0,0,0,3.88-11.72,82.4119,82.4119,0,0,0,95.98-117.01,6.0106,6.0106,0,0,0-8.1828-1.7948,6.2067,6.2067,0,0,0-2.1123,7.9584c.08.1688.1536.3376.215.5064a.554.554,0,0,0,.03.07,70.5343,70.5343,0,1,1-21.29-25.53c.07.05.13.09.2.14.3.2.6.42.9.65a5.9993,5.9993,0,0,0,7.89-9.01.0774.0774,0,0,0-.04-.04,82.2866,82.2866,0,0,0-117.74,16.72c-12.35-9-28.28-16.28-48.87-19.82a162.913,162.913,0,0,0-21.18-2.2h-7.54c-61.05,2.47-88.98,34.09-101.66,60.19a130.81,130.81,0,0,0-12.78,56.09l-.08,11.25a29.0347,29.0347,0,0,0-1.71,35.33c1.16,9.86,6.86,69.14-15.43,121.35-9.56,22.38-14.39,46.27-13.97,69.1.47,24.71,7.2,47.55,19.47,66.05,30.37,45.77,85.98,55.51,127.79,55.51h2.51c20.6717,0,44.7209-2.3916,67.4268-10.3354.4719-1.172,1.18-3.5888,1.19-3.6228.0881-.3405.1677-.6711.2395-.99.2346-1.039.5986-3.6319.6434-4.1633l0-.0007c.8034-9.5147-1.0078-26.806-9.291-48.2091-7.8889-20.3849-23.9255-49.98-55.8613-78.0114A238.988,238.988,0,0,0,219.0524,336.01c-26.76-18.07-43.19-43.27-53.22-66.04a58.0329,58.0329,0,0,1,14.78-21.72,99.0849,99.0849,0,0,0,104.33,2.43c3.74,3.91,9.92,11.48,13,21.38a6.4884,6.4884,0,0,0,.72,1.5c-15.58,20.3319-34.0359,47.4821-45.985,65.6477a8.9809,8.9809,0,0,0,1.4,11.5383c30.8684,28.4435,46.3915,57.8555,54.4086,78.5722,9.0249,23.32,11.81,42.9214,10.258,55.0782,17.9252-8.4632,35.4754-21.5945,47.7389-40.0764,12.27-18.5,19-41.34,19.46-66.05a157.292,157.292,0,0,0-1.72-26.05,175.2639,175.2639,0,0,0-12.24-43.05c-24.32-56.96-19.63-122.16-19.58-122.81C352.4127,186.25,352.4127,186.15,352.4127,186.04Zm-192.52,68.77c-.81-2.36-1.57-4.66-2.25-6.89a227.2156,227.2156,0,0,1-7.06-30.69,98.022,98.022,0,0,0,20.27,23.72A72.3967,72.3967,0,0,0,159.8925,254.81Zm146.73,6.5a69.9,69.9,0,0,0-11.63-17.45,97.92,97.92,0,0,0,22.76-24.87C317.1227,230.83,314.5324,246.42,306.6225,261.31Zm20.71-72.92a16.8487,16.8487,0,0,1-3.26-.33,6.0108,6.0108,0,0,0-6.85,4.07,86.3941,86.3941,0,0,1-33.08,44.82c-.4.28-.81.56-1.22.83a6.22,6.22,0,0,0-.88.56,86.7219,86.7219,0,0,1-129.81-46.19,6.0082,6.0082,0,0,0-5.71-4.17,5.8475,5.8475,0,0,0-1.1.1,16.8112,16.8112,0,0,1-3.16.31,17.12,17.12,0,1,1,0-34.24c.27,0,.53.02.8.04l.34.03a5.9839,5.9839,0,0,0,6.28-4.86A86.571,86.571,0,0,1,253.47,81.1794a6.0239,6.0239,0,0,1,.3164-.5638c4.565-7.1538,7.4207-16.2377,8.2508-27.0585a6,6,0,1,1,11.9648.918c-.8989,11.7173-3.7682,21.87-8.5691,30.2849a86.7738,86.7738,0,0,1,31.88,21.14,82.615,82.615,0,0,0,47.06,63.97c.04.46.08.93.08,1.4A17.14,17.14,0,0,1,327.3327,188.39Z"/><path d="M387.859,51.042H370.0065a8.52,8.52,0,0,0-8.5205,8.52V96.9982a3.2308,3.2308,0,0,1-3.2307,3.2308h-6.6985a7.2378,7.2378,0,0,0-5.8731,2.8618,7.0662,7.0662,0,0,0,.5381,9.0376L369.47,136.8423a13.7031,13.7031,0,0,0,9.9531,4.3017l.12-.0009a13.7,13.7,0,0,0,9.9942-4.4776l22.3608-24.6289a6.9734,6.9734,0,0,0,1.2927-7.4552,7.3335,7.3335,0,0,0-6.822-4.3524h-6.7576a3.2309,3.2309,0,0,1-3.2307-3.2308V59.563A8.521,8.521,0,0,0,387.859,51.042Z"/></g></svg>                            <span class="flex-1 ms-3 whitespace-nowrap">출산휴가</span>
                        </a>
                    </li>
                            <li>
                                <a href="#" class="flex items-center p-3 text-base font-bold text-gray-900 rounded-lg bg-gray-50 hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white">
                                    <svg height="24" id="svg8" version="1.1" viewBox="0 0 8.4666665 8.4666669" width="24" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:svg="http://www.w3.org/2000/svg"><defs id="defs2"/><g id="layer1" transform="translate(0,-288.53332)"><path d="m 2.1760249,290.47035 v -1.25149 h 4.1716537 v 1.25149" id="path4197" style="opacity:1;fill:none;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:1;stroke-linecap:square;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:6.80813837;stroke-opacity:1;paint-order:stroke fill markers"/><path d="m 0.79919825,290.85356 v 5.45106 H 7.7245053 v -5.45106 z" id="path4199" style="opacity:1;fill:none;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:1;stroke-linecap:square;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:6.80813837;stroke-opacity:1;paint-order:markers fill stroke"/><path d="m 4.2618518,292.58525 c 0,0.0772 0,1.98768 0,1.98768" id="path4201" style="opacity:1;fill:none;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:1;stroke-linecap:square;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:6.80813837;stroke-opacity:1;paint-order:markers fill stroke"/><path d="m 5.2556941,293.57909 c -0.077147,0 -1.9876847,0 -1.9876847,0" id="path4203" style="opacity:1;fill:none;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:1;stroke-linecap:square;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:6.80813837;stroke-opacity:1;paint-order:markers fill stroke"/></g></svg>
                                    <span class="flex-1 ms-3 whitespace-nowrap">보건휴가</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="flex items-center p-3 text-base font-bold text-gray-900 rounded-lg bg-gray-50 hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white">
                                    <svg id="Icons_ParentAndBaby" width="23" height="24" overflow="hidden" version="1.1" viewBox="0 0 96 96" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><circle cx="46.5" cy="11" r="8"/><circle cx="65.5" cy="19" r="6"/><path d=" M 53 51.8 L 53 51.8 L 53 51.8 C 52.7 51.8 52 52 51.5 52 C 47.6 52 44.5 48.9 44.5 45 C 44.5 41.8 46.6 39 49.7 38.2 C 49.9 38.1 54 36.8 55.7 29.4 C 56.2 27.3 57.6 25.6 59.5 24.7 C 57.6 23.5 55.5 22.5 53.1 21.8 C 51 21.4 48.8 21 46.5 21 C 44.3 21 42.1 21.4 39.9 22 C 36.7 22.8 33.9 24.4 31.5 26.4 C 30.9 27 30.5 27.8 30.3 28.6 L 24.7 52.4 C 24.7 52.6 24.5 53 24.5 53.4 C 24.5 55.6 26.3 57.4 28.5 57.4 C 30.3 57.4 31.9 56 32.3 54.4 L 36.5 37 L 36.5 93 L 44.5 93 L 44.5 57 L 48.5 57 L 48.5 93 L 56.5 93 L 56.5 50.5 C 54.5 51.5 53.2 51.8 53 51.8 Z"/><ellipse cx="62.2" cy="44.2" rx="4" ry="3.5" transform="matrix(0.7099,-0.7043,0.7043,0.7099,-13.0734,56.6311)"/><path d=" M 58.4 40.3 C 59.6 39.1 61.2 38.4 62.8 38.4 C 63.6 38.4 64.3 38.6 65 38.9 C 66 37 66.8 34.7 67.4 32 C 68 29.3 66.3 26.6 63.6 26 C 60.9 25.4 58.2 27.1 57.6 29.8 C 55.6 38.4 50.5 40 50.2 40.1 L 50.3 40.1 C 48.1 40.6 46.4 42.6 46.4 45 C 46.4 47.8 48.6 50 51.4 50 C 51.8 50 52.5 49.9 52.5 49.9 C 52.7 49.9 54.7 49.4 57.3 47.7 C 55.9 45.5 56.2 42.4 58.4 40.3 Z"/></g></svg>
                                    <span class="flex-1 ms-3 whitespace-nowrap">가족 돌봄휴가</span>
                                </a>
                            </li>
                </ul>
            </div>
                    <div>
                            <a id="leaveList1" href="#" class="flex items-center p-3 text-base font-bold text-gray-900 rounded-lg bg-gray-50 hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white">
                                <?xml version="1.0" ?><svg  width="30" height="30" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:#04009a;}.cls-2{fill:#77acf1;}</style></defs><g data-name="25. Checklist" id="_25._Checklist"><path class="cls-1" d="M24,6H22a2,2,0,0,0-2-2H19V3a3,3,0,0,0-6,0V4H12a2,2,0,0,0-2,2H8A3,3,0,0,0,5,9V29a3,3,0,0,0,3,3h9a1,1,0,0,0,0-2H8a1,1,0,0,1-1-1V9A1,1,0,0,1,8,8h2a2,2,0,0,0,2,2h8a2,2,0,0,0,2-2h2a1,1,0,0,1,1,1v8a1,1,0,0,0,2,0V9A3,3,0,0,0,24,6ZM15,3a1,1,0,0,1,2,0V4H15ZM12,8V6h8V7h0V8Z"/><path class="cls-2" d="M17,24a1,1,0,1,1,.71-.29A1.05,1.05,0,0,1,17,24Z"/><path class="cls-2" d="M11,25a1,1,0,0,1-.71-.29l-1-1a1,1,0,0,1,1.42-1.42l.29.3,1.29-1.3a1,1,0,0,1,1.42,1.42l-2,2A1,1,0,0,1,11,25Z"/><path class="cls-2" d="M22,16H17a1,1,0,0,1,0-2h5a1,1,0,0,1,0,2Z"/><path class="cls-2" d="M11,17a1,1,0,0,1-.71-.29l-1-1a1,1,0,0,1,1.42-1.42l.29.3,1.29-1.3a1,1,0,0,1,1.42,1.42l-2,2A1,1,0,0,1,11,17Z"/><path class="cls-2" d="M24,21h4a0,0,0,0,1,0,0v3a1,1,0,0,1-1,1H25a1,1,0,0,1-1-1V21A0,0,0,0,1,24,21Z"/><path class="cls-1" d="M29,32H23a3,3,0,0,1-3-3V23a3,3,0,0,1,3-3h6a3,3,0,0,1,3,3v6A3,3,0,0,1,29,32ZM23,22a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h6a1,1,0,0,0,1-1V23a1,1,0,0,0-1-1Z"/></g></svg>                                <span class="flex-1 ms-3 whitespace-nowrap">휴가 리스트</span>
                            </a>
                    </div>

                    <div class="p-4 md:p-5"  id="leaveList" style="display: none">
                        <div class="overflow-x-auto" #click="">
                            <table
                                    class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                <thead
                                        class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                <tr>

                                    <th scope="col" class="px-4 py-3">사원번호</th>
                                    <th scope="col" class="px-4 py-3">사원명</th>
                                    <th scope="col" class="px-4 py-3">휴가명</th>
                                    <th scope="col" class="px-4 py-3">잔여 연차 일수</th>
                                    <th scope="col" class="px-4 py-3">이메일</th>
                                    <th scope="col" class="px-4 py-3"></th>
                                </tr>
                                </thead>
                                <tbody id="listTbody1">
                                <c:forEach items="${leave}" var="list">
                                    <tr class="border-b dark:border-gray-700">
                                        <th scope="row"
                                            class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap dark:text-white" id="empNum1">${list.empNum }</th>
                                        <td class="px-4 py-3" id="empName1">${list.empName}</td>
                                        <td class="px-4 py-3" id="leaveType1">${list.leaveType}</td>
                                        <td class="px-4 py-3" id="lt_days1">${list.lt_days}</td>
                                        <td class="px-4 py-3" id="email1">${list.email}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>



                    <div>
                        <label for="price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">휴가일 부여</label>
                        <input type="number" name="price" id="price" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="부여할 휴가일 수" required="">
                    </div>

                    <div>
                        <p id="guideMessage"> </p>
                    </div>

                    <div>
                        <label for="message" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">휴가 사유 </label>
                        <textarea id="message" rows="4" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Write your thoughts here..."></textarea>
                    </div>

                    <div class="flex items-center">
                        <input id="link-checkbox" type="checkbox" value="" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                        <label for="link-checkbox" class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">이메일 발송 여부 <a href="#" class="text-blue-600 dark:text-blue-500 hover:underline">terms and conditions</a>.</label>
                    </div>


                    <button id="userManagerBTN" type="button" class="text-gray-900 bg-white hover:bg-gray-100 border border-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:focus:ring-gray-600 dark:bg-gray-800 dark:border-gray-700 dark:text-white dark:hover:bg-gray-700 me-2 mb-2">
                        <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 7.757v8.486M7.757 12h8.486M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"/>
                        </svg>
                        사용자 휴가 부여
                    </button>

                    <div>
                        <a href="#" id="guide" class="inline-flex items-center text-xs font-normal text-gray-500 hover:underline dark:text-gray-400">
                            <svg class="w-3 h-3 me-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7.529 7.988a2.502 2.502 0 0 1 5 .191A2.441 2.441 0 0 1 10 10.582V12m-.01 3.008H10M19 10a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"/>
                            </svg>
                            Why do I need to connect with my wallet?</a>
                    </div>


                </ul>
            </div>
    </div>

</div>




    <div>
        <form id="updateLeave" action="/system/updateLeave" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

        </form>


    </div>










    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    var clickText;

    $(function() {
        $("#simple-search").change(function() {
            let dateValue = $(this).val();
            console.log(dateValue);

            $("#myForm").append(
                $('<input>').attr({
                    type: 'date',
                    name: 'grantDay',
                    value: dateValue
                })
            );
        })

        $("#actionsDropdownButton").click(function() {
            let dataValue = $("#simple-search").val();
            if (dataValue != null) {
                $("#myForm").submit();
            }else{
                alert("날짜를 입력해주세요.");
            }
        })

        $("#simple-search2").change(function(){
            let textValue=$(this).val();
            console.log(textValue);


            $("#myForm2").append(
                $('<input>').attr({
                    type: 'text',
                    name: 'grantDate',
                    value: textValue
                })
            );
        })
        $("#actionsDropdownButton2").click(function() {
            $("#myForm2").submit();
        })

        // $("#modalBtn").click(function (){
        //     $("#crypto-modal").display();
        //
        // })

        $("#multi-dropdown ul li").click(function (){
             clickText = $(this).text().trim();
            console.log(clickText);

            var leaveTypeInput = $('#updateLeave input[name="leaveType"]');
            if (leaveTypeInput.length === 0) {
                // leaveType 입력 필드가 존재하지 않으면 새로 추가
                $('<input>').attr({
                    type : "hidden",
                    name : "leaveType",
                    value : clickText
                }).appendTo("#updateLeave");
            } else {
                leaveTypeInput.val(clickText);
            }

            var updateLeaveEmail = $('#updateLeaveEmailSend input[name="leaveType"]');
            if (updateLeaveEmail.length === 0) {
                // updateLeaveEmail 입력 필드가 존재하지 않으면 새로 추가
                $('<input>').attr({
                    type : "hidden",
                    name : "leaveType",
                    value : clickText
                }).appendTo("#updateLeaveEmailSend");
            } else {
                updateLeaveEmail.val(clickText);
            }

            if (clickText === "출산휴가") {
                $("#guideMessage").text("출산휴가는 출산일을 기준으로 전후 45일씩 부여");
            }else if(clickText ==="가족 돌봄휴가"){
                $("#guideMessage").text("근로 기간이 6개월 이상인 근로자, 연간  최대 90일(1회 사용기간 30일 이상,  90일 중 10일은 하루단위로 사용가능)");
            }else if(clickText ==="병가"){
                $("#guideMessage").text("진단서 및 진료확인서 제출자 또는 제출 예정인자 ");
            }else if(clickText ==="보건휴가"){
                $("#guideMessage").text("여성근로자가 청구하면 월 1일의 생리휴가 부여");
            }

            $("#multiLevelDropdownButton").text(clickText);
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
               /* var lt_days = empRow.find("#lt_days").text();*/
                var email = empRow.find("#email").text();
                var job = empRow.find("#job").text();

                console.log("empNum : " + empNum);
                console.log("empName :" + empName);
                console.log("email :" + email);
                console.log("직책 : " + job);
             /*   console.log("lt_days :" + lt_days);*/
                $('<input>').attr({
                    type : "hidden",
                    name : "empNum",
                    value : empNum
                }).appendTo("#updateLeave");

                $('<input>').attr({
                    type : "hidden",
                    name : "empName",
                    value : empName
                }).appendTo("#updateLeave");

                $('<input>').attr({
                    type : "hidden",
                    name : "email",
                    value : email
                }).appendTo("#updateLeave");

                $('<input>').attr({
                    type : "hidden",
                    name : "job",
                    value : job
                }).appendTo("#updateLeave");

                //이메일
                $('<input>').attr({
                    type : "hidden",
                    name : "empNum",
                    value : empNum
                }).appendTo("#updateLeaveEmailSend");

                $('<input>').attr({
                    type : "hidden",
                    name : "empName",
                    value : empName
                }).appendTo("#updateLeaveEmailSend");

                $('<input>').attr({
                    type : "hidden",
                    name : "email",
                    value : email
                }).appendTo("#updateLeaveEmailSend");

                $('<input>').attr({
                    type : "hidden",
                    name : "job",
                    value : job
                }).appendTo("#updateLeaveEmailSend");


            }else {
                $('#updateLeave input[name="empNum"]').remove();
                $('#updateLeave input[name="empName"]').remove();
                $('#updateLeave input[name="email"]').remove();
                $('#updateLeave input[name="job"]').remove();

                    //이메일
                $('#updateLeaveEmailSend input[name="empNum"]').remove();
                $('#updateLeaveEmailSend input[name="empName"]').remove();
                $('#updateLeaveEmailSend input[name="email"]').remove();
                $('#updateLeaveEmailSend input[name="job"]').remove();
            }


        });
        $("#price").change(function (){

            $('#updateLeave input[name="lt_days"]').remove();
            $('#updateLeaveEmailSend input[name="lt_days"]').remove();
            var price = parseFloat($(this).val());
                console.log(price);

            $('<input>').attr({
                type : "hidden",
                name : "lt_days",
                value : price
            }).appendTo("#updateLeave");

            $('<input>').attr({
                type : "hidden",
                name : "lt_days",
                value : price
            }).appendTo("#updateLeaveEmailSend");

        })

        $("#userManagerBTN").click(function (event){
            event.preventDefault();

           let leaveType =   $('#updateLeave input[name="leaveType"]').val();
           let empNum =  $('#updateLeave input[name="empNum"]').val();
           let empName =   $('#updateLeave input[name="empName"]').val();
           let email = $('#updateLeave input[name="email"]').val();
           let lt_days =  $('#updateLeave input[name="lt_days"]').val();
            let job =  $('#updateLeave input[name="job"]').val();
            let message = $('#message').val();
            let emailCheckboxChecked = $('#link-checkbox').prop('checked');


            if(leaveType == null || empNum==null || empName==null || email==null || lt_days ==null ){
                alert("업데이트할 사원, 휴가명, 휴가일수를 선택해주세요.");
            }else {
                $("#updateLeave").submit();
                alert("이메일 발송");
                if (emailCheckboxChecked) {
                    $.ajax({
                        url: "/email/updateLeaveSend",
                        method: "POST",
                        data: {
                            leaveType: leaveType,
                            empNum: empNum,
                            empName: empName,
                            email: email,
                            lt_days: lt_days,
                            job: job,
                            message:message
                        },
                        <%--headers: {--%>
                        <%--    "${_csrf.parameterName}": "${_csrf.token}"--%>
                        <%--},--%>
                        success: function(response) {
                            alert("사원번호가 " + response.empNum + "인 " + response.empName + "님한테 휴가 부여 메일을 보냈습니다.");
                        },
                        error: function(xhr, status, error) {
                            console.error(error);
                            alert("휴가 부여 메일 전송 중 오류가 발생했습니다.");
                        }
                    });
                }
            }
        })

        $('.tdCheck').click(function(){
            $('.tdCheck').not(this).prop('checked', false);
        });
        $("#leaveList1").click(function(){

            $("#leaveList").toggle();
        });
        $("#updateLeave").submit(function (){
            let empName1 = $('#updateLeave input[name="empName"]').val();
            let  ltDays1 = $('#updateLeave input[name="lt_days"]').val();

            alert(empName1 + "님 한테 " + clickText + "를 " + ltDays1 + "일 부여하였습니다.");
        })
        // $("#updateLeaveEmailSend").submit(function (){
        //     let empNum = $('#updateLeave input[name="empNum"]').val();
        //     let empName1 = $('#updateLeave input[name="empName"]').val();
        //     alert("사원번호가 "+empNum+"인 "+ empName1+"님한테 휴가 부여 메일을 보냈습니다.");
        //
        // });

        // $("#modalBtn2").click(function (){
        //         $("#static-modal").show();
        //
        // })



    });

</script>

<%@include file="footer.jsp"%>
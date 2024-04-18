<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="ShareView/sideBar.jsp" %>

<link rel="dns-prefetch" href="//unpkg.com"/>
<link rel="dns-prefetch" href="//cdn.jsdelivr.net"/>


<%--<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js" defer></script>--%>
<%--<script src="https://cdn.tailwindcss.com"></script>--%>

<div class="p-1 sm:ml-64">


    <div class="antialiased sans-serif bg-gray-100 h-full">

        <div x-data="app()" x-init="[initDate(), getNoOfDays()]" x-cloak>
            <div class="container mx-auto px-4 py-2 md:py-20">


                <!-- 캘린더 상단 추가 메뉴바 -->

                <!-- 차트 -->
                <div class="flex items-center justify-center h-48 mb-4 rounded bg-gray-50 dark:bg-gray-100">
                    <p class="text-2xl text-gray-400 dark:text-gray-100">
                    <div class="flex items-center justify-center h-48 mb-4 rounded bg-gray-50 dark:bg-gray-100">
                        <div id="chart" class="w-full" style="height: 200px;"></div>
                    </div>

                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M9 1v16M1 9h16"/>
                    </svg>
                    </p>
                </div>

                <div class="border-gray-200 border-dashed rounded-lg dark:border-gray-700 ">
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-100">
                                <svg class="w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                     fill="none" viewBox="0 0 18 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                          stroke-width="2" d="M9 1v16M1 9h16"/>
                                </svg>
                            </p>
                        </div>
                        <div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-100">
                                <svg class="w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                     fill="none" viewBox="0 0 18 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                          stroke-width="2" d="M9 1v16M1 9h16"/>
                                </svg>
                            </p>
                        </div>
                        <div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-100">
                                <svg class="w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                     fill="none" viewBox="0 0 18 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                          stroke-width="2" d="M9 1v16M1 9h16"/>
                                </svg>
                            </p>
                        </div>
                    </div>

                    <!-- <div class="font-bold text-gray-800 text-xl mb-4">
                Schedule Tasks
            </div> -->

                    <!-- Calendar 상단 메뉴바 -->





                    <script>

                        $(document).ready(function() {

                            //시작일, 종료일 다를때 고를 수 없음
                            $('#startDate, #endDate,#leaveType').change(function() {
                                calculateLeaveDays();
                            });
                            $('#startDate1, #endDate1,#leaveType1').change(function() {
                                calculateLeaveDays1();
                            });

                            function calculateLeaveDays() {
                                var startDateValue = $('#startDate').val(); // input 요소의 값을 가져옴
                                var startDate = new Date(startDateValue); // 값에서 Date 객체 생성
                                var endDateValue = $('#endDate').val(); // input 요소의 값을 가져옴
                                var endDate = new Date(endDateValue); // 값에서 Date 객체 생성
                                var leaveType = $('#leaveType').val(); // 휴가 유형

                                if (startDate && endDate) {
                                    if(startDate.getTime() !== endDate.getTime()) {
                                        if (leaveType === '반차' || leaveType === '반반차') {
                                            alert('시작일과 종료일이 다를 때 반차나 반반차는 선택할 수 없습니다.\n다른 값을 선택해주세요.');
                                            $('#leaveType').val('휴가 유형 선택하세요'); // 휴가 유형을 연차로 변경합니다.
                                            return; // 함수 종료
                                        }
                                    }
                                }
                            }
                            function calculateLeaveDays1() {
                                var startDateValue1 = $('#startDate1').val(); // input 요소의 값을 가져옴
                                var startDate1 = new Date(startDateValue1); // 값에서 Date 객체 생성
                                var endDateValue1 = $('#endDate1').val(); // input 요소의 값을 가져옴
                                var endDate1 = new Date(endDateValue1); // 값에서 Date 객체 생성
                                var leaveType1 = $('#leaveType1').val(); // 휴가 유형

                                if (startDate1 && endDate1) {
                                    if(startDate1.getTime() !== endDate1.getTime()) {
                                        if (leaveType1 === '반차' || leaveType1 === '반반차') {
                                            alert('시작일과 종료일이 다를 때 반차나 반반차는 선택할 수 없습니다.\n다른 값을 선택해주세요.');
                                            $('#leaveType1').val('휴가 유형 선택하세요'); // 휴가 유형을 연차로 변경합니다.
                                            return; // 함수 종료
                                        }
                                    }
                                }
                            }

                        });

                    </script>


                    <style>
                        [x-cloak] {
                            display: none;
                        }

                    </style>

                    <%-------------------캘린더 시작----------------------------------------------------------------------------------------------------------------------------------------------%>
                    <%-------------------캘린더 시작----------------------------------------------------------------------------------------------------------------------------------------------%>
                    <%-------------------캘린더 시작----------------------------------------------------------------------------------------------------------------------------------------------%>
                    <%-------------------캘린더 시작----------------------------------------------------------------------------------------------------------------------------------------------%>

                    <div class=" ">
                    <div x-data="app()" class="">
                        <div class="antialiased sans-serif bg-gray-100 h-screen">
                            <div x-data="app()" x-init="[initDate(), getNoOfDays()]" x-cloak>
                                <div class="container mx-auto py-2 ">
                                    <div class="bg-white rounded-lg shadow overflow-hidden">
                                        <div class="flex items-center justify-between py-2 px-6">
                                            <div>
							<span x-text="MONTH_NAMES[month]"
                                  class="text-lg font-bold text-gray-800"></span> <span
                                                    x-text="year" class="ml-1 text-lg text-gray-600 font-normal"></span>
                                            </div>
                                            <div class="flex flex-grow justify-end">
                                                <button id="defaultModalButton" @click="showEventModal"
                                                        class="text-white focus:ring-1 focus:ring-blue-200 font-medium rounded-lg text-sm px-2 py-2 dark:bg-gray-600 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800 ml-auto mr-2 flex items-center"
                                                        type="button">
                                                    <svg class="mt-0.2 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd"
                                                              d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
                                                              clip-rule="evenodd"></path>
                                                    </svg>
                                                </button>
                                                <div class="border rounded-lg px-1" style="padding-top: 2px;">
                                                    <button type="button"
                                                            class="leading-none rounded-lg transition ease-in-out duration-100 inline-flex cursor-pointer hover:bg-gray-200 p-1 items-center"
                                                            :class="{'cursor-not-allowed opacity-25': month == 0 }"
                                                            :disabled="month == 0 ? true : false"
                                                            @click="month--; getNoOfDays()">
                                                        <svg class="h-6 w-6 text-gray-500 inline-flex leading-none"
                                                             fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                            <path stroke-linecap="round"
                                                                  stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                                                        </svg>
                                                    </button>
                                                    <div class="border-r inline-flex h-6"></div>
                                                    <button type="button"
                                                            class="leading-none rounded-lg transition ease-in-out duration-100 inline-flex items-center cursor-pointer hover:bg-gray-200 p-1"
                                                            :class="{'cursor-not-allowed opacity-25': month == 11 }"
                                                            :disabled="month == 11 ? true : false"
                                                            @click="month++; getNoOfDays()">
                                                        <svg class="h-6 w-6 text-gray-500 inline-flex leading-none"
                                                             fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                            <path stroke-linecap="round"
                                                                  stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                                                        </svg>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="-mx-1 -mb-1">

                                            <div class="flex flex-wrap" style="margin-bottom: -40px;">
                                                <template x-for="(day, index) in DAYS" :key="index">
                                                    <div style="width: 14.26%" class="px-2 py-2">
                                                        <div x-text="day"
                                                             class="text-gray-600 text-sm uppercase tracking-wide font-bold text-center">
                                                        </div>
                                                    </div>
                                                </template>
                                            </div>

                                            <div class="flex flex-wrap border-t border-l">
                                                <template x-for="blankday in blankdays">
                                                    <div style="width: 14.28%; height: 120px"
                                                         class="text-center border-r border-b px-4 pt-2"></div>
                                                </template>
                                                <template x-for="(sDate, dateIndex) in no_of_days"
                                                          :key="dateIndex">
                                                    <div style="width: 14.28%; height: 120px"
                                                         class="px-4 pt-2 border-r border-b relative">
                                                        <div @click="showEventModal(sDate)" x-text="sDate"
                                                             class="inline-flex w-6 h-6 items-center justify-center cursor-pointer text-center leading-none rounded-full transition ease-in-out duration-100"
                                                             :class="{'bg-gray-800 text-white': isToday(sDate) == true, 'text-gray-700 hover:bg-gray-300': isToday(sDate) == false ,'text-red-500': isWeekend(sDate)}">
                                                        </div>

                                                        <div style="height: 80px;" class="overflow-y-auto mt-1">
                                                            <template x-for="(event, eventIndex) in events" :key="eventIndex">
                                                                <div x-show="isVisible(sDate, event)" x-text="event.empNum  + '  [' +event.leaveType  + ']'"
                                                                     @click="showEventDetails(event)"
                                                                     class="px-1 py-1 rounded-lg mt-1 cursor-pointer text-xs transition ease-in-out duration-100 leading-tight overflow-hidden truncate"
                                                                     :class="{
                                                'rounded-t-lg': eventIndex == 0,
                                                'rounded-b-lg': eventIndex == events.length - 1,
                                                'bg-blue-100 text-blue-800 border border-blue-500': event.leaveType == '연차',
                                                'bg-red-100 text-red-800 border border-red-500': event.leaveType == '반차',
                                                'bg-yellow-100 text-yellow-800 border border-yellow-500': event.leaveType == '반반차',
                                                'bg-green-100 text-green-800 border border-green-500': event.leaveType == '병가',
                                                'bg-purple-100 text-purple-800 border border-purple-500': event.leaveType == '가족돌봄휴가',
                                                'bg-indigo-100 text-indigo-800 border border-indigo-500': event.leaveType == '출산휴가'
                                            }">

                                                                </div>
                                                            </template>
                                                        </div>
                                                    </div>
                                                </template>
                                            </div>
                                        </div>
                                    </div>
                                </div>




                                <%-------------------Modal 시작----------------------------------------------------------------------------------------------------------------------------------------------%>
                                <%-------------------Modal 시작----------------------------------------------------------------------------------------------------------------------------------------------%>
                                <%-------------------Modal 시작----------------------------------------------------------------------------------------------------------------------------------------------%>
                                <%-------------------Modal 시작----------------------------------------------------------------------------------------------------------------------------------------------%>
                                <!-- Modal 시작 -->
                                <div x-show.transition.opacity="isEventModalOpen"
                                     @click="isEventModalOpen = false"
                                     class="fixed bg-gray-800 bg-opacity-50  top-0 left-0 w-full h-full flex items-center justify-center z-50">
                                    <div @click.stop
                                         class="bg-white rounded-2xl border-2 border-blue-500 overflow-auto w-1/3 h-1/4 p-10 ">
                                        <!-- 		class="flex justify-between items-center pb-4 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600"> -->

                                        <h1 class="text-xl font-bold mb-4">휴가 신청</h1>
                                        <div class="flex items-center mb-4">
                                            <form action="${pageContext.request.contextPath}/leave/register" method="post">
                                                <div class="grid gap-4 mb-4 sm:grid-cols-2">
                                                    <!-- 사원선택 -->
                                                    <div>
                                                        <label for="empNum"
                                                               class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">사원
                                                            번호</label> <input type="text" name="empNum" id="empNum"
                                                                              class="bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                                                              placeholder="사원 번호를 입력하세요" required="">
                                                    </div>
                                                    <!-- 부서 선택  -->
                                                    <div></div>
                                                    <!-- 날짜선택 -->
                                                    <div date-rangepicker class="flex items-center">
                                                        <!-- 휴가 시작 날짜 -->
                                                        <div class="relative">
                                                            <%--@declare id="datepicker"--%><label for="datepicker"
                                                                                                   class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">휴가
                                                            시작일</label>
                                                            <div
                                                                    class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                                                                <svg class="mt-6 w-4 h-4 text-gray-500 dark:text-gray-400"
                                                                     aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                                     fill="currentColor" viewBox="0 0 20 20">
                                                                    <path
                                                                            d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z"></path>
                                                                </svg>
                                                            </div>
                                                            <label for="datepicker"></label> <label for="startDate"></label><input name="startDate"
                                                                                                                                   type="text"
                                                                                                                                   class="mt-6 bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                                                                                                                   id="startDate" placeholder="    시작일 선택하세요">
                                                        </div>
                                                        <!-- 휴가 시작 날짜  끝 -->
                                                        <span class="mt-6 mx-4 text-gray-500">to</span>
                                                        <!-- 휴가 종료 날짜 -->
                                                        <div class="relative">
                                                            <label for="datepicker"
                                                                   class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">휴가
                                                                종료일</label>
                                                            <div
                                                                    class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                                                                <svg class="mt-6 w-4 h-4 text-gray-500 dark:text-gray-400"
                                                                     aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                                     fill="currentColor" viewBox="0 0 20 20">
                                                                    <path
                                                                            d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z"></path>
                                                                </svg>
                                                            </div>
                                                            <label for="datepicker"></label> <input id="endDate"
                                                                                                    name="endDate" type="text"
                                                                                                    class="mt-6 bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                                                                                    placeholder="    종료일 선택하세요">
                                                        </div>
                                                        <!-- 휴가 종료 날짜  끝 -->
                                                    </div>
                                                    <!-- 휴가 유형 선택 -->
                                                    <div>
                                                        <label for="leaveType"
                                                               class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">휴가
                                                            유형</label> <select id="leaveType" name="leaveType"
                                                                               class="mt-6 bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                                        <option selected="">휴가 유형 선택하세요</option>
                                                        <option value="반차">반차</option>
                                                        <option value="반반차">반반차</option>
                                                        <option value="연차">연차</option>
                                                        <option value="병가">병가</option>
                                                        <option value="출산휴가">출산휴가</option>
                                                        <option value="가족돌봄휴가">가족돌봄휴가</option>
                                                    </select>
                                                    </div>

                                                    <div class="sm:col-span-2">
                                                        <%--@declare id="description"--%><label for="description"
                                                                                                class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">휴가
                                                        사유</label>

                                                        <label for="leaveReason"></label><textarea id="leaveReason" name="leaveReason" rows="4"
                                                                                                   class="block p-2.5 w-full text-sm text-gray-900 bg-gray-100 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                                                                                   placeholder="휴가 사유를 작성해 주세요"></textarea>
                                                    </div>

                                                </div>
                                                <button type="submit"
                                                        class="bg-blue-500 text-white px-4 py-2 rounded-lg mr-2 hover:bg-blue-800 hover:text-white-900">Save</button>
                                                <!-- <button @click="isEventModalOpen = false"
                                                class="bg-gray-200 text-gray-800 px-4 py-2 rounded-lg">Cancel</button> -->
                                                <button @click="isEventModalOpen = false"
                                                        class="px-5 py-2 text-gray-800 bg-gray-300 hover:bg-gray-800 hover:text-white-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center hover:bg-gray-600 hover:text-white"
                                                        x-on:click="openEventModal = !openEventModal">
                                                    Close
                                                    <path fill-rule="evenodd"
                                                          d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                          clip-rule="evenodd"></path>
                                                </button>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                                <!-- /Modal 끝 -->
                                <%-------------------Modal 끝----------------------------------------------------------------------------------------------------------------------------------------------%>
                                <%-------------------Modal 끝----------------------------------------------------------------------------------------------------------------------------------------------%>
                                <%-------------------Modal 끝----------------------------------------------------------------------------------------------------------------------------------------------%>
                                <%-------------------Modal 끝----------------------------------------------------------------------------------------------------------------------------------------------%>

                                <div x-show.transition.opacity="isEventDetailsModalOpen"
                                     class="fixed bg-gray-800 bg-opacity-50 top-0 left-0 w-full h-full flex items-center justify-center z-50">
                                    <div @click="isEventDetailsModalOpen = false"
                                         class="bg-white rounded-2xl border-2 border-blue-500 overflow-auto w-1/5 h-1/3 p-10">
                                        <div class="flex justify-center items-center mt-8">
                                            <img class="w-24 h-24 rounded-full border-2"
                                                 src="/img/profilePhoto/<sec:authentication property='principal.emp.empNum'/>.png" alt="user photo">
                                        </div>

                                        <div class="text-center">
                                            <div>
                                                <form action="/leave/remove" method="post">
								<span class="text-xl font-bold mb-4"
                                      x-text="'[' + selectedEvent.empNum + ']'"></span> <span
                                                        class="text-xl  mb-2" x-text="'사원의 휴가 내역'"></span><br> <input
                                                        type="hidden" id="leaveNum" name="leaveNum"
                                                        :value="selectedEvent.leaveNum"/> <br>
                                                    <h2 x-text="'시작 날짜: '+selectedEvent.sDate"
                                                        class="text-base text-red-600 mb-4 border-2 border-gray-400 mx-10 rounded-lg"></h2>
                                                    <h2 x-text="'종료 날짜: '+selectedEvent.eDate"
                                                        class="text-base text-red-600 mb-4 border-2 border-gray-400 mx-10 rounded-lg"></h2>

                                                    <br>
                                                    <h3
                                                            style="margin-top: 0.5em; border-top: 2px solid #ccc; border-left: 2px solid #ccc; border-right: 2px solid #ccc; border-bottom: none;"
                                                            x-text="'휴가 사유 '"
                                                            class="text-base text-black-600 font-bold mb-4 rounded-lg"></h3>

                                                    <div class="max-w-xl mx-auto">
                                                        <h3
                                                                style="margin-top: -0.5em; border-top: none; border-left: 2px solid #ccc; border-right: 2px solid #ccc; border-bottom: 2px solid #ccc;"
                                                                x-text="selectedEvent.leaveReason"
                                                                class="text-base text-black-600 mb-4 rounded-lg"></h3>
                                                    </div>



                                                    <button @click="openEditModal(selectedEvent)" type="button"
                                                            class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-700">수정</button>
                                                    <button type="submit" id="deletebtn"
                                                            class="bg-red-500 text-white px-4 py-2 rounded-lg  hover:bg-red-700">삭제</button>
                                                    <button @click="isEventDetailsModalOpen = false" type="button"
                                                            class="bg-gray-200 text-gray-800 px-4 py-2 rounded-lg mt-2 hover:bg-gray-300">취소</button>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div x-show.transition.opacity="isEditModalOpen"
                                     class="fixed bg-gray-800 bg-opacity-50 top-0 left-0 w-full h-full flex items-center justify-center z-50">
                                    <div @click.stop
                                         class="bg-white rounded-2xl border-2 border-blue-500 overflow-auto w-1/4 h-1/3 p-10">
                                        <h2 class="text-xl font-bold mb-4">휴가 수정</h2>
                                        <form action="/leave/modify" method="post">
                                            <div x-show="empNumModifyClose">
                                                <label for="editEmpNum"
                                                       class="block text-sm font-medium text-gray-700"></label> <input
                                                    type="text" id="editEmpNum" x-model="editedEvent.empNum"
                                                    class="mt-1 p-2 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50">
                                                <input type="hidden" x-model="editedEvent.leaveNum"
                                                       name="leaveNum">
                                            </div>



                                            <div date-rangepicker class="flex items-center">
                                                <!-- 휴가 시작 날짜 -->
                                                <div class="relative">
                                                    <label for="datepicker"
                                                           class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">휴가
                                                        시작일</label>
                                                    <div
                                                            class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                                                        <svg class="mt-6 w-4 h-4 text-gray-500 dark:text-gray-400"
                                                             aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                             fill="currentColor" viewBox="0 0 20 20">
                                                            <path
                                                                    d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
                                                        </svg>
                                                    </div>
                                                    <label for="datepicker"></label> <input name="startDate"
                                                                                            type="text"
                                                                                            class="mt-6 bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                                                                            id="startDate1" placeholder="    시작일 선택하세요">
                                                </div>
                                                <!-- 휴가 시작 날짜  끝 -->
                                                <span class="mt-6 mx-4 text-gray-500">to</span>
                                                <!-- 휴가 종료 날짜 -->
                                                <div class="relative">
                                                    <label for="datepicker"
                                                           class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">휴가
                                                        종료일</label>
                                                    <div
                                                            class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                                                        <svg class="mt-6 w-4 h-4 text-gray-500 dark:text-gray-400"
                                                             aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                             fill="currentColor" viewBox="0 0 20 20">
                                                            <path
                                                                    d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
                                                        </svg>
                                                    </div>
                                                    <label for="datepicker"></label> <input id="endDate1"
                                                                                            name="endDate" type="text"
                                                                                            class="mt-6 bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                                                                            placeholder="    종료일 선택하세요">
                                                </div>
                                                <!-- 휴가 종료 날짜  끝 -->
                                            </div>
                                            <!-- 휴가 유형 선택 -->
                                            <div>
                                                <label for="leaveType"
                                                       class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">휴가유형</label>
                                                <select id="leaveType1" name="leaveType"
                                                        class="mt-6 bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                                    <option selected="">휴가 유형 선택하세요</option>
                                                    <option value="반차">반차</option>
                                                    <option value="반반차">반반차</option>
                                                    <option value="연차">연차</option>
                                                    <option value="병가">병가</option>
                                                    <option value="출산휴가">출산휴가</option>
                                                    <option value="가족돌봄휴가">가족돌봄휴가</option>
                                                </select>
                                            </div>
                                            <!-- 휴가 유형 선택  끝 -->

                                            <div class="mt-4">
                                                <label for="editLeaveReason"
                                                       class="block text-sm font-medium text-gray-700">휴가 사유</label>
                                                <textarea id="editLeaveReason" x-model="editedEvent.leaveReason"
                                                          name="leaveReason"
                                                          class="mt-1 p-2 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50"></textarea>
                                            </div>
                                            <div class="mt-4 flex justify-end">
                                                <div class="text-center">
                                                    <button type="submit"
                                                            class="bg-blue-500 text-white px-4 py-2 rounded-lg">저장</button>
                                                    <button @click="isEditModalOpen = false" type="button"
                                                            class="mr-2 bg-gray-200 text-gray-800 px-4 py-2 rounded-lg"
                                                            style="display: inline-block; text-align: center;">취소</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>















                </div>

            </div>
        </div>
    </div>
</div>

</body>
<!-- /Modal -->


<script>
    const MONTH_NAMES = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    const DAYS = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    const Chart = toastui.Chart;
    const el = document.getElementById('chart');
    const data = {
        categories: ['Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        series: [
            {
                name: 'Department 01',
                data: [5000, 3000, 5000, 7000, 6000, 4000, 1000]
            },
            {
                name: 'Department 02',
                data: [8000, 4000, 7000, 2000, 6000, 3000, 5000]
            },
            {
                name: 'Department 03',
                data: [4000, 4000, 6000, 3000, 4000, 5000, 7000]
            },
            {
                name: 'Department 04',
                data: [3000, 4000, 3000, 1000, 2000, 4000, 3000]
            }
        ]
    };
    const options = {
        chart: {width: 1500, height: 205},
    };

    const chart = Chart.columnChart({el, data, options});


    function app() {
        return {
            month: '',
            year: '',
            no_of_days: [],
            blankdays: [],
            days: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],

            events: [
                {
                    event_date: new Date(2024, 2, 16),
                    event_title: "April Fool's Day",
                    event_theme: 'blue'
                },

                {
                    event_date: new Date(2024, 2, 10),
                    event_title: "Birthday",
                    event_theme: 'red'
                },

                {
                    event_date: new Date(2024, 2, 16),
                    event_title: "Upcoming Event",
                    event_theme: 'green'
                }
            ],
            event_title: '',
            event_date: '',
            event_theme: 'blue',

            themes: [
                {
                    value: "blue",
                },
                {
                    value: "red",
                    label: "Red Theme"
                },
                {
                    value: "yellow",
                    label: "Yellow Theme"
                },
                {
                    value: "green",
                    label: "Green Theme"
                },
                {
                    value: "purple",
                    label: "Purple Theme"
                }
            ],

            openEventModal: false,

            initDate() {
                let today = new Date();
                this.month = today.getMonth();
                this.year = today.getFullYear();
                this.datepickerValue = new Date(this.year, this.month, today.getDate()).toDateString();
            },

            isToday(date) {
                const today = new Date();
                const d = new Date(this.year, this.month, date);

                return today.toDateString() === d.toDateString() ? true : false;
            },

            showEventModal(date) {
                // open the modal
                this.openEventModal = true;
                this.event_date = new Date(this.year, this.month, date).toDateString();
            },

            addEvent() {
                if (this.event_title == '') {
                    return;
                }

                this.events.push({
                    event_date: this.event_date,
                    event_title: this.event_title,
                    event_theme: this.event_theme
                });

                console.log(this.events);

                // clear the form data
                this.event_title = '';
                this.event_date = '';
                this.event_theme = 'blue';

                //close the modal
                this.openEventModal = false;
            },

            getNoOfDays() {
                let daysInMonth = new Date(this.year, this.month + 1, 0).getDate();

                // find where to start calendar day of week
                let dayOfWeek = new Date(this.year, this.month).getDay();
                let blankdaysArray = [];
                for (var i = 1; i <= dayOfWeek; i++) {
                    blankdaysArray.push(i);
                }

                let daysArray = [];
                for (var i = 1; i <= daysInMonth; i++) {
                    daysArray.push(i);
                }

                this.blankdays = blankdaysArray;
                this.no_of_days = daysArray;
            }
        }

        function app() {
            return {
                // 이하 생략

                // addEvent() {
                //     if (this.empNum == '' || this.deptNum == '' || this.startDate == '' || this.endDate == '' || this.leaveType == '') {
                //         alert('모든 필드를 입력하세요.');
                //         return;
                //     }

                //     this.events.push({
                //         event_date: this.startDate,
                //         event_title: this.leaveType,
                //         event_theme: 'blue' // 이벤트 테마는 원하는 대로 설정할 수 있습니다.
                //     });

                //     // 캘린더를 다시 렌더링하여 새로운 이벤트를 표시합니다.
                //     this.getNoOfDays();

                //     // 입력 폼 초기화
                //     this.empNum = '';
                //     this.deptNum = '';
                //     this.startDate = '';
                //     this.endDate = '';
                //     this.leaveType = '';
                //     this.leaveReason = '';

                //     // 모달창 닫기
                //     this.openEventModal = false;
                // },
            }
        }


    }
</script>

<script>
    // 스크립트에 isWeekend 함수 추가
    function isWeekend(date) {
        const dayOfWeek = new Date(this.year, this.month, date).getDay();
        return dayOfWeek === 0 || dayOfWeek === 6; // 일요일(0) 또는 토요일(6)일 때 true 반환
    }

    function app() {
        return {
            showEventModal(date = null) {
                this.isEventModalOpen = true;
                this.openEventModal = true;
                if (date) {
                    this.eventsDate = new Date(this.year, this.month, date);
                }
            },
            showEventDetails(event) {
                this.selectedEvent = event;
                this.isEventDetailsModalOpen = true;
            },
            isVisible(date, event) {
                const startDate = new Date(event.sDate);
                const endDate = new Date(event.eDate);
                const eventsDate = new Date(this.year, this.month, date + 1);

                // endDate를 하루 뒤로 설정
                endDate.setDate(endDate.getDate() + 1);

                return startDate <= eventsDate && eventsDate <= endDate;
            }

            ,
            isToday(date) {
                const today = new Date();
                const d = new Date(this.year, this.month, date);
                return today.toDateString() === d.toDateString();
            },

            eventempNum: '',
            eventsDate: new Date(),
            eventleaveType: '',
            isEventModalOpen: false,
            isEventDetailsModalOpen: false,
            selectedEvent: "",
            month: '',
            year: '',
            no_of_days: [],
            blankdays: [],
            DAYS: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
            MONTH_NAMES: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            initDate() {
                let today = new Date();
                this.month = today.getMonth();
                this.year = today.getFullYear();
            },
            isEvent(date) {
                return this.events.find(event => {
                    return event.sDate <= date && date <= event.eDate;
                });
            },
            getNoOfDays() {
                let daysInMonth = new Date(this.year, this.month + 1, 0).getDate();
                // find where to start calendar day of week
                let dayOfWeek = new Date(this.year, this.month).getDay();
                let blankdaysArray = [];
                for (var i = 1; i <= dayOfWeek; i++) {
                    blankdaysArray.push(i);
                }
                let daysArray = [];
                for (var i = 1; i <= daysInMonth; i++) {
                    daysArray.push(i);
                }
                this.blankdays = blankdaysArray;
                this.no_of_days = daysArray;
            },
            editedEvent: {}, // 수정할 이벤트
            isEventDetailsModalOpen: false,
            isEditModalOpen: false,
            empNumModifyClose: false,
            openEditModal(event) {
                this.editedEvent = {...event};
                this.isEditModalOpen = true;
            },
            saveChanges() {
                axios.post('/leave/modify', this.editedEvent)
                    .then(response => {
                        console.log('수정이 성공적으로 완료되었습니다.');
                        this.isEditModalOpen = false;
                    })
                    .catch(error => {
                        console.error('수정을 처리하는 동안 오류가 발생했습니다:', error);
                        // 오류 처리 로직 추가
                    });

                // 수정된 내용을 저장하는 로직 추가
                // 예: 서버에 수정된 데이터를 전송하고 모달을 닫음
                this.isEditModalOpen = false;
            }, deleteEvent(leaveNum) {
                console.log(leaveNum);
                axios.post('/leave/remove', {leaveNum: leaveNum})
                    .then(response => {
                        console.log('삭제가 성공적으로 완료되었습니다.');
                        this.isEventDetailsModalOpen = false; // 삭제 후 모달 닫기
                    })
                    .catch(error => {
                        console.error('삭제를 처리하는 동안 오류가 발생했습니다:', error);
                        // 오류 처리 로직 추가
                    });
            }
            ,
            events: [
                <c:forEach items="${list}" var="leave">
                {
                    empNum: '${leave.empNum}',
                    sDate: '${leave.startDate}',
                    leaveType: '${leave.leaveType}',
                    eDate: '${leave.endDate}',
                    requestDate: '${leave.requestDate}',
                    leaveReason: '${leave.leaveReason}',
                    leaveNum: '${leave.leaveNum}'

                },
                </c:forEach>
            ]
        };
    }
    // 시작일~ 종료일 : TotalDate 뽑고
    // 토,일요일이 시작일~ 종료일 안에 있을때
    //TotalDate가 안뽑히게 설정해서
    //TotalDate기준으로 캘린더에 표현하기







</script>
</body>
</html>
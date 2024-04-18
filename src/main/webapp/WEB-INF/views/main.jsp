<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="ShareView/sideBar.jsp"%>


<link rel="dns-prefetch" href="//unpkg.com" />
<link rel="dns-prefetch" href="//cdn.jsdelivr.net" />


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

                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16"/>
                    </svg>
                    </p>
                </div>

                <div class="border-gray-200 border-dashed rounded-lg dark:border-gray-700 ">
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-100">
                                <svg class="w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16"/>
                                </svg>
                            </p>
                        </div>
                        <div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-100">
                                <svg class="w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16"/>
                                </svg>
                            </p>
                        </div>
                        <div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-100">
                                <svg class="w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16"/>
                                </svg>
                            </p>
                        </div>
                    </div>

                    <!-- <div class="font-bold text-gray-800 text-xl mb-4">
                Schedule Tasks
            </div> -->

                    <!-- Calendar 상단 메뉴바 -->

                    <div class="bg-white rounded-lg shadow overflow-hidden">

                        <div class="flex items-center justify-between py-2 px-6">
                            <div>
                                <span x-text="MONTH_NAMES[month]" class="text-lg font-bold text-gray-800"></span>
                                <span x-text="year" class="ml-1 text-lg text-gray-600 font-normal"></span>
                            </div>
                            <div class="flex flex-grow justify-end">
                                <button id="defaultModalButton" @click="showEventModal"
                                        class="text-white focus:ring-1 focus:ring-blue-200 font-medium rounded-lg text-sm px-2 py-2 dark:bg-gray-600 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800 ml-auto mr-2 flex items-center"
                                        type="button">
                                    <svg class="mt-0.2 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
                                              clip-rule="evenodd"></path>
                                    </svg>
                                </button>

                                <div class="border rounded-lg px-1" style="padding-top: 2px;">

                                    <button type="button"
                                            class="leading-none rounded-lg transition ease-in-out duration-100 inline-flex cursor-pointer hover:bg-gray-200 p-1 items-center"
                                            :class="{'cursor-not-allowed opacity-25': month == 0 }"
                                            :disabled="month == 0 ? true : false" @click="month--; getNoOfDays()">

                                        <svg class="h-6 w-6 text-gray-500 inline-flex leading-none" fill="none"
                                             viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M15 19l-7-7 7-7" />
                                        </svg>
                                    </button>
                                    <div class="border-r inline-flex h-6"></div>
                                    <button type="button"
                                            class="leading-none rounded-lg transition ease-in-out duration-100 inline-flex items-center cursor-pointer hover:bg-gray-200 p-1"
                                            :class="{'cursor-not-allowed opacity-25': month == 11 }"
                                            :disabled="month == 11 ? true : false" @click="month++; getNoOfDays()">
                                        <svg class="h-6 w-6 text-gray-500 inline-flex leading-none" fill="none"
                                             viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M9 5l7 7-7 7" />
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
                                <template x-for="(date, dateIndex) in no_of_days" :key="dateIndex">
                                    <div style="width: 14.28%; height: 120px"
                                         class="px-4 pt-2 border-r border-b relative">
                                        <div @click="showEventModal(date)" x-text="date"
                                             class="inline-flex w-6 h-6 items-center justify-center cursor-pointer text-center leading-none rounded-full transition ease-in-out duration-100"
                                             :class="{'bg-gray-800 text-white': isToday(date) == true, 'text-gray-700 hover:bg-gray-300': isToday(date) == false }">
                                        </div>
                                        <div style="height: 80px;" class="overflow-y-auto mt-1">
                                            <!-- <div
                                        class="absolute top-0 right-0 mt-2 mr-2 inline-flex items-center justify-center rounded-full text-sm w-6 h-6 bg-gray-700 text-white leading-none"
                                        x-show="events.filter(e => e.event_date === new Date(year, month, date).toDateString()).length"
                                        x-text="events.filter(e => e.event_date === new Date(year, month, date).toDateString()).length"></div> -->





                                            <!-- 이벤트 추가 영역 -->
                                            <template
                                                    x-for="event in events.filter(e => new Date(e.event_date).toDateString() ===  new Date(year, month, date).toDateString() )">
                                                <div class="px-2 py-1 rounded-lg mt-1 overflow-hidden border" :class="{
                                          'border-blue-200 text-blue-800 bg-blue-100': event.event_theme === 'blue',
                                          'border-red-200 text-red-800 bg-red-100': event.event_theme === 'red',
                                          'border-yellow-200 text-yellow-800 bg-yellow-100': event.event_theme === 'yellow',
                                          'border-green-200 text-green-800 bg-green-100': event.event_theme === 'green',
                                          'border-purple-200 text-purple-800 bg-purple-100': event.event_theme === 'purple'
                                      }">
                                                    <p x-text="event.event_title"
                                                       class="text-sm truncate leading-tight"></p>
                                                </div>
                                            </template>
                                        </div>
                                    </div>
                                </template>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal -->
                <div style=" background-color: rgba(0, 0, 0, 0.5)"
                     class="fixed z-40 top-0 right-0 left-0 bottom-0 h-full w-full"
                     x-show.transition.opacity="openEventModal">
                    <div
                            class="p-4 max-w-xl mx-auto relative absolute left-0 right-0 overflow-hidden mt-24 bg-white rounded-lg shadow-lg">
                        <div class="flex justify-between items-center pb-4 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600">
                            <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
                                휴가 신청</h3>
                            <button type="button"
                                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                    x-on:click="openEventModal = !openEventModal" data-modal-toggle="defaultModal">
                                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                          clip-rule="evenodd"></path>
                                </svg>
                                <span class="sr-only">Close modal</span>
                            </button>
                        </div>
                        <!-- Modal body -->
                        <form action="/addLeaves" method="post">
                            <div class="grid gap-4 mb-4 sm:grid-cols-2">
                                <div>
                                    <label for="empNum"
                                           class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">사원 번호</label>
                                    <input type="text" name="empNum" id="empNum"
                                           class="bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-300 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                           placeholder="사원 번호를 입력하세요" required="" x-model="event_title">
                                </div>
                                <div>
                                    <label for="deptNum"
                                           class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">부서</label>
                                    <select id="category" name="deptNum" id="empNum"
                                            class="bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-300 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                        <option dark:gray-400 selected="">부서 선택</option>
                                        <option value="100">100</option>
                                        <option value="200">200</option>
                                        <option value="300">300</option>
                                        <option value="400">400</option>
                                    </select>
                                </div>
                                <div date-rangepicker class="flex items-center">
                                    <div class="relative">
                                        <!--                         <label for="price" -->
                                        <!--                            class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">신청날짜</label> -->
                                        <div
                                                class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                                            <svg class="mt-6 w-4 h-4 text-gray-500 dark:text-gray-400"
                                                 aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                 fill="currentColor" viewBox="0 0 20 20">
                                                <path
                                                        d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
                                            </svg>
                                        </div>
                                        <input name="startDate" type="text"
                                               class="mt-6 bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-300 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                               type="text" placeholder="시작">
                                    </div>
                                    <span class="mt-6 mx-4 text-gray-500">to</span>
                                    <div class="relative">
                                        <div
                                                class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                                            <svg class="mt-6 w-4 h-4 text-gray-500 dark:text-gray-400"
                                                 aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                 fill="currentColor" viewBox="0 0 20 20">
                                                <path
                                                        d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
                                            </svg>
                                        </div>
                                        <input name="End" type="text"
                                               class="mt-6 bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-300 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                               placeholder="종료">
                                    </div>
                                </div>
                                <!--                     <div> -->
                                <!--                         <label for="price" class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">Price</label> -->
                                <!--                         <input type="number" name="price" id="price" class="bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-300 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="$2999" required=""> -->
                                <!--                     </div> -->
                                <div>
                                    <!-- <label for="category"
                                class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">휴가
                                유형</label>  -->
                                    <select id="category" name="leaveType"
                                            class="mt-6 bg-gray-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-300 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                        <option selected="">휴가 유형 선택</option>
                                        <option value="연차">연차</option>
                                        <option value="병가">병가</option>
                                        <option value="출산휴가">출산휴가</option>
                                        <option value="생리휴가">생리휴가</option>
                                    </select>
                                </div>
                                <div class="sm:col-span-2">
                                    <label for="description"
                                           class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">메모</label>
                                    <textarea id="description" name="leaveReason" rows="4"
                                              class="block p-2.5 w-full text-sm text-gray-900 bg-gray-100 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-300 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                              placeholder="휴가 사유를 작성해 주세요"></textarea>
                                </div>
                            </div>
                            <button type="submit"
                                    class="text-black inline-flex items-center bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-bold rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                                <svg class="mr-1 -ml-1 w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
                                          clip-rule="evenodd"></path>
                                </svg>
                                휴가 신청
                            </button>
                        </form>
                    </div>
                </div>
            </div>


</body>
<!-- /Modal -->
</div>



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
        chart: { width: 1500, height: 205 },
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
</div>
</body>
</html>
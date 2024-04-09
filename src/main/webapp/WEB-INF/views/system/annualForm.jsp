<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="sideBar.jsp"%>

<style>

    #sessionBox{
        margin-top:70px;
    }

    #divBox {
        margin-left: 300px;
        margin-top: 100px;
    }

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

    .navigation {
        margin-left: 430px;
        margin-top: 100px;
    }

    .navigation div {
        display: inline;
        padding-bottom: 10px;
        margin-right: 50px;
    }

    .navigation div a {
        text-decoration: none;
        color: #a5a5a5;
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

    #giveDate {
        color: #333;
    }

    #giveDate:hover {
        color: #2900c5;
    }
</style>

</head>
<body>


<div class="navigation">
    <div>
        <a href="/">메인페이지</a>
    </div>
    <div>
        <a id="giveDate" href="/system/annualForm">휴가 일수 부여 설정</a>
    </div>
    <div>
        <a id="empEmail" href="/email/list">휴가 촉진 대상자</a>
    </div>
    <div>
        <a href="/leavePromote/list">휴가 촉진</a>
    </div>
    <div>
        <a id="policyNav" href="/leavePolicy/list">휴가 정책</a>
    </div>
</div>




<form id="myForm" action="leaveGrant" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>



<form id="myForm2" action="annualNumSetting" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>


<form id="manualBtn" action="annualLeave" method="post">
    <!-- 	<input type="submit" value="관리자 수동 등록"> --> <input type="hidden"
                                                                name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>


<div id="sessionBox">
    <section class="bg-gray-50 dark:bg-gray-900  h-screen flex items-center">
        <div class="max-w-screen-xl px-4 mx-auto lg:px-12 w-full">
            <!-- Start coding here -->
            <div
                    class="relative bg-white shadow-md dark:bg-gray-800 sm:rounded-lg">
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
                                       placeholder="부여할 휴가일수를 입력하세요. ex)15" required="">
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


        </div>
    </section>
</div>


</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
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
            $("#myForm").submit();
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

    });
</script>

<%@include file="footer.jsp"%>
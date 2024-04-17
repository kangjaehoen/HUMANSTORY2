<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

    <script src="https://cdn.tailwindcss.com"></script>
    <title>Insert title here</title>
    <style>

    </style>
</head>
<body>

<div class="min-h-screen bg-white flex flex-col justify-center sm:py-12">
    <div class="p-10 xs:p-0 mx-auto md:w-full md:max-w-md">
        <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">

            <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                <img class="mx-auto h-100 w-auto" src="img/hs.logo.png?color=indigo&shade=600" alt="Your Company">
                <h2 class="mt-10 text-center text-1xl font-bold leading-9 tracking-tight text-gray-900">HUMAN STORY 휴가 관리 시스템</h2>
            </div>
            <div class="bg-gray-100 shadow w-full rounded-lg divide-y divide-gray-200">
                <div class="px-5 py-7">
                    <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                         <form class="space-y-6" action="/customlogin" method="POST">
                            <div>
                                <label for="empNum" class="block text-sm font-medium leading-6 text-gray-900">사원번호</label>
                                <div class="mt-2">
                                    <input id="empNum" name="username" type="text" autocomplete="email" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                </div>
                            </div>

                            <div>

                                <div class="flex items-center justify-between">
                                    <label for="pw" class="block text-sm font-medium leading-6 text-gray-900">비밀번호</label>

                                </div>
                                <div class="mt-2">
                                    <input id="pw" name="password" type="password" autocomplete="current-password" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                </div>
                            </div>
                            <div class="text-sm" style="float: right; ">
                                <a href="/joinForm">회원가입</a>
                <%--                <a href="#" class="font-semibold text-indigo-600 hover:text-indigo-500">비밀번호 찾기</a>--%>
                            </div>
                                <div>
                                    <label class="inline-flex items-center cursor-pointer"><input id="customCheckLogin" type="checkbox" class="form-checkbox border-0 rounded text-blueGray-700 ml-1 w-5 h-5 ease-linear transition-all duration-150"><span class="ml-2 text-sm font-semibold text-blueGray-600">로그인 상태 유지</span></label>
                                </div>

                                <div>
                                    <button type="submit"
                                            class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                                            >
                                        로그인</button>
                                </div>
                         </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>


</script>
</html>


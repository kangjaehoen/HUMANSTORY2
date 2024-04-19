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
</head>
<body>
<div class="h-screen md:flex">
    <div
            class="relative overflow-hidden md:flex w-3/5 bg-gradient-to-tr from-gray-800 to-gray-900 i justify-around items-center hidden">
        <div>
            <h1 class="text-white font-bold text-4xl font-sans">Human Story</h1>
            <p class="text-white mt-1">Take a Break, Unlock Your Potential</p>
            <button id="joinButton" type="submit" class="block w-40 bg-white text-indigo-800 mt-4 py-2 rounded-2xl font-bold mb-2">Create Account</button>
        </div>
        <div class="absolute -bottom-32 -left-40 w-80 h-80 border-4 rounded-full border-opacity-30 border-t-8"></div>
        <div class="absolute -bottom-40 -left-20 w-80 h-80 border-4 rounded-full border-opacity-30 border-t-8"></div>
        <div class="absolute -top-40 -right-0 w-80 h-80 border-4 rounded-full border-opacity-30 border-t-8"></div>
        <div class="absolute -top-20 -right-20 w-80 h-80 border-4 rounded-full border-opacity-30 border-t-8"></div>
    </div>
    <div class="flex md:w-2/5 justify-center py-10 items-center bg-white">
        <form class="bg-white" action="/customlogin" method="POST">
            <h1 class="text-gray-800 font-bold text-2xl mb-1">안녕하세요 환영합니다!</h1>
            <p class="text-sm font-normal text-gray-600 mb-8 ml-1 underline">휴가 관리 시스템</p>
            <div class="flex items-center border-2 py-2 px-3 rounded-2xl mb-4 w-[330px]">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" viewBox="0 0 20 20"
                     fill="currentColor">
                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                          clip-rule="evenodd" />
                </svg>
                <input class="pl-2 outline-none border-none placeholder-gray-300" type="text" name="username" id="empNum" placeholder="사원번호" />

            </div>


            <div class="flex items-center border-2 py-2 px-3 rounded-2xl">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" viewBox="0 0 20 20"
                     fill="currentColor">
                    <path fill-rule="evenodd"
                          d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z"
                          clip-rule="evenodd" />
                </svg>
                <input class="pl-2 outline-none border-none placeholder-gray-300" type="password" name="password" id="pw" placeholder="비밀번호" />

            </div>
            <button type="submit" class="block w-full bg-gray-900 mt-4 py-2 rounded-2xl text-white font-semibold mb-2">Login</button>
            <span class="text-sm ml-2 hover:text-blue-500 cursor-pointer">Forgot Password ?</span>
        </form>
    </div>
</div>


</body>

<script>
    document.getElementById("joinButton").addEventListener("click", function() {
        window.location.href = "/login/joinForm";
    });
</script>
</html>


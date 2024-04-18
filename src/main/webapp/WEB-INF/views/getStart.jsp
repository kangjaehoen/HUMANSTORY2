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
            <button id="joinButton" type="submit" class="block w-40 bg-white text-indigo-800 mt-4 py-2 rounded-2xl font-bold mb-2">시작하기!</button>
        </div>
        <div class="absolute -bottom-32 -left-40 w-80 h-80 border-4 rounded-full border-opacity-30 border-t-8"></div>
        <div class="absolute -bottom-40 -left-20 w-80 h-80 border-4 rounded-full border-opacity-30 border-t-8"></div>
        <div class="absolute -top-40 -right-0 w-80 h-80 border-4 rounded-full border-opacity-30 border-t-8"></div>
        <div class="absolute -top-20 -right-20 w-80 h-80 border-4 rounded-full border-opacity-30 border-t-8"></div>
    </div>
    <div class="flex md:w-2/5 justify-center py-10 items-center bg-white">
        <img class="fixed w-auto" src="https://images.unsplash.com/photo-1483791424735-e9ad0209eea2?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=774&amp;q=80" alt="" data-first-child="">
    </div>
</div>


</body>

<script>
    document.getElementById("joinButton").addEventListener("click", function() {
        window.location.href = "/customlogin";
    });
</script>
</html>


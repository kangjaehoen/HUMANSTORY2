<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        button{
            margin-bottom: 5px;
        }

    </style>
</head>
<body>


    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <a class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
                <img class="w-8 h-8 mr-2" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/logo.svg" alt="logo">
                회원가입 페이지
            </a>

            <div class="w-5/6 bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                        HUMAN STORY 휴가 관리 시스템
                    </h1>
                    <form role="form" action="/join" method="post" class="space-y-4 md:space-y-6">
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >사원 번호</label>
                            <input name='empName' placeholder="jongwon"
                                   class="placeholder-opacity-50 bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >비밀 번호</label>
                            <input name='pw' placeholder="qwer2231"
                                   class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >직책</label>
                            <input name='job' placeholder="주임"
                                   class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >전화 번호</label>
                            <input name='phoneNum' placeholder="26467154"
                                   class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >고용일</label>
                            <input name='hireDate' placeholder="1997/03/05"
                                   class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >Email</label>
                            <input name='email' placeholder="p7374982@naver.com"
                                   class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >address</label>
                            <input name='address' placeholder="성남시"
                                   class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >workDate</label>
                            <input name='workDate' placeholder="190"
                                   class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >birthDate</label>
                            <input name='birthDate' placeholder="970305"
                                   class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >부서 번호</label>
                            <input name='deptNum' placeholder="1"
                                   class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="form-group">
                            <input type="hidden" class="form-control" name='Enabled' value="1">
                        </div>
                        <div class="form-group">
                            <input type="hidden" class="form-control" name='role'>
                        </div>
                        <button type="submit"
                                class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                        >회원가입</button>
                        <button type="reset"
                                class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                        >Reset Button</button>
                        <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                            Already have an account?
                            <a href="/customlogin"
                                class="font-medium text-primary-600 hover:underline dark:text-primary-500">
                                Login here
                            </a>
                        </p>
                    </form><%--finish form--%>
                <div>
            </div>
                <%--finish white rounded div--%>
        </div><%--end div--%>
    </section><%--finish section--%>

</body>
</html>
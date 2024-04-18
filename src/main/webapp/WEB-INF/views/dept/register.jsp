<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function closeTabClick() {
            // 변수를 close해 새창을 닫음
            myWindow.close();
        }

    </script>

</head>
<body>

<style>
    button{
        margin-top: 10px;
    }
</style>

<div class="min-h-screen bg-white flex flex-col justify-center sm:py-12">
    <div class="p-10 xs:p-0 mx-auto md:w-full md:max-w-md">
        <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
            <div class="bg-gray-100 shadow w-full rounded-lg divide-y divide-gray-200">
                <div class="sm:mx-auto sm:w-full sm:max-w-sm">

                    <h2 class="mt-10 text-center text-1xl font-bold leading-9 tracking-tight text-gray-900">부서 관리</h2>
                </div>
                <div class="px-5 py-7">
                    <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                        <form role="form" action="/dept/register" method="post">
                            <div class="form-group">
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >부서 번호</label>
                                <input name='deptNum' placeholder="ex) 1"
                                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                            </div>
                            <div class="form-group">
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >부서명</label>
                                <input name='deptName' placeholder="ex) 인사과"
                                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                            </div>

                            <button type="submit"
                                    class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                            >확인</button>

                            <button type="reset"
                                    class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                            >Reset Button</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
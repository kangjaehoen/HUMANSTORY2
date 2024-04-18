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
                        <form role="form"  action="/dept/modify" method="post">

                            <div class="form-group">
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >부서 번호</label>
                                <input name='deptNum' value='<c:out value="${dept.deptNum}"/>'
                                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                            </div>

                            <div class="form-group">
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-semibold" >부서명</label>
                                <input name='deptName'value='<c:out value="${dept.deptName}"/>'
                                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                            </div>

                            <button type="submit" data-oper='modify'
                                    class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                            >수정</button>
                            <button type="submit" data-oper='remove'
                                    class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                            >제거</button>
                            <button type="submit" data-oper='list'
                                    class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                            >되돌아가기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function() {


        var formObj = $("form");

        $('button').on("click", function(e){

            e.preventDefault();

            var operation = $(this).data("oper");

            console.log(operation);

            if(operation === 'remove'){
                formObj.attr("action", "/dept/remove");

            }else if(operation === 'list'){
                //move to list
                self.location="/dept/list";
                return;

            }

            formObj.submit();
        });

    });
</script>
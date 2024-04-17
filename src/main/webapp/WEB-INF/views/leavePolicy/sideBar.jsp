
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
           prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function(){
            (function(){
                var empNum = $("#empNumPf").val();
                console.log("직원 번호: " + empNum);

                $.getJSON("/getEmpProfile", {empNum: empNum}, function(arr){
                    console.log("==============");
                    console.log(arr);
                    var str = "";

                    $(arr).each(function(i, attach){
                        //image type
                        if(attach.fileType){
                            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);

                            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                            str += "<img src='/display?fileName=" + fileCallPath + "' style='border-radius: 50%;'>";
                            str += "</div>";
                            str +"</li>";
                        }else{

                            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                            str += "<span> "+ attach.fileName+"</span><br/>";
                            str += "<img src='/resources/img/attach.png'></a>";
                            str += "</div>";
                            str +"</li>";
                        }
                    });
                    $("#EmpProFile ul").html(str);


                });
            })();
            function showImage(fileCallPath){

                alert(fileCallPath);

                $(".bigPictureWrapper").css("display","flex").show();

                $(".bigPicture")
                    .html("<img src='/display?fileName="+fileCallPath+"' >")
                    .animate({width:'100%', height: '100%'}, 1000);

            }

            $("#profileMove").click(function(){
                window.location.href="/emp/proFile"
            });

        });
    </script>
    <style>
        #EmpProFile{


        }

    </style>



    <title>Document</title>
</head>
<body>


<nav class="fixed top-0 z-50 w-full bg-white b dark:bg-gray-800 dark:border-gray-700">
    <div class="px-2 lg:px-5 lg:pl-3">
        <div class="flex items-center justify-between">
            <div class="flex items-center justify-start rtl:justify-end">
                <button data-drawer-target="logo-sidebar" data-drawer-toggle="logo-sidebar" aria-controls="logo-sidebar" type="button" class="inline-flex items-center p-2 text-sm text-gray-100 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-whitetext-white">
                    <span class="sr-only">Open sidebar</span>
                    <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path clip-rule="evenodd" fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
                    </svg>
                </button>
                <a href="https://flowbite.com" class="flex ms-2 md:me-0">
                    <!-- <img src="https://flowbite.com/docs/images/logo.svg" class="h-5 me-3" alt="HS Logo" /> -->
                    <img src="/img/hs2.logo.png" class="h-16 me-2" alt="HS Logo" />
                    <!-- <span class="self-center text-xl font-semibold sm:text-1xl whitespace-nowrap dark:text-white">HUMAN STORY</span> -->
                </a>
            </div>

            <!-- 우측 상단 Info & Icon -->
            <div class="flex items-center">
                <div class="flex items-center ms-3">

                    <a href="#" class="flex items-center text-white hover:text-gray-900 rounded-lg dark:text-white group">
                        <svg class="w-7 h-7 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M17.133 12.632v-1.8a5.406 5.406 0 0 0-4.154-5.262.955.955 0 0 0 .021-.106V3.1a1 1 0 0 0-2 0v2.364a.955.955 0 0 0 .021.106 5.406 5.406 0 0 0-4.154 5.262v1.8C6.867 15.018 5 15.614 5 16.807 5 17.4 5 18 5.538 18h12.924C19 18 19 17.4 19 16.807c0-1.193-1.867-1.789-1.867-4.175ZM8.823 19a3.453 3.453 0 0 0 6.354 0H8.823Z"/>
                        </svg>
                    </a>
                    <a href="#" class="flex items-center text-white hover:text-gray-900 rounded-lg dark:text-white group mr-1">
                        <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                            <path fill-rule="evenodd" d="M2 12C2 6.477 6.477 2 12 2s10 4.477 10 10-4.477 10-10 10S2 17.523 2 12Zm9.008-3.018a1.502 1.502 0 0 1 2.522 1.159v.024a1.44 1.44 0 0 1-1.493 1.418 1 1 0 0 0-1.037.999V14a1 1 0 1 0 2 0v-.539a3.44 3.44 0 0 0 2.529-3.256 3.502 3.502 0 0 0-7-.255 1 1 0 0 0 2 .076c.014-.398.187-.774.48-1.044Zm.982 7.026a1 1 0 1 0 0 2H12a1 1 0 1 0 0-2h-.01Z" clip-rule="evenodd"/>
                        </svg>
                    </a>





                    <div>
                        <button type="button" class="flex p-1 text-sm bg-gray-800 rounded-full focus:ring-4 focus:ring-gray-300 dark:focus:ring-whitetext-white" aria-expanded="false" data-dropdown-toggle="dropdown-user">
                            <span class="sr-only">Open user menu</span>
                            <img class="w-8 h-8 rounded-full border-2" src="./resources/img/profile.png" alt="user photo">
                            <p class="text-1xl text-white dark:text-white p-1 mr-2" role="none">
                                <sec:authentication property='principal.emp.empName'/>
                            </p>

                        </button>
                    </div>
                    <div class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded shadow dark:bg-gray-700 dark:divide-whitetext-white" id="dropdown-user">
                        <div class="px-4 py-3" role="none">
                            <p class="text-sm text-black hover:text-gray-900 dark:text-white" role="none">
                                사원번호 : <sec:authentication property='principal.emp.empNum'/>
                            </p>
                            <p class="text-sm font-medium text-black hover:text-gray-900 truncate dark:text-gray-300" role="none">
                                사원명 : <sec:authentication property='principal.emp.empName'/>
                            </p>
                        </div>
                        <ul class="py-1" role="none">
                            <li>
                                <a href="#" class="block px-3 py-1 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-whitetext-white dark:hover:text-white" role="menuitem">Dashboard</a>
                            </li>
                            <li>
                                <a href="../includes/leavePolicy/list" class="block px-3 py-1 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-whitetext-white dark:hover:text-white" role="menuitem">Settings</a>
                            </li>
                            <li>
                                <a href="#" class="block px-3 py-1 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-whitetext-white dark:hover:text-white" role="menuitem">Document</a>
                            </li>
                            <li>
                                <a href="#" class="block px-3 py-1 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-whitetext-white dark:hover:text-white" role="menuitem">Sign out</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>

        </div>
    </div>
</nav>
<!-- 상단 메뉴 끝 -->


<!-- 좌측 메뉴 시작 -->
<aside id="logo-sidebar" class="fixed top-2 left-0 z-40 w-64 h-screen pt-10 transition-transform -translate-x-full bg-white border-r border-gray-200 sm:translate-x-0 dark:bg-gray-800 dark:border-gray-700" aria-label="Sidebar">
    <div class="h-full px-4 pb-4 overflow-y-auto bg-gray-800 w-67 mt-4">

        <div class="flex justify-center items-center mt-8">
            <!--   <img id="EmpProFile" class="w-24 h-24 rounded-full border-2" src="" alt=""> -->
            <div id="EmpProFile" class="w-24 h-24 rounded-full border-2">
                <ul>

                </ul>
            </div>

            <input type="hidden" id="empNumPf" value="<sec:authentication property='principal.emp.empNum'/>">
            <input type="hidden" name="empName" value="<sec:authentication property="principal.emp.empName" />">
        </div>


        <p class="text-xl text-white dark:text-white text-center font-bold mt-2" role="none"><sec:authentication property="principal.emp.empName" /></p>
        <p class="text-sm text-white dark:text-white text-center" role="none"><sec:authentication property="principal.emp.email" /></p>


        <!-- 프로필 하단 3개 아이콘 -->
        <div class="inline-flex rounded-md shadow-sm mt-3" role="group">
            <button id="profileMove" type="button" class="inline-flex flex-col items-center px-5 py-1 font-medium text-gray-400 bg-transparent border border-gray-700 rounded-s-lg hover:bg-gray-900 hover:text-white focus:z-10 focus:ring-2 focus:ring-gray-500 focus:bg-gray-900 focus:text-white dark:border-white dark:text-white dark:hover:text-white dark:hover:bg-gray-700 dark:focus:bg-gray-700">
                <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M10 0a10 10 0 1 0 10 10A10.011 10.011 0 0 0 10 0Zm0 5a3 3 0 1 1 0 6 3 3 0 0 1 0-6Zm0 13a8.949 8.949 0 0 1-4.951-1.488A3.987 3.987 0 0 1 9 13h2a3.987 3.987 0 0 1 3.951 3.512A8.949 8.949 0 0 1 10 18Z"/>
                </svg>
                <span class="text-xs font-black mt-1">Profile</span>
            </button>

            <button type="button" class="inline-flex flex-col items-center px-6 py-1  font-medium text-gray-400 bg-transparent border-t border-b border-gray-700 hover:bg-gray-900 hover:text-white focus:z-10 focus:ring-2 focus:ring-gray-500 focus:bg-gray-900 focus:text-white dark:border-white dark:text-white dark:hover:text-white dark:hover:bg-gray-700 dark:focus:bg-gray-700">
                <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 12.25V1m0 11.25a2.25 2.25 0 0 0 0 4.5m0-4.5a2.25 2.25 0 0 1 0 4.5M4 19v-2.25m6-13.5V1m0 2.25a2.25 2.25 0 0 0 0 4.5m0-4.5a2.25 2.25 0 0 1 0 4.5M10 19V7.75m6 4.5V1m0 11.25a2.25 2.25 0 1 0 0 4.5 2.25 2.25 0 0 0 0-4.5ZM16 19v-2"/>
                </svg>
                <span class="text-xs font-black mt-1">List</span>
            </button>
            <button type="button" class="inline-flex flex-col items-center px-2 py-1  font-medium text-gray-400 bg-transparent border border-gray-700 rounded-e-lg hover:bg-gray-900 hover:text-white focus:z-10 focus:ring-2 focus:ring-gray-500 focus:bg-gray-900 focus:text-white dark:border-white dark:text-white dark:hover:text-white dark:hover:bg-gray-700 dark:focus:bg-gray-700">
                <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M14.707 7.793a1 1 0 0 0-1.414 0L11 10.086V1.5a1 1 0 0 0-2 0v8.586L6.707 7.793a1 1 0 1 0-1.414 1.414l4 4a1 1 0 0 0 1.416 0l4-4a1 1 0 0 0-.002-1.414Z"/>
                    <path d="M18 12h-2.55l-2.975 2.975a3.5 3.5 0 0 1-4.95 0L4.55 12H2a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2Zm-3 5a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z"/>
                </svg>
                <span class="text-xs font-black mt-1">Downloads</span>
            </button>
        </div>





        <ul class="space-y-4 font-midium">
            <li>
                <a href="#" class="flex items-center p-1 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group mt-5">
                    <svg class="w-6 h-6 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 21 21" style="margin-left: -1px;">
                        <path fill-rule="evenodd" d="M11.293 3.293a1 1 0 0 1 1.414 0l6 6 2 2a1 1 0 0 1-1.414 1.414L19 12.414V19a2 2 0 0 1-2 2h-3a1 1 0 0 1-1-1v-3h-2v3a1 1 0 0 1-1 1H7a2 2 0 0 1-2-2v-6.586l-.293.293a1 1 0 0 1-1.414-1.414l2-2 6-6Z" clip-rule="evenodd"/>
                    </svg>
                    <span class="ms-3 mt-1.5">Home</span>
                </a>
            </li>

            <li>
                <a href="#" class="flex items-center p-1 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="w-7 h-7 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M17.133 12.632v-1.8a5.406 5.406 0 0 0-4.154-5.262.955.955 0 0 0 .021-.106V3.1a1 1 0 0 0-2 0v2.364a.955.955 0 0 0 .021.106 5.406 5.406 0 0 0-4.154 5.262v1.8C6.867 15.018 5 15.614 5 16.807 5 17.4 5 18 5.538 18h12.924C19 18 19 17.4 19 16.807c0-1.193-1.867-1.789-1.867-4.175ZM6 6a1 1 0 0 1-.707-.293l-1-1a1 1 0 0 1 1.414-1.414l1 1A1 1 0 0 1 6 6Zm-2 4H3a1 1 0 0 1 0-2h1a1 1 0 1 1 0 2Zm14-4a1 1 0 0 1-.707-1.707l1-1a1 1 0 1 1 1.414 1.414l-1 1A1 1 0 0 1 18 6Zm3 4h-1a1 1 0 1 1 0-2h1a1 1 0 1 1 0 2ZM8.823 19a3.453 3.453 0 0 0 6.354 0H8.823Z"/>
                    </svg>

                    <span class="flex-1 ms-2 whitespace-nowrap">Alert</span>
                    <!-- <span class="inline-flex items-center justify-center w-3 h-3 p-3 ms-3 text-sm font-medium text-blue-800 bg-blue-100 rounded-full dark:bg-blue-900 dark:text-blue-300">3</span> -->
                </a>
            </li>

            <li>
                <a href="#" class="flex items-center p-1.5 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="w-6 h-6 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                        <path fill-rule="evenodd" d="M18 5.05h1a2 2 0 0 1 2 2v2H3v-2a2 2 0 0 1 2-2h1v-1a1 1 0 1 1 2 0v1h3v-1a1 1 0 1 1 2 0v1h3v-1a1 1 0 1 1 2 0v1Zm-15 6v8a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-8H3ZM11 18a1 1 0 1 0 2 0v-1h1a1 1 0 1 0 0-2h-1v-1a1 1 0 1 0-2 0v1h-1a1 1 0 1 0 0 2h1v1Z" clip-rule="evenodd"/>
                    </svg>

                    <span class="flex-1 ms-2.5 whitespace-nowrap">ADD Leaves</span>
                    <span class="inline-flex items-center justify-center px-2 ms-3 text-xs font-bold text-gray-800 bg-gray-100 rounded-full dark:bg-gray-700 dark:text-gray-300">ADD</span>
                </a>
            </li>
            <!-- Dashboard -->
            <!-- <div x-data="{ open: false }">
             <li>
                 <a href="#" class="flex items-center p-2 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                     <button @click="open = !open" class="flex justify-between items-center pr-5 text-gra cursor-pointer hover:bg-gray-100 hover:text-gray-700 focus:outline-none">
                     <svg class="w-5 h-5 text-white transition duration-75 dark:text-white group-hover:text-gray-900 hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 22">
                       <path d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z"/>
                       <path d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z"/>
                    </svg>
                    <span class="hover:text-gray-900 ml-3 mr-8">Dashboard</span>
                 </button>
                 <span>
                     <svg class="h-4 w-4 ml-3" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path x-show="! open" d="M9 5L16 12L9 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display: none;"></path>
                      <path x-show="open" d="M19 9L12 16L5 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                      </svg>
                      </span>
                 </a>
                 <div x-show="open" class="bg-gray-800 rounded-lg">
                     <a class="py-2 px-16 block text-sm text-white hover:bg-blue-500 hover:text-gray-900 hover:bg-white rounded-lg text-center" href="#">Calendar</a>
                     <a class="py-2 px-16 block text-sm text-white hover:bg-blue-500 hover:text-gray-900 hover:bg-white rounded-lg text-center" href="#">PTO List</a>
                 </div>
              </li>
             </div> -->
            <!-- --------------------- -->
            <div x-data="{ open: false }">
                <li>
                    <a href="#" class="flex items-center p-2 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                        <button @click="open = !open" class="flex justify-between items-center pl- text-gra cursor-pointer hover:bg-gray-100 hover:text-gray-700 focus:outline-none">
                            <svg class="w-5 h-5 text-white transition duration-75 dark:text-white group-hover:text-gray-900 hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 22">
                                <path d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z"/>
                                <path d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z"/>
                            </svg>
                            <span class="hover:text-gray-900 ml-3 mr-8">Dashboard</span>
                            <span>
                     <svg class="h-4 w-4 ml-6" viewBox="0 0 14 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path x-show="! open" d="M9 5L16 12L9 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display: none;"></path>
                      <path x-show="open" d="M19 9L12 16L5 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                      </svg>
                      </span>
                        </button>

                    </a>
                    <div x-show="open" class="bg-gray-800 rounded-lg">
                        <a class="py-2 px-16 block text-sm text-white hover:bg-blue-500 hover:text-gray-900 hover:bg-white rounded-lg text-center" href="/leaveSystem/src/main/webapp/WEB-INF/views/calendar">Calendar</a>
                        <a class="py-2 px-16 block text-sm text-white hover:bg-blue-500 hover:text-gray-900 hover:bg-white rounded-lg text-center" href="#">PTO List</a>
                    </div>
                </li>
            </div>
            <!-- Dashboard -->

            <li>
                <a href="#" class="flex items-center p-1 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="w-7 h-7 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                    <path fill-rule="evenodd" d="M20 10H4v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8ZM9 13v-1h6v1a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1Z" clip-rule="evenodd"/>
                    <path d="M2 6a2 2 0 0 1 2-2h16a2 2 0 1 1 0 4H4a2 2 0 0 1-2-2Z"/>
                    </svg>

                    <span class="flex-1 ms-2 whitespace-nowrap">Document</span>
                </a>
            </li>

            <!-- User Settings -->
            <div x-data="{ open: false }">
                <li>
                    <a href="#" class="flex items-center p-1 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                        <button @click="open = !open" class="flex justify-between items-center pl- text-gra cursor-pointer hover:bg-gray-100 hover:text-gray-700 focus:outline-none">
                            <svg class="w-8 h-8 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                                <path fill-rule="evenodd" d="M17 10v1.126c.367.095.714.24 1.032.428l.796-.797 1.415 1.415-.797.796c.188.318.333.665.428 1.032H21v2h-1.126c-.095.367-.24.714-.428 1.032l.797.796-1.415 1.415-.796-.797a3.979 3.979 0 0 1-1.032.428V20h-2v-1.126a3.977 3.977 0 0 1-1.032-.428l-.796.797-1.415-1.415.797-.796A3.975 3.975 0 0 1 12.126 16H11v-2h1.126c.095-.367.24-.714.428-1.032l-.797-.796 1.415-1.415.796.797A3.977 3.977 0 0 1 15 11.126V10h2Zm.406 3.578.016.016c.354.358.574.85.578 1.392v.028a2 2 0 0 1-3.409 1.406l-.01-.012a2 2 0 0 1 2.826-2.83ZM5 8a4 4 0 1 1 7.938.703 7.029 7.029 0 0 0-3.235 3.235A4 4 0 0 1 5 8Zm4.29 5H7a4 4 0 0 0-4 4v1a2 2 0 0 0 2 2h6.101A6.979 6.979 0 0 1 9 15c0-.695.101-1.366.29-2Z" clip-rule="evenodd"/>
                            </svg>
                            <span class="hover:text-gray-900 ml-1 mr-8">Users Settings</span>
                            <span>
                     <svg class="h-4 w-4 ml-4" viewBox="0 0 14 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path x-show="! open" d="M9 5L16 12L9 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display: none;"></path>
                      <path x-show="open" d="M19 9L12 16L5 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                      </svg>
                      </span>
                        </button>

                    </a>
                    <div x-show="open" class="bg-gray-800 rounded-lg">
                        <a class="py-2 px-16 block text-sm text-white hover:bg-blue-500 hover:text-gray-900 hover:bg-white rounded-lg text-center" href="/leaveSystem/src/main/webapp/WEB-INF/views/calendar.jsp">Employees</a>
                        <a class="py-2 px-16 block text-sm text-white hover:bg-blue-500 hover:text-gray-900 hover:bg-white rounded-lg text-center" href="#">Department</a>
                    </div>
                </li>
            </div>

            <!-- ------------ -->
            <!-- <li>
               <a href="#" class="flex items-center p-1 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                <svg class="w-8 h-8 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                   <path fill-rule="evenodd" d="M17 10v1.126c.367.095.714.24 1.032.428l.796-.797 1.415 1.415-.797.796c.188.318.333.665.428 1.032H21v2h-1.126c-.095.367-.24.714-.428 1.032l.797.796-1.415 1.415-.796-.797a3.979 3.979 0 0 1-1.032.428V20h-2v-1.126a3.977 3.977 0 0 1-1.032-.428l-.796.797-1.415-1.415.797-.796A3.975 3.975 0 0 1 12.126 16H11v-2h1.126c.095-.367.24-.714.428-1.032l-.797-.796 1.415-1.415.796.797A3.977 3.977 0 0 1 15 11.126V10h2Zm.406 3.578.016.016c.354.358.574.85.578 1.392v.028a2 2 0 0 1-3.409 1.406l-.01-.012a2 2 0 0 1 2.826-2.83ZM5 8a4 4 0 1 1 7.938.703 7.029 7.029 0 0 0-3.235 3.235A4 4 0 0 1 5 8Zm4.29 5H7a4 4 0 0 0-4 4v1a2 2 0 0 0 2 2h6.101A6.979 6.979 0 0 1 9 15c0-.695.101-1.366.29-2Z" clip-rule="evenodd"/>
                 </svg>

                  <span class="flex-1 ms-1 whitespace-nowrap">Users Settings</span>
               </a>
            </li> -->


            <!-- Logout -->
            <li>
                <a href="leavePolicy/list" class="flex items-center p-2 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="w-6 h-6 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                        <path fill-rule="evenodd" d="M9.586 2.586A2 2 0 0 1 11 2h2a2 2 0 0 1 2 2v.089l.473.196.063-.063a2.002 2.002 0 0 1 2.828 0l1.414 1.414a2 2 0 0 1 0 2.827l-.063.064.196.473H20a2 2 0 0 1 2 2v2a2 2 0 0 1-2 2h-.089l-.196.473.063.063a2.002 2.002 0 0 1 0 2.828l-1.414 1.414a2 2 0 0 1-2.828 0l-.063-.063-.473.196V20a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-.089l-.473-.196-.063.063a2.002 2.002 0 0 1-2.828 0l-1.414-1.414a2 2 0 0 1 0-2.827l.063-.064L4.089 15H4a2 2 0 0 1-2-2v-2a2 2 0 0 1 2-2h.09l.195-.473-.063-.063a2 2 0 0 1 0-2.828l1.414-1.414a2 2 0 0 1 2.827 0l.064.063L9 4.089V4a2 2 0 0 1 .586-1.414ZM8 12a4 4 0 1 1 8 0 4 4 0 0 1-8 0Z" clip-rule="evenodd"/>
                    </svg>

                    <span class="flex-1 ms-2 whitespace-nowrap">Settings</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center p-2 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="flex-shrink-0 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H8m12 0-4 4m4-4-4-4M9 4H7a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h2"/>
                    </svg>
                    <span class="flex-1 ms-2 whitespace-nowrap">Logout</span>
                </a>
            </li>




            <!-- 추가 버튼 -->
            <!-- <li>
             <a href="#" class="flex items-center p-2 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
              <svg class="flex-shrink-0 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                 <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H8m12 0-4 4m4-4-4-4M9 4H7a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h2"/>
               </svg>
                <span class="flex-1 ms-2 whitespace-nowrap">Logout</span>
             </a>
          </li> -->



    </ul>
    </div>
</aside>

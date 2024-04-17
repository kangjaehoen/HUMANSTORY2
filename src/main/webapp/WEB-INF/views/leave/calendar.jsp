<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="">
	<meta name="author" content="">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/datepicker.min.js"></script>
	<!-- Alpine.js -->
	<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js" defer></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>



	<title>Document</title>
</head>
<body x-data="app()">


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
							<path d="M17.133 12.632v-1.8a5.406 5.406 0 0 0-4.154-5.262.955.955 0 0 0 .021-.106V3.1a1 1 0 0 0-2 0v2.364a.955.955 0 0 0 .021.106 5.406 5.406 0 0 0-4.154 5.262v1.8C6.867 15.018 5 15.614 5 16.807 5 17.4 5 18 5.538 18h12.924C19 18 19 17.4 19 16.807c0-1.193-1.867-1.789-1.867-4.175ZM8.823 19a3.453 3.453 0 0 0 6.354 0H8.823Z"></path>
						</svg>
					</a>
					<a href="#" class="flex items-center text-white hover:text-gray-900 rounded-lg dark:text-white group mr-1">
						<svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
							<path fill-rule="evenodd" d="M2 12C2 6.477 6.477 2 12 2s10 4.477 10 10-4.477 10-10 10S2 17.523 2 12Zm9.008-3.018a1.502 1.502 0 0 1 2.522 1.159v.024a1.44 1.44 0 0 1-1.493 1.418 1 1 0 0 0-1.037.999V14a1 1 0 1 0 2 0v-.539a3.44 3.44 0 0 0 2.529-3.256 3.502 3.502 0 0 0-7-.255 1 1 0 0 0 2 .076c.014-.398.187-.774.48-1.044Zm.982 7.026a1 1 0 1 0 0 2H12a1 1 0 1 0 0-2h-.01Z" clip-rule="evenodd"></path>
						</svg>
					</a>

					<div>
						<button type="button" class="flex p-1 text-sm bg-gray-800 rounded-full focus:ring-4 focus:ring-gray-300 dark:focus:ring-whitetext-white" aria-expanded="false" data-dropdown-toggle="dropdown-user">
							<span class="sr-only">Open user menu</span>
							<img class="w-8 h-8 rounded-full border-2" src="/img/profile.jpg" alt="user photo">
							<p class="text-1xl text-white dark:text-white p-1 mr-2" role="none">
								<sec:authentication property="principal.emp.empName"/>
							</p>

						</button>
					</div>
					<div class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded shadow dark:bg-gray-700 dark:divide-whitetext-white" id="dropdown-user">
						<div class="px-4 py-3" role="none">
							<p class="text-sm text-black hover:text-gray-900 dark:text-white" role="none">
								사원번호: <sec:authentication property="principal.emp.empNum"/> 번
							</p>
							<p class="text-sm font-medium text-black hover:text-gray-900 truncate dark:text-gray-300" role="none">
								부서 번호 : <sec:authentication property="principal.emp.deptNum"/> 팀
							</p>
						</div>
						<ul class="py-1" role="none">
							<li>
								<a href="#" class="block px-3 py-1 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-whitetext-white dark:hover:text-white" role="menuitem">Dashboard</a>
							</li>
							<li>
								<a href="#" class="block px-3 py-1 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-whitetext-white dark:hover:text-white" role="menuitem">Settings</a>
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
			<img class="w-24 h-24 rounded-full border-2" src="/img/profile.jpg" alt="user photo">
		</div>

		<p class="text-xl text-white dark:text-white text-center font-bold mt-2" role="none"><sec:authentication property="principal.emp.empName"/></p>
		<p class="text-sm text-white dark:text-white text-center" role="none"><sec:authentication property="principal.emp.email"/></p>

		<!-- 프로필 하단 3개 아이콘 -->
		<div class="inline-flex rounded-md shadow-sm mt-3" role="group">
			<button type="button" class="inline-flex flex-col items-center px-5 py-1 font-medium text-gray-400 bg-transparent border border-gray-700 rounded-s-lg hover:bg-gray-900 hover:text-white focus:z-10 focus:ring-2 focus:ring-gray-500 focus:bg-gray-900 focus:text-white dark:border-white dark:text-white dark:hover:text-white dark:hover:bg-gray-700 dark:focus:bg-gray-700">
				<svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
					<path d="M10 0a10 10 0 1 0 10 10A10.011 10.011 0 0 0 10 0Zm0 5a3 3 0 1 1 0 6 3 3 0 0 1 0-6Zm0 13a8.949 8.949 0 0 1-4.951-1.488A3.987 3.987 0 0 1 9 13h2a3.987 3.987 0 0 1 3.951 3.512A8.949 8.949 0 0 1 10 18Z"></path>
				</svg>
				<span class="text-xs font-black mt-1">Profile</span>
			</button>

			<button type="button" class="inline-flex flex-col items-center px-6 py-1  font-medium text-gray-400 bg-transparent border-t border-b border-gray-700 hover:bg-gray-900 hover:text-white focus:z-10 focus:ring-2 focus:ring-gray-500 focus:bg-gray-900 focus:text-white dark:border-white dark:text-white dark:hover:text-white dark:hover:bg-gray-700 dark:focus:bg-gray-700">
				<svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
					<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 12.25V1m0 11.25a2.25 2.25 0 0 0 0 4.5m0-4.5a2.25 2.25 0 0 1 0 4.5M4 19v-2.25m6-13.5V1m0 2.25a2.25 2.25 0 0 0 0 4.5m0-4.5a2.25 2.25 0 0 1 0 4.5M10 19V7.75m6 4.5V1m0 11.25a2.25 2.25 0 1 0 0 4.5 2.25 2.25 0 0 0 0-4.5ZM16 19v-2"></path>
				</svg>
				<span class="text-xs font-black mt-1">List</span>
			</button>
			<button type="button" class="inline-flex flex-col items-center px-2 py-1  font-medium text-gray-400 bg-transparent border border-gray-700 rounded-e-lg hover:bg-gray-900 hover:text-white focus:z-10 focus:ring-2 focus:ring-gray-500 focus:bg-gray-900 focus:text-white dark:border-white dark:text-white dark:hover:text-white dark:hover:bg-gray-700 dark:focus:bg-gray-700">
				<svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
					<path d="M14.707 7.793a1 1 0 0 0-1.414 0L11 10.086V1.5a1 1 0 0 0-2 0v8.586L6.707 7.793a1 1 0 1 0-1.414 1.414l4 4a1 1 0 0 0 1.416 0l4-4a1 1 0 0 0-.002-1.414Z"></path>
					<path d="M18 12h-2.55l-2.975 2.975a3.5 3.5 0 0 1-4.95 0L4.55 12H2a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2Zm-3 5a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z"></path>
				</svg>
				<span class="text-xs font-black mt-1">Downloads</span>
			</button>
		</div>

		<ul class="space-y-4 font-midium">
			<li>
				<a href="#" class="flex items-center p-1 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group mt-5">
					<svg class="w-6 h-6 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 21 21" style="margin-left: -1px;">
						<path fill-rule="evenodd" d="M11.293 3.293a1 1 0 0 1 1.414 0l6 6 2 2a1 1 0 0 1-1.414 1.414L19 12.414V19a2 2 0 0 1-2 2h-3a1 1 0 0 1-1-1v-3h-2v3a1 1 0 0 1-1 1H7a2 2 0 0 1-2-2v-6.586l-.293.293a1 1 0 0 1-1.414-1.414l2-2 6-6Z" clip-rule="evenodd"></path>
					</svg>
					<span class="ms-3 mt-1.5">Home</span>
				</a>
			</li>

			<li>
				<a href="#" class="flex items-center p-1 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
					<svg class="w-7 h-7 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
						<path d="M17.133 12.632v-1.8a5.406 5.406 0 0 0-4.154-5.262.955.955 0 0 0 .021-.106V3.1a1 1 0 0 0-2 0v2.364a.955.955 0 0 0 .021.106 5.406 5.406 0 0 0-4.154 5.262v1.8C6.867 15.018 5 15.614 5 16.807 5 17.4 5 18 5.538 18h12.924C19 18 19 17.4 19 16.807c0-1.193-1.867-1.789-1.867-4.175ZM6 6a1 1 0 0 1-.707-.293l-1-1a1 1 0 0 1 1.414-1.414l1 1A1 1 0 0 1 6 6Zm-2 4H3a1 1 0 0 1 0-2h1a1 1 0 1 1 0 2Zm14-4a1 1 0 0 1-.707-1.707l1-1a1 1 0 1 1 1.414 1.414l-1 1A1 1 0 0 1 18 6Zm3 4h-1a1 1 0 1 1 0-2h1a1 1 0 1 1 0 2ZM8.823 19a3.453 3.453 0 0 0 6.354 0H8.823Z"></path>
					</svg>

					<span class="flex-1 ms-2 whitespace-nowrap">Alert</span>
					<!-- <span class="inline-flex items-center justify-center w-3 h-3 p-3 ms-3 text-sm font-medium text-blue-800 bg-blue-100 rounded-full dark:bg-blue-900 dark:text-blue-300">3</span> -->
				</a>
			</li>

			<li>
				<a href="#" class="flex items-center p-1.5 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
					<svg class="w-6 h-6 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
						<path fill-rule="evenodd" d="M18 5.05h1a2 2 0 0 1 2 2v2H3v-2a2 2 0 0 1 2-2h1v-1a1 1 0 1 1 2 0v1h3v-1a1 1 0 1 1 2 0v1h3v-1a1 1 0 1 1 2 0v1Zm-15 6v8a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-8H3ZM11 18a1 1 0 1 0 2 0v-1h1a1 1 0 1 0 0-2h-1v-1a1 1 0 1 0-2 0v1h-1a1 1 0 1 0 0 2h1v1Z" clip-rule="evenodd"></path>
					</svg>

					<span class="flex-1 ms-2.5 whitespace-nowrap">ADD Leaves</span>
					<span class="inline-flex items-center justify-center px-2 ms-3 text-xs font-bold text-gray-800 bg-gray-100 rounded-full dark:bg-gray-700 dark:text-gray-300">ADD</span>
				</a>
			</li>
			<div x-data="{ open: false }">
				<li>
					<a href="#" class="flex items-center p-2 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
						<button @click="open = !open" class="flex justify-between items-center pl- text-gra cursor-pointer hover:bg-gray-100 hover:text-gray-700 focus:outline-none">
							<svg class="w-5 h-5 text-white transition duration-75 dark:text-white group-hover:text-gray-900 hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 22">
								<path d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z"></path>
								<path d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z"></path>
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
						<a class="py-2 px-16 block text-sm text-white hover:bg-blue-500 hover:text-gray-900 hover:bg-white rounded-lg text-center" href="#">Calendar</a>
						<a class="py-2 px-16 block text-sm text-white hover:bg-blue-500 hover:text-gray-900 hover:bg-white rounded-lg text-center" href="#">PTO List</a>
					</div>
				</li>
			</div>
			<!-- Dashboard -->

			<li>
				<a href="#" class="flex items-center p-1 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
					<svg class="w-7 h-7 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-gray-100" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
						<path fill-rule="evenodd" d="M20 10H4v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8ZM9 13v-1h6v1a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1Z" clip-rule="evenodd"></path>
						<path d="M2 6a2 2 0 0 1 2-2h16a2 2 0 1 1 0 4H4a2 2 0 0 1-2-2Z"></path>
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
								<path fill-rule="evenodd" d="M17 10v1.126c.367.095.714.24 1.032.428l.796-.797 1.415 1.415-.797.796c.188.318.333.665.428 1.032H21v2h-1.126c-.095.367-.24.714-.428 1.032l.797.796-1.415 1.415-.796-.797a3.979 3.979 0 0 1-1.032.428V20h-2v-1.126a3.977 3.977 0 0 1-1.032-.428l-.796.797-1.415-1.415.797-.796A3.975 3.975 0 0 1 12.126 16H11v-2h1.126c.095-.367.24-.714.428-1.032l-.797-.796 1.415-1.415.796.797A3.977 3.977 0 0 1 15 11.126V10h2Zm.406 3.578.016.016c.354.358.574.85.578 1.392v.028a2 2 0 0 1-3.409 1.406l-.01-.012a2 2 0 0 1 2.826-2.83ZM5 8a4 4 0 1 1 7.938.703 7.029 7.029 0 0 0-3.235 3.235A4 4 0 0 1 5 8Zm4.29 5H7a4 4 0 0 0-4 4v1a2 2 0 0 0 2 2h6.101A6.979 6.979 0 0 1 9 15c0-.695.101-1.366.29-2Z" clip-rule="evenodd"></path>
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
						<a class="py-2 px-16 block text-sm text-white hover:bg-blue-500 hover:text-gray-900 hover:bg-white rounded-lg text-center" href="#">Employees</a>
						<a class="py-2 px-16 block text-sm text-white hover:bg-blue-500 hover:text-gray-900 hover:bg-white rounded-lg text-center" href="#">Department</a>
					</div>
				</li>
			</div>

			<li>
				<a href="#" class="flex items-center p-2 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
					<svg class="w-6 h-6 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
						<path fill-rule="evenodd" d="M9.586 2.586A2 2 0 0 1 11 2h2a2 2 0 0 1 2 2v.089l.473.196.063-.063a2.002 2.002 0 0 1 2.828 0l1.414 1.414a2 2 0 0 1 0 2.827l-.063.064.196.473H20a2 2 0 0 1 2 2v2a2 2 0 0 1-2 2h-.089l-.196.473.063.063a2.002 2.002 0 0 1 0 2.828l-1.414 1.414a2 2 0 0 1-2.828 0l-.063-.063-.473.196V20a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-.089l-.473-.196-.063.063a2.002 2.002 0 0 1-2.828 0l-1.414-1.414a2 2 0 0 1 0-2.827l.063-.064L4.089 15H4a2 2 0 0 1-2-2v-2a2 2 0 0 1 2-2h.09l.195-.473-.063-.063a2 2 0 0 1 0-2.828l1.414-1.414a2 2 0 0 1 2.827 0l.064.063L9 4.089V4a2 2 0 0 1 .586-1.414ZM8 12a4 4 0 1 1 8 0 4 4 0 0 1-8 0Z" clip-rule="evenodd"></path>
					</svg>

					<span class="flex-1 ms-2 whitespace-nowrap">Settings</span>
				</a>
			</li>
			<li>
				<a href="#" class="flex items-center p-2 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
					<svg class="flex-shrink-0 text-gray-100 transition duration-75 dark:text-gray-400 group-hover:text-white hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
						<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H8m12 0-4 4m4-4-4-4M9 4H7a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h2"></path>
					</svg>
					<span class="flex-1 ms-2 whitespace-nowrap">Logout</span>
				</a>
			</li>
		</ul>
	</div>
</aside>


<%-------------------상단은 대쉬보드----------------------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------상단은 대쉬보드----------------------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------상단은 대쉬보드----------------------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------상단은 대쉬보드----------------------------------------------------------------------------------------------------------------------------------------------%>


<script>

	 $(document).ready(function() {
	        // 휴가 시작일과 종료일이 변경될 때마다 총 휴가일수를 계산합니다.
	        /*$('#startDate, #endDate,#leaveType').change(function() {
	            calculateLeaveDays();
	        });
	        function calculateLeaveDays() {
	        	console.log("시작");
	        	var startDateValue = $('#startDate').val(); // input 요소의 값을 가져옴
	        	var startDate = new Date(startDateValue); // 값에서 Date 객체 생성
	        	var endDateValue = $('#endDate').val(); // input 요소의 값을 가져옴
	        	var endDate = new Date(endDateValue); // 값에서 Date 객체 생성

	            var leaveType = $('#leaveType').val(); // 휴가 유형
	            var leaveDays = 0; // 총 휴가일수

	            if (startDate && endDate) {
	                // 종료일에서 시작일을 뺀 후 하루를 더해서 기간을 구합니다.
	                var timeDiff = endDate.getTime() - startDate.getTime();
	                var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) + 1;
	                // 시작일과 종료일이 같은 경우
	                if (startDate.getTime() === endDate.getTime()) {
	                    // 휴가 유형에 따라 총 휴가일수를 결정합니다.
	                    if (leaveType === '연차' || leaveType === '병가' || leaveType === '가족돌봄휴가' || leaveType === '출산휴가') {
	                        leaveDays = 1;
	                    } else if (leaveType === '반차') {
	                        leaveDays = 0.5;
	                    } else if (leaveType === '반반차') {
	                        leaveDays = 0.25;
	                    }
	                } else { // 시작일과 종료일이 다른 경우
	                    // 반차나 반반차를 선택했을 때 경고 메시지를 표시하고 다른 값을 선택하도록 합니다.
	                    if (leaveType === '반차' || leaveType === '반반차') {
	                        alert('시작일과 종료일이 다를 때 반차나 반반차는 선택할 수 없습니다.\n다른 값을 선택해주세요.');
	                        $('#leaveType').val('연차'); // 휴가 유형을 연차로 변경합니다.
	                        return; // 함수 종료
	                    } else {
	                        // 그 외의 경우에는 실제 기간에 맞춰 총 휴가일수를 계산합니다.
	                        leaveDays = diffDays;
	                    }
	                }
	            }

	            // 총 휴가일수를 출력합니다.
	            $('#leaveDays').val(leaveDays);
	        }*/

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

	<div class="antialiased sans-serif bg-gray-100 h-screen">
		<div x-data="app()" x-init="[initDate(), getNoOfDays()]" x-cloak>
			<div class="container mx-auto px-4 py-2 md:py-24">
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
							 src="/img/profile.jpg" alt="user photo">
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


<%@include file="../ShareView/sideBar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 1000px;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 10px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 80px;
    }

    .heading {
        font-size: 24px;
        font-weight: bold;
        color: #333;
        margin-bottom: 20px;
    }

    .info-box {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .item {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f8f9fa;
    }

    .title {
        font-weight: bold;
        margin-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
    }

    .title2 {
        font-weight: bold;
        margin-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
        font-size: 20px;
    }

    .content {
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 20px;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f8f9fa;
    }

    .panel {
        margin-top: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f8f9fa;
    }

    .panel .panel-heading {
        font-weight: bold;
        background-color: #e9ecef;
        padding: 10px;
    }

    .panel .panel-body {
        padding: 10px;
    }

    .uploadResult ul {
        list-style: none;
        padding: 0;
        display: flex;
        flex-wrap: wrap;
    }

    .uploadResult ul li {
        margin-bottom: 10px;
    }

    .uploadResult ul li img {
        max-width: 100px;
        max-height: 100px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .buttons {
        margin-top: 20px;
        text-align: center; /* 버튼을 가운데 정렬 */
        display: flex; /* 내부 요소를 가로로 배치 */
        justify-content: center; /* 내부 요소를 가운데 정렬 */
    }

    .buttons .button {
        margin-right: 10px; /* 버튼 사이의 간격 조정 */
    }

    .buttons a {
        padding: 15px 40px;
        border: none;
        border-radius: 5px;
        background-color: rgb(31, 41, 55);
        color: #fff;
        text-decoration: none;
        cursor: pointer;
        margin-right: 20px; /* 수정 버튼과 삭제 버튼 사이의 간격 조정 */
    }

    .buttons input[type="submit"]:hover {
        background-color: #0056b3;
    }

    #titleInsert {
        font-size: 18px;
    }

    #lpbno {
        margin-left: 10px;
    }

    .modal {
        display: none; /* 초기에는 모달을 숨깁니다. */
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4); /* 배경에 투명도를 줍니다. */
    }

    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 460px;
        height: 350px;
        border-radius: 10px;
        text-align: center;
    }

    .modal-content img {
        display: block;
        margin: 0 auto;
        margin-top: 30px; /* 이미지 위쪽 여백 추가 */
        max-width: 100px;
        height: auto;
    }

    .modal-content p {
        font-size: 24px;
        font-weight: bold;
        margin-top: 30px;
    }

    .modal-content button {
        margin-top: 20px;
        padding-left : 50px;
        padding-right : 50px;
        padding-top: 20px;
        padding-bottom: 20px;
        color: white;
        font-weight: bold;
        font-size: 20px;
    }

    #confirmDeleteBtn{
        background-color: #e7e7e7;
        color:black;
    }

    #cancleDeleteBtn{
        background-color: #ababab;


    }

    .modal-content .close {
        display: none;
    }


    #nav1{
         margin-top: 40px;
    }

    #policyNav{
        color: #676767;
    }

    #policyNav:hover{
        color: #2900c5;
    }

</style>

<nav id= "nav1" class="bg-gray-800 mt-[58.5px]">
    <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
        <div class="relative flex h-16 items-center justify-between">
            <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                <!-- Mobile menu button-->
                <button type="button" class="relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
                    <span class="absolute -inset-0.5"></span>
                    <span class="sr-only">Open main menu</span>
                    <!--
                      Icon when menu is closed.

                      Menu open: "hidden", Menu closed: "block"
                    -->
                    <svg class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                    </svg>
                    <!--
                      Icon when menu is open.

                      Menu open: "block", Menu closed: "hidden"
                    -->
                    <svg class="hidden h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>
            <div class="flex flex-1 items-center justify-left sm:items-stretch sm:justify-start">
                <div class="flex flex-shrink-0 items-center">
                    <svg class="w-8 h-8 text-white transition duration-75" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                        <path fill-rule="evenodd" d="M17 10v1.126c.367.095.714.24 1.032.428l.796-.797 1.415 1.415-.797.796c.188.318.333.665.428 1.032H21v2h-1.126c-.095.367-.24.714-.428 1.032l.797.796-1.415 1.415-.796-.797a3.979 3.979 0 0 1-1.032.428V20h-2v-1.126a3.977 3.977 0 0 1-1.032-.428l-.796.797-1.415-1.415.797-.796A3.975 3.975 0 0 1 12.126 16H11v-2h1.126c.095-.367.24-.714.428-1.032l-.797-.796 1.415-1.415.796.797A3.977 3.977 0 0 1 15 11.126V10h2Zm.406 3.578.016.016c.354.358.574.85.578 1.392v.028a2 2 0 0 1-3.409 1.406l-.01-.012a2 2 0 0 1 2.826-2.83ZM5 8a4 4 0 1 1 7.938.703 7.029 7.029 0 0 0-3.235 3.235A4 4 0 0 1 5 8Zm4.29 5H7a4 4 0 0 0-4 4v1a2 2 0 0 0 2 2h6.101A6.979 6.979 0 0 1 9 15c0-.695.101-1.366.29-2Z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <div class="hidden sm:ml-6 sm:block">
                    <div class="flex space-x-4">
                        <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                        <a href="/system/annualForm" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">휴가 일수 부여 설정</a>
                        <a href="/email/list" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">휴가 촉진 대상자</a>
                        <a href="/leavePromote/list" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">휴가 촉진 게시판</a>
                        <a href="/leavePolicy/list" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">휴가 정책 게시판</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
    </div>

    <!-- Mobile menu, show/hide based on menu state. -->
    <div class="sm:hidden" id="mobile-menu">
        <div class="space-y-1 px-2 pb-3 pt-2">
            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
            <a href="/system/annualForm" class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">휴가 일수 부여 설정</a>
            <a href="/email/list" class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">휴가 촉진 대상자</a>
            <a href="/leavePromote/list" class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">휴가 촉진</a>
            <a href="/leavePolicy/list" class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">휴가 정책</a>
        </div>
    </div>
</nav>



<div class="container">
    <div class="heading">휴가 정책 게시글</div>

    <div class="info-box">
        <div class="item">
            <div class="title">글번호</div>
            <div class="lpbno">${get.lpNum}</div>
        </div>
        <div class="item">
            <div class="title">등록일</div>
            <div>
                <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${get.registerDate}" />
            </div>
        </div>
    </div>

    <div class="content">
        <div class="title2">제목</div>
        <div id="titleInsert">${get.title}</div>
    </div>



    <div class="content">
        <div class="title2">내용</div>
        <div>${get.detail}</div>
    </div>

    <div class="panel">
        <div class="panel-heading">첨부 파일</div>
        <div class="panel-body">
            <div class="uploadResult">
                <ul>
                    <!-- 첨부 파일 목록은 여기에 추가됩니다 -->
                </ul>
            </div>
        </div>
    </div>
    <div class="buttons">
        <a href="update?lpNum=${get.lpNum }">수정하기</a>
        <a id="deleteBtn">삭제하기</a>
    </div>
</div>


<div id="myModal" class="modal">
    <!-- 모달 내용 -->
    <div class="modal-content">

<%--        C:\workspace\springBoots_work\humanstory\src\main\resources\img\alert.png--%>
<%--        C:\workspace\springBoots_work\humanstory\src\main\webapp\WEB-INF\views\leavePolicy\get.jsp--%>
        <span class="close">&times;</span>
    <img alt="삭제 경고" src="/img/alert.png">
        <p>경고! 정말 삭제하시겠습니까?</p>
        <button id="confirmDeleteBtn">삭제</button>
        <button id="cancleDeleteBtn">취소</buttom>
    </div>
</div>

<form id="deleteSubmit" action="delete" method="post">
    <input type="hidden" name="lpNum" value="${get.lpNum }">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(function(){

        (function(){

            var lpNum = "${get.lpNum}";

            $.getJSON("/leavePolicy/getAttachList", {lpNum: lpNum}, function(arr){
                console.log("==============");
                console.log(arr);
                var str = "";

                $(arr).each(function(i, attach){
                    //image type
                    if(attach.fileType){
                        var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);

                        str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                        str += "<img src='/display?fileName="+fileCallPath+"'>";
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

                $(".uploadResult ul").html(str);

            });//end getjson
        })();


        $(".uploadResult").on("click","li", function(e){

            console.log("view image");

            var liObj = $(this);

            var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));

            if(liObj.data("type")){
                showImage(path.replace(new RegExp(/\\/g),"/"));
            }else {
                //download
                self.location ="/download?fileName="+path
            }


        });

        function showImage(fileCallPath){

            alert(fileCallPath);

            $(".bigPictureWrapper").css("display","flex").show();

            $(".bigPicture")
                .html("<img src='/display?fileName="+fileCallPath+"' >")
                .animate({width:'100%', height: '100%'}, 1000);

        }

        $(".bigPictureWrapper").on("click", function(e){
            $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
            setTimeout(function(){
                $('.bigPictureWrapper').hide();
            }, 1000);
        });

        $("#deleteBtn").click(function() {
            $("#myModal").css("display", "block");
        })

        $("#cancleDeleteBtn").click(function(){

            $("#myModal").css("display","none");
        })
        $("#confirmDeleteBtn").click(function(){
            $("#deleteSubmit").submit();
        });
    });//end function
</script>
<%@include file="../ShareView/footer.jsp"%>

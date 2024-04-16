<%@include file="sideBar.jsp"%>
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


    .navigation {
        margin-top: 25px;
        margin-left: 255px;
    }

    .navigation div {
        display: inline;

        margin-right: 20px;


    }

    .navigation div a {
        text-decoration: none;
        color: #dae0eb;
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

    #promoteNav{
        color: #676767;
    }

    #promoteNav:hover{
        color: #2900c5;
    }

</style>

<div class="navigation">
    <nav class="dark:bg-gray-900 pt-4">
        <div class="max-w-screen-xl justify-between mx-auto p-4">
            <div class="hidden w-full md:block md:w-auto" id="navbar-default">
                <ul class="font-medium flex flex-col p-4 md:p-0 mt-4 rounded-lg bg-gray-800 md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-gray-800 dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                    <li>
                        <a href="/main" class="block py-2 px-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white md:dark:text-blue-500" aria-current="page">메인페이지</a>
                    </li>
                    <li>
                        <a href="/system/annualForm" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 일수 부여 설정</a>
                    </li>
                    <li>
                        <a href="/email/list" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 촉진 대상자</a>
                    </li>
                    <li>
                        <a href="/leavePromote/list"  id="promoteNav" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 촉진</a>
                    </li>
                    <li>
                        <a href="/leavePolicy/list" id="policyNav" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 정책</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>


<div class="container">
    <div class="heading">휴가 촉진 게시글</div>

    <div class="info-box">
        <div class="item">
            <div class="title">글번호</div>
            <div class="lpbno">${get.lprNum}</div>
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
        <a href="update?lprNum=${get.lprNum }">수정하기</a>
        <a id="deleteBtn">삭제하기</a>
    </div>
</div>


<div id="myModal" class="modal">
    <!-- 모달 내용 -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <img alt="삭제 경고" src="../resources/img/alert.png">
        <p>경고! 정말 삭제하시겠습니까?</p>
        <button id="confirmDeleteBtn">삭제</button>
        <button id="cancleDeleteBtn">취소</buttom>
    </div>
</div>

<form id="deleteSubmit" action="delete" method="post">
    <input type="hidden" name="lprNum" value="${get.lprNum }">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(function(){

        (function(){

            var lprNum = "${get.lprNum}";

            $.getJSON("/leavePromote/getAttachList", {lprNum: lprNum}, function(arr){
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
<%@include file="footer.jsp"%>

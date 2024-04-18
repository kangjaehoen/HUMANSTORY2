<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../ShareView/sideBar.jsp"%>





<%--<meta name="_csrf" content="${_csrf.token}"/>--%>
<%--<meta name="_csrf_header" content="${_csrf.headerName}"/>--%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="p-1 sm:ml-64">
    <link
            href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
            rel="stylesheet">
    <style type="text/css">
        .container {
            max-width: 800px;
            margin-left: 50px;
            padding-left: 100px;
            padding-right: 100px;
            padding-top: 0px;
            padding-bottom: 30px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }

        label {
            font-size: 20px;
        }

        #title {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-bottom: 3px solid #ddd;
            border-left: none;
            border-right: none;
            border-top: none;
            box-sizing: border-box;
            margin-bottom: 30px;
            height: 80px;
            font-size: 24px;
            padding-bottom: 0px;
            margin-top: 15px;
        }

        #title:focus {
            outline: none;
        }

        #detail {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            height: 300px;
        }

        /* 입력 필드와 라벨 스타일 */
        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
        }

        .input-group input[type="text"], .input-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .input-group textarea {
            height: 150px;
        }

        .panel-body {
            padding: 20px;
        }

        .uploadDiv label {
            display: inline-block;
            padding: 10px 15px;
            font-size: 16px;
            background-color: #b5b7e5;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .uploadDiv label:hover {
            background-color: #5c5e91;
        }

        .uploadResult ul {
            list-style: none;
            padding: 0;
        }

        .uploadResult li {
            margin-bottom: 10px;
            overflow: hidden;
        }

        .uploadResult li span {
            display: block;
            margin-bottom: 5px;
            font-size: 16px;
        }

        .uploadResult li img {
            max-width: 100px;
            height: auto;
            margin-top: 5px;
            display: block;
        }

        .uploadResult li button {
            display: inline-block;
            margin-left: 10px;
            padding: 5px;
            font-size: 14px;
            background-color: #f44336;
            color: #fff;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .upload-box {
            border: 2px dashed #aaa;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
        }

        .uploadResult li button:hover {
            background-color: #d32f2f;
        }

        /* 등록 버튼 스타일 */
        #submitBtn {
            display: block;
            width: 100%;
            padding: 13px;
            font-size: 18px;
            background-color: rgb(31, 41, 55);
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 30px;
        }

        #submitBtn:hover {
            background-color: #5c5e91;
        }

        #navigation {
            margin-top: 58.5px;
        }

        /*#title{*/
        /*    margin-top: 50px;*/
        /*}*/

    </style>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/lang/summernote-ko-KR.js"></script>




     <nav class="bg-gray-800 mt-[58.5px]">
        <div id="navigation" class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
            <div class="relative flex h-12 items-center justify-between">
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






    <div class="border-gray-300 rounded-lg dark:border-gray-600 h-32 md:h-64">
        <form role="form" action="register" method="post">
            <div>
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}" />
            </div>

            <div>
                <input type="text" id="title" name="title" placeholder="제목을 입력해주세요.">
            </div>

            <div id="detailDiv">
                <textarea id="summernote" name="detail" placeholder="내용을 입력해주세요." /></textarea>
            </div>


            <input id="empNumCheck" type="hidden" name="empNum"
                   value='<sec:authentication property="principal.emp.empNum"/>' />


            <input id="submitBtn" type="submit" value="등록">
        </form>


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">

                    <div class="panel-heading"></div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="form-group uploadDiv">
                            <div class="upload-box" id="dropArea">
                                <div>클릭하여 파일을 선택하세요.</div>
                                <input type="file" name='uploadFile' multiple>

                                <div class='uploadResult'>
                                    <ul>

                                    </ul>
                                </div>

                            </div>
                        </div>





                    </div>
                    <!--  end panel-body -->
                </div>
                <!--  end panel-body -->
            </div>
            <!-- end panel -->
        </div>
        <!-- /.row -->

    </div>
    <script type="text/javascript">
        $(function() {

        /*    const token = $("meta[name='_csrf']").attr("content");
            const header = $("meta[name='_csrf_header']").attr("content");*/

            let empNumCheck = $("#empNumCheck").val()

            console.log(empNumCheck);

            var formObj = $("form[role='form']");

            $("#submitBtn")
                .on(
                    "click",
                    function(e) {
                        e.preventDefault();
                        console.log("submit clicked");
                        var str = "";

                        $(".uploadResult ul li")
                            .each(
                                function(i, obj) {

                                    var jobj = $(obj);

                                    console.dir(jobj);
                                    console
                                        .log("-------------------------");
                                    console.log(jobj
                                        .data("filename"));

                                    str += "<input type='hidden' name='attachList["
                                        + i
                                        + "].fileName' value='"
                                        + jobj
                                            .data("filename")
                                        + "'>";
                                    str += "<input type='hidden' name='attachList["
                                        + i
                                        + "].uuid' value='"
                                        + jobj.data("uuid")
                                        + "'>";
                                    str += "<input type='hidden' name='attachList["
                                        + i
                                        + "].uploadPath' value='"
                                        + jobj.data("path")
                                        + "'>";
                                    str += "<input type='hidden' name='attachList["
                                        + i
                                        + "].fileType' value='"
                                        + jobj.data("type")
                                        + "'>";
                                });

                        console.log(str);

                        formObj.append(str).submit();
                    });

            var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            var maxSize = 5242880; //5MB

            function checkExtension(fileName, fileSize) {

                if (fileSize >= maxSize) {
                    alert("파일 사이즈 초과");
                    return false;
                }

                if (regex.test(fileName)) {
                    alert("해당 종류의 파일은 업로드할 수 없습니다.");
                    return false;
                }
                return true;
            }

            $("input[type='file']").change(function(e) {
                var formData = new FormData();
                var inputFile = $("input[name='uploadFile']");
                var files = inputFile[0].files;

                for (var i = 0; i < files.length; i++) {
                    if (!checkExtension(files[i].name, files[i].size)) {
                        return false;
                    }
                    formData.append("uploadFile", files[i]);
                }

                $.ajax({
                    url : '/uploadAjaxAction',
                    processData : false,
                    contentType : false,
                    data : formData,
                    type : 'POST',
                    dataType : 'json',
                    success : function(result) {
                        console.log(result);
                        showUploadResult(result); //업로드 결과 처리 함수

                    }
                }); //$.ajax
            });//end change
            function showUploadResult(uploadResultArr) {

                if (!uploadResultArr || uploadResultArr.length == 0) {
                    return;
                }

                var uploadUL = $(".uploadResult ul");

                var str = "";

                $(uploadResultArr)
                    .each(
                        function(i, obj) {

                            if (obj.image) {
                                var fileCallPath = encodeURIComponent(obj.uploadPath
                                    + "/s_"
                                    + obj.uuid
                                    + "_"
                                    + obj.fileName);
                                str += "<li data-path='"+obj.uploadPath+"'";
                                str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
                                str +" ><div>";
                                str += "<span> " + obj.fileName
                                    + "</span>";
                                str += "<button type='button' data-file=\'"+fileCallPath+"\' "
                                str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                                str += "<img src='/display?fileName="
                                    + fileCallPath + "'>";
                                str += "</div>";
                                str + "</li>";
                            } else {
                                var fileCallPath = encodeURIComponent(obj.uploadPath
                                    + "/"
                                    + obj.uuid
                                    + "_"
                                    + obj.fileName);
                                var fileLink = fileCallPath.replace(
                                    new RegExp(/\\/g), "/");

                                str += "<li "
                                str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
                                str += "<span> " + obj.fileName
                                    + "</span>";
                                str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
                                str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                                str += "<img src='/resources/img/attach.png'></a>";
                                str += "</div>";
                                str + "</li>";
                            }

                        });

                uploadUL.append(str);
            }

        })
    </script>
    <script type="text/javascript">
        $(document).ready(function() {

            $('#summernote').summernote({
                height : 300, // 에디터 높이
                minHeight : null, // 최소 높이
                maxHeight : null, // 최대 높이
                focus : true, // 에디터 로딩후 포커스를 맞출지 여부
                lang : "ko-KR", // 한글 설정
                placeholder : '내용을 입력해주세요.' //placeholder 설정

            })

        });
    </script>
</div>
<%@include file="../ShareView/footer.jsp"%>
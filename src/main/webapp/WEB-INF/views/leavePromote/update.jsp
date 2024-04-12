<%@include file="sideBar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%--<meta name="_csrf" content="${_csrf.token}"/>--%>
<%--<meta name="_csrf_header" content="${_csrf.headerName}"/>--%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="p-1 sm:ml-64">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <style type="text/css">
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding-left: 70px;
            padding-right: 70px;
            padding-top: 20px;
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
            background-color: #b5b7e5;
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
        .navigation {
            margin-top: 20px;
        }

        .navigation div {
            display: inline;

            margin-right: 50px;


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

        #promoteNav {
            color: #676767;
        }

        #promoteNav:hover {
            color: #2900c5;
        }
    </style>
    </head>
    <body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/lang/summernote-ko-KR.js"></script>


    <div class="navigation">
        <nav class="dark:bg-gray-900 pt-4">
            <div class="max-w-screen-xl justify-between mx-auto p-4">
                <div class="hidden w-full md:block md:w-auto" id="navbar-default">
                    <ul class="font-medium flex flex-col p-4 md:p-0 mt-4 rounded-lg bg-gray-800 md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-gray-800 dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                        <li>
                            <a href="/" class="block py-2 px-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white md:dark:text-blue-500" aria-current="page">메인페이지</a>
                        </li>
                        <li>
                            <a href="/system/annualForm" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 일수 부여 설정</a>
                        </li>
                        <li>
                            <a href="/email/list" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 촉진 대상자</a>
                        </li>
                        <li>
                            <a href="/leavePromote/list" id="promoteNav" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 촉진</a>
                        </li>
                        <li>
                            <a href="/leavePolicy/list" id="policyNav" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">휴가 정책</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>


    <div class="border-gray-300 rounded-lg dark:border-gray-600 h-32 md:h-64">
        <form role="form" action="update" method="Post">
            <div>
                <input type="text" id="title" name="title" value="${get.title }">
            </div>

            <div id="detailDiv">
                <textarea id="summernote" name="detail">${get.detail }</textarea>
            </div>
            <input type="hidden" name="lprNum" value="${get.lprNum }">

            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
            <input id="submitBtn" type="submit" value="수정하기">
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
        $(document).ready(function() {
            (function(){
                var lprNum = ${get.lprNum};

                $.getJSON("/leavePromote/getAttachList", {lprNum: lprNum}, function(arr){
                    console.log(arr);
                    var str = "";

                    $(arr).each(function(i, attach){
                        // image type
                        if(attach.fileType){
                            var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);

                            str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
                            str += "<span>" + attach.fileName + "</span>";
                            str += "<button type='button' data-file='" + fileCallPath + "' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                            str += "<img src='/display?fileName=" + fileCallPath + "'>";
                            str += "</div></li>";
                        } else {
                            str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
                            str += "<span>" + attach.fileName + "</span><br/>";
                            str += "<button type='button' data-file='" + fileCallPath + "' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                            str += "<img src='/resources/img/attach.png'></div></li>";
                        }
                    });

                    $(".uploadResult ul").html(str);
                });//end getjson
            })();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".uploadResult").on("click", "button", function(e){
                if(confirm("파일을 삭제하시겠습니까?")){

                    var click =$(this).closest("li");
                    click.remove();
                }
            })
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

            var formObj = $("form[role='form']");

            $("#submitBtn").on("click",function(e) {
                e.preventDefault();
                console.log("submit clicked");
                var str = "";

                $(".uploadResult ul li").each(
                    function(i, obj) {

                        var jobj = $(obj);

                        console.dir(jobj);
                        console.log("-------------------------");
                        console.log(jobj.data("filename"));

                        str += "<input type='hidden' name='attachList["
                            + i + "].fileName' value='"
                            + jobj.data("filename") + "'>";
                        str += "<input type='hidden' name='attachList["
                            + i + "].uuid' value='"
                            + jobj.data("uuid") + "'>";
                        str += "<input type='hidden' name='attachList["
                            + i + "].uploadPath' value='"
                            + jobj.data("path") + "'>";
                        str += "<input type='hidden' name='attachList["
                            + i + "].fileType' value='"
                            + jobj.data("type") + "'>";
                    });

                console.log(str);

                formObj.append(str).submit();
            });
            // const token = $("meta[name='_csrf']").attr("content");
            // const header = $("meta[name='_csrf_header']").attr("content");

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
                    // beforeSend : function(xhr) {
                    //     xhr.setRequestHeader(header, token);
                    // },
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
                                str += "<span> " + obj.fileName + "</span>";
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
                                str += "<span> " + obj.fileName + "</span>";
                                str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
                                str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                                str += "<img src='/resources/img/attach.png'></a>";
                                str += "</div>";
                                str + "</li>";
                            }

                        });

                uploadUL.append(str);
            }


        });
    </script>
    <script type="text/javascript">
        $(document).ready(function() {

            $('#summernote').summernote({
                height : 300, // 에디터 높이
                minHeight : null, // 최소 높이
                maxHeight : null, // 최대 높이
                focus : true, // 에디터 로딩후 포커스를 맞출지 여부
                lang : "ko-KR" // 한글 설정

            })

        });
    </script>
<%@include file="footer.jsp"%>
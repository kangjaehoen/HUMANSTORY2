<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"   %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="sideBar.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.3/css/bootstrap.min.css" rel="stylesheet">
<script
        src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<style>
    .container
    {
        margin-left: 270px;
        margin-top: 25px;
    }
    td{
        padding: 10px;
    }
    .modal{
        /*margin-left: 270px;*/
        /*margin-top: 100px;*/

        position: fixed;
        top: 50%;
        left: 50%;
        /*transform: translate(-50%, -50%);*/
        z-index: 50; /* 모달은 더 위에 위치 */
        /* 필요한 다른 스타일들 */
    }
    .Add{
        margin-top: 20px;
    }

    .panel {
        font-family: '굴림', 'Gulim', sans-serif; /* 굵은 궁서체 */
        font-weight: bold; /* 굵게 */
        color: black; /* 흰색 */
    }


    a.manage{
        color: white;
        margin-right: 200px;
    }

    .col-span-1{
        margin-bottom: 15px;
    }
    .table{
        border: 2px solid white;
        border-radius: 10px;
    }
    /*.navigation{*/
    /*    margin-left: 270px;*/
    /*    margin-top: 50px;*/
    /*}*/
    body {
        background-color: #b8b4b1 !important;
    }
    .navi{
        margin-bottom: 10px;
        border-radius: 10px;
    }
    .bg{
     background-color: rgb(31 41 55);
    }

</style>



<section class="relative py-16 bg-blueGray-50">
    <div class="container grid grid-raws-3">
        <div class="rows-cols-1">

            <div class="bg bg-opacity-5 text-white shadow-lg hidden md:block navi">
                <div class="container mx-auto flex items-center h-16">
                    <ul class="grid grid-cols-4 ">
                        <li class="col-span-1 ">
                            <a  class="manage" href="/emp/list">   직원 관리   </a>
                        </li>
                        <li class="col-span-1 "><a class="manage" href="">   지역 관리   </a></li>
                        <li class="col-span-1 "><a class="manage" href="/dept/list">   부서 관리   </a></li>
                        <li class="col-span-1 "><a class="manage" href="">   직위 관리   </a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row-cols-3">
            <div id="background" class="relative overflow-x-auto  sm:rounded-lg h-screen" >
    <%--            <div class="panel">직원 출력 </div>--%>

                <div class="block w-full">
                    <table class="table items-center w-full bg-transparent border-collapse">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                        <tr>

                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-white-300 border-white-700">사원번호</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">사원명</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">직책</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">전화 번호</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">입사일</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">이메일</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">주소</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">근무일</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">생년월일</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">부서</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">사진등록</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">삭제</th>
                            <th scope="col" class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left bg-gray-300 text-pink-300 border-pink-700">수정</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${list}" var="emp">
                            <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                <td class="empNum px-6 py-4" ><c:out value="${emp.empNum}"/></td>

                                <td class="px-6 py-4"><span>${emp.empName}</span>
                                        <%--                                        <c:if test="${not empty emp.uploadPath}">--%>
                                        <%--                                            <button type="button" class="btn btn-default btn-xs picture"--%>
                                        <%--                                            value="${emp.empNum}">사진</button>--%>
                                        <%--                                        </c:if>--%>
                                </td>
                                <td class="px-6 py-4">${emp.job}</td>
                                <td class="px-6 py-4">${emp.phoneNum}</td>
                                <c:if test="${not empty emp.hireDate}">
                                    <fmt:formatDate value="${emp.hireDate}" pattern="yyyy/mm/dd" var="formattedhireDate"/>
                                    <td class="px-6 py-4">${formattedhireDate}</td>
                                </c:if>
                                <td class="px-6 py-4">${emp.email}</td>
                                <td class="px-6 py-4">${emp.address}</td>
                                <td class="px-6 py-4">${emp.workDate}</td>
                                <td class="px-6 py-4">${emp.birthDate}</td>
                                <td class="px-6 py-4">${emp.deptNum}</td>
                                <td class="px-6 py-4">
                                    <button     data-modal-target="default-modal"
                                                 data-modal-toggle="default-modal"
                                                 class="text-gray-900 hover:text-white border border-gray-800
                                                 hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-gray-300
                                                 font-medium rounded-lg text-sm px-4 py-2.5 text-center me-2 mb-2
                                                 dark:border-gray-600 dark:text-gray-400 dark:hover:text-white
                                                 dark:hover:bg-gray-600 dark:focus:ring-gray-800
                                                 btnPictureInsert pictureInsertForm"

                                                 type="button"
    <%--                                        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded--%>
    <%--                                                               " --%>
                                    >
                                        사진등록
                                    </button>
                                </td>
                                <td class="px-6 py-4">
                                    <button type="button"
                                            class="text-gray-900 hover:text-white border border-gray-800
                                                 hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-gray-300
                                                 font-medium rounded-lg text-sm px-4 py-2.5 text-center me-2 mb-2
                                                 dark:border-gray-600 dark:text-gray-400 dark:hover:text-white
                                                 dark:hover:bg-gray-600 dark:focus:ring-gray-800 delete"
                                            value="${emp.empNum}">삭제</button>
                                </td>
                                <td class="px-6 py-4">
                                    <a type="button"
                                        href="/emp/modify?empNum=${emp.empNum}"
                                        class="text-gray-900 hover:text-white border border-gray-800
                                             hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-gray-300
                                             font-medium rounded-lg text-sm px-4 py-2.5 text-center me-2 mb-2
                                             dark:border-gray-600 dark:text-gray-400 dark:hover:text-white
                                             dark:hover:bg-gray-600 dark:focus:ring-gray-800">수정
                                    </a>

                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <form class="form Add" role="form" method="post">
                        <a href="/emp/register"
                           class="text-gray-900 hover:text-white border border-gray-800
                                             hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-gray-300
                                             font-medium rounded-lg text-sm px-4 py-2.5 text-center me-2 mb-2
                                             dark:border-gray-600 dark:text-gray-400 dark:hover:text-white
                                             dark:hover:bg-gray-600 dark:focus:ring-gray-800 bg-white">Add</a>

                    </form>
                    <%-- table 들--%>
                </div>
            </div>
        </div>
    </div>
        <%-- search form--%>

        <%--사진 보기 모달--%>
    <%--    <div id="pictureModal" class="modal fade" role="dialog">--%>
    <%--        <div class="modal-dialog modal-sm">--%>

    <%--            <!-- Modal content-->--%>
    <%--            <div class="modal-content">--%>
    <%--                <div class="modal-header">--%>
    <%--                    <button type="button" class="close" data-dismiss="modal">&times;</button>--%>

    <%--                    &lt;%&ndash; 사진 보기 선택한 사용자의 이름 출력 &ndash;%&gt;--%>
    <%--                    <h4 class="modal-title pictureName">홍길동의 사진</h4>--%>

    <%--                </div>--%>

    <%--                <div class="modal-body">--%>
    <%--                    <div style="text-align: center;">--%>

    <%--                        &lt;%&ndash; Ajax 요청에 대한 응답 결과를 가지고 이미지 처리 &ndash;%&gt;--%>
    <%--                        <img src="/resources/img/s_saveFile.getName()" alt="섬네일 사진">--%>

    <%--                    </div>--%>
    <%--                </div>--%>

    <%--                <div class="modal-footer">--%>
    <%--                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
    <%--                </div>--%>
    <%--            </div>--%>

    <%--        </div>--%>
    <%--    </div>--%>


    <div class="modal">
        <div id="pictureInsertForm" tabindex="-1" aria-hidden="true" role="dialog"
             class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center
                      items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full modal fade"
             >
            <div class="modal-dialog relative p-4 w-full max-w-2xl max-h-full">

                <!-- Modal content-->
                <div class="modal-content relative bg-white rounded-lg shadow dark:bg-gray-700">
    <%--                Modal header--%>
                    <div class="modal-header flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                        <button type="text-gray-900 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-100 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title text-xl font-semibold text-gray-900 dark:text-white">사진 등록</h4>
                    </div>
                    <div class="modal-body p-4 md:p-5 space-y-4">

                         <%--파일 업로드를 위한 설정 추가. enctype="multipart/form-data" --%>
                        <form id="fileUpload" role="form" action="/upload" method="post"
                              enctype="multipart/form-data">

                            <%-- 파일 업로드를 위한 직원 번호 전송 준비 --%>
                            <%--<input type="hidden" id="empNum" name="empNum" value="">--%>
                            <%-- 파일 업로드를 위한 사진 액션 구분(신규 등록 0, 수정 1) --%>
                            <%--<input type="hidden" id="picturekey" name="picturekey" value="0">--%>

                            <div class="form-group">
                                <label for="file">사진등록 (only JPG, 100K byte 이내):</label>
                                <input type="file" name="file" multipleclass="form-control" id="file" required="required"  >
                                <%--<input type='hidden' name='attachList["i"].uploadPath' value='"jobj.data("path")"'>"; &lt;%&ndash;path&ndash;%&gt;--%>
                            </div>
                                <input type="hidden" id="empNum" name="empNum" value="">
                            <button id="uploadBtn" type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Submit</button>
                            <%--<button type="button" class="btn btn-default pictureModal">사진 확인</button>--%>
                                <button type="button" data-modal-hide="default-modal"
                                        class="text-gray-900 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-100 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700" data-dismiss="modal">Close</button>
                        </form>


                    </div>
    <%--                <div class="modal-footer flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">--%>
    <%--                    <button type="button" data-modal-hide="default-modal"--%>
    <%--                            class="text-gray-900 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-100 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700" data-dismiss="modal">Close</button>--%>
    <%--                </div>--%>
                    <div class="modal-footer"></div>
                </div>

            </div>
        </div>

        <div id="deleteFormModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">직원 삭제</h4>
                    </div>
                    <div class="modal-body">

                        <p>현재 선택한 직원 정보(<span id="comment"></span>)를 삭제할까요?</p>
                        <!-- 삭제 진행시 번호와 패스워드를 서버로 전송해야 한다. -->
                        <form action="remove" method="post">

                            <!-- 번호 전송은 hidden form 사용 -->
                            <%-- hidden form 추가 --%>
                            <input type="hidden" id="empNum" name="empNum" value="">

                            <button type="submit" data-oper='remove'
                                      class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900">삭제</button>

                        </form>

                    </div>
                    <div class="modal-footer">

                        <button type="button" class="text-gray-900 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-100 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700"
                                data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>




<script type="text/javascript">


    /*기존*/
    $(document)
        .ready(
            function() {
                <%--var tmp2=$(".btnPictureInsert").parent().parent().find('td').eq(0).text();--%>
                <%--if (!(tmp2 ==<sec:authentication property="principal.emp.empNum"/>)){--%>
                <%--    $(".btnPictureInsert").hide();--%>
                <%--}--%>


                    $(".btnPictureInsert").click(function () {
                        var tmp = $(this).parent().parent().find('td').eq(0).text();

                        $('#empNum').val(tmp);

                        $("#pictureInsertForm").modal(function () {
                            $('#uploadBtn').on("click", function (e) {
                                var formData = new formData();
                                var inputFile = $("input[name='file']");
                                var files = inputFile[0].files;
                                console.log(files);

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

                                for (var i = 0; i < files.length; i++) {
                                    formData.append("uploadFile", files[i]);
                                }
                                $.ajax({
                                    url: '/upload',
                                    processData: false,
                                    data: formData,
                                    type: 'POST',
                                    success: function (result) {
                                        alert("Upload");
                                    }
                                });
                            });
                        });
                    });

                // $(".pictureModal").click(function (){
                //     $("#pictureModal").modal();
                // })


                <%--$("#myModal").modal("hide");--%>
                <%--var result = '<c:out value="${result}"/>';--%>

                <%--checkModal(result);--%>

                <%--history.replaceState({}, null, null);--%>

                <%--function checkModal(result) {--%>

                <%--    if (result === '' || history.state) {--%>
                <%--        return;--%>
                <%--    }--%>

                <%--    $("#myModal").modal("show");--%>
                <%--}--%>

                $("#regBtn").on("click", function () {
                    self.location = "/emp/register";
                    console.log("등록이동");
                });

                // $(".empNum").on(
                //     "click",
                //     function() {
                //         self.location.href = "/emp/modify?empNum="
                //             +empNum;
                //
                //     });

                var actionForm = $("#actionForm");

                // $(".paginate_button a").on(
                //     "click",
                //     function(e) {
                //
                //         e.preventDefault();
                //
                //         console.log('click');
                //
                //         actionForm.find("input[name='emppageNum']")
                //             .val($(this).attr("href"));
                //         actionForm.submit();
                //     });

                $(".move")
                    .on(
                        "click",
                        function (e) {

                            e.preventDefault();
                            actionForm
                                .append("<input type='hidden' name='empNum' value='"
                                    + $(this).attr(
                                        "href")
                                    + "'>");
                            actionForm.attr("action",
                                "/emp/get");
                            actionForm.submit();

                        });

                var searchForm = $("#searchForm");

                $("#searchForm button").on(
                    "click",
                    function (e) {

                        if (!searchForm.find("option:selected")
                            .val()) {
                            alert("검색종류를 선택하세요");
                            return false;
                        }

                        if (!searchForm.find(
                            "input[name='keyword']").val()) {
                            alert("키워드를 입력하세요");
                            return false;
                        }

                        searchForm.find("input[name='pageNum']")
                            .val("1");
                        e.preventDefault();

                        searchForm.submit();

                    });
                var formObj = $("form");
                $("#deleteFormModal").hide();
                $("button.delete").on("click", function (e) {
                    e.preventDefault();


                    $("#deleteFormModal #empNum").val($(this).val());
                    $("#deleteFormModal #comment").text("이름:" + $(this).parents("tr").find("span").text());


                    var operation = $(this).data("oper");
                    //
                    console.log(operation);
                    //
                    if (operation === 'remove') {
                        formObj.attr("action", "/emp/remove");
                    }
                    formObj.submit();
                });
            });


</script>


<%@ include file="footer.jsp" %>



























<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="sideBar.jsp" %>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<%--    <link rel="stylesheet"--%>
<%--          href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">--%>
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script
            src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <style>
        td{
            padding: 10px;
        }
        .container{
            margin-top: 20px;
            margin-left: 200px;
        }
    </style>

    <script type="text/javascript">
        $(document)
            .ready(
                function (){
                    $("#regBtn").on("click",function (){
                        self.location="/dept/register";
                        console.log("등록이동")
                    });

                    $(".deptNum").on(
                        "click",
                        function() {
                            self.location.href = "/dept/modify?deptNum="
                                +deptNum;

                        });


                    var actionForm=$("#actionForm");

                    $(".move").on("click",function (e){
                        e.preventDefault();
                        actionForm
                            .append("<input type='hidden' name='deptNum' value='"
                                +$(this).attr(
                                    "href")
                                +"'>");
                        actionForm.attr("action","/dept/get");
                        actionForm.submit();

                    });
                    var searchForm=$("#searchForm");
                    $("#searchForm button").on(
                        "click",
                        function (e){
                            if(!searchForm.find("option:selected")
                                .val()){
                                alert("검색종류를 선택하세요");
                                return false;
                            }

                            if (!searchForm.find(
                                "input[name='keyword']").val()){
                                alert("키워드를 입력하세요");
                                return false;
                            }
                            searchForm.find("input[name='pageNum']")
                                .val("1");
                            e.preventDefault();
                            searchForm.submit();

                        });

                    var formObj=$("form");

                    $("button.delete").on("click",function (e){
                        e.preventDefault();



                        $("#deleteFormModal #deptNum").val($(this).val());
                        $("#deleteFormModal #comment").text("이름:"+$(this).parents("tr").find("span").text());
                        $("#deleteFormModal").modal();

                        var operation=$(this).data("oper");
                        //
                        console.log(operation);
                        //
                        if (operation==='remove'){
                            formObj.attr("action","/dept/remove");
                        }
                        formObj.submit();
                    });
                });
    </script>

<style>
    .container
    {
        margin-left: 270px;
        margin-top: 100px;
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
    #background{
        background-color: #ddd;
    }
    .panel {
        font-family: '굴림', 'Gulim', sans-serif; /* 굵은 궁서체 */
        font-weight: bold; /* 굵게 */
        color: black; /* 흰색 */
    }


    a.manage{
        background-color: #337ab7;
        border-radius: 10px; /* 둥근 모서리 설정 */
        padding: 10px; /* 내부 여백 추가 (선택 사항) */
        margin: 5px 0; /* 바깥쪽 여백 추가 (선택 사항) */
        color: white;
        text-align: center;

    }

    .col-span-1{
        margin-bottom: 15px;
    }

</style>



<div class="container">
    <div class="grid grid-raws-2 gap-4">
        <div>
            <h1 style="font-size: x-large;">
               부서관리<small>v3.0</small>
            </h1>
        </div>

    <%--    <div>--%>
    <%--        <button id="regBtn" type="button">신규 부서 등록</button>--%>
    <%--        <button id="modiBtn" type="button">부서 수정</button>--%>
    <%--    </div>--%>

        <div class="grid grid-raws-1 gap-10">
            <ul class="grid grid-cols-4 gap-10">
                <li class="col-span-1"><a class="manage" href="/emp/list">직원관리</a></li>
                <li class="col-span-1"><a class="manage" href="regionlist.it">지역관리</a></li>
                <li class="col-span-1"><a class="manage" href="/dept/list">부서관리</a></li>
                <li class="col-span-1"><a class="manage" href="positionlist.it">직위관리</a></li>
            </ul>
        </div>
    </div>







    <div class="panel-group">
        <div id="background" class="relative overflow-x-auto shadow-md sm:rounded-lg">
            <div class="panel">부서 출력</div>

            <div >
                <table class="table w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                        <tr>
                            <th scope="col" class="px-6 py-3">부서번호</th>
                            <th scope="col" class="px-6 py-3">부서명</th>
                            <th scope="col" class="px-6 py-3">삭제</th>
                            <th scope="col" class="px-6 py-3">수정</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${list}" var="dept">
                        <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                            <td class="deptNum px-6 py-4">${dept.deptNum} </td>

                            <td class="px-6 py-4">${dept.deptName} </td>
                            <td  class="px-6 py-4">
                                <button type="button" class="btn btn-default btn-xs delete"
                                        value="${dept.deptNum}">삭제</button>
                            </td>
                            <td  class="px-6 py-4">
                                <a href="/dept/modify?deptNum=${dept.deptNum}" role="button"
                                   class="btn btn-default btn-xs">수정</a>
                            </td>


                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <form class="form-inline" role="form" method="post">
                    <a href="/dept/register" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Add</a>
                </form>
            </div>
        </div>
    </div>
</div>
<%--containner finished--%>

<div class="modal">
    <div id="deleteFormModal" tabindex="-1" aria-hidden="true"  role="dialog"
         class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center
                  items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full modal fade">
        <div class="modal-dialog relative p-4 w-full max-w-2xl max-h-full">

            <!-- Modal content-->
            <div class="modal-content relative bg-white rounded-lg shadow dark:bg-gray-700">
                <div class="modal-header flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">직원 삭제</h4>
                </div>
                <div class="modal-body">

                    <p>현재 선택한 직원 정보(<span id="comment"></span>)를 삭제할까요?</p>
                    <!-- 삭제 진행시 번호와 패스워드를 서버로 전송해야 한다. -->
                    <form action="remove" method="post">

                        <!-- 번호 전송은 hidden form 사용 -->
                        <%-- hidden form 추가 --%>
                        <input type="hidden" id="deptNum" name="deptNum" value="">

                        <button type="submit" data-oper='remove'
                                class="btn btn-default">삭제</button>

                    </form>

                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-default btn-sm"
                            data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</div>


<%@ include file="footer.jsp" %>


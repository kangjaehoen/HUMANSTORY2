<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Employee Update</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Employee Modify</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <form role="form" action="/emp/modify" method="post">



<%--                    <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>--%>
<%--                    <input type='hidden' name='empamount' value='<c:out value="${cri.empamount }"/>'>--%>
<%--                    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>--%>
<%--                    <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>--%>


                    <div class="form-group">
                        <label>empNum</label>
                        <input class="form-control" name='empNum'
                               value='<c:out value="${emp.empNum}"/>' readonly="readonly">
                    </div>

                    <div class="form-group">
                        <label>empName</label>
                        <input class="form-control" name='empName'
                               value='<c:out value="${emp.empName }"/>' >
                    </div>

                    <div class="form-group">
                        <label>pw</label>
                        <input class="form-control" name='pw'
                               value='<c:out value="${emp.pw }"/>' >
                    </div>

                    <div class="form-group">
                        <label>job</label>
                        <input class="form-control" name='job'
                               value='<c:out value="${emp.job}"/>' >
                    </div>

                    <div class="form-group">
                        <label>phoneNum</label>
                        <input class="form-control" name='phoneNum'
                               value='<c:out value="${emp.phoneNum}"/>' >
                    </div>

                    <div class="form-group">
                        <label>hireDate</label>
                        <input class="form-control" name='hireDate'
                        <%-- value='<c:out value="${emp.hireDate }" --%>
                               value='<fmt:formatDate value="${emp.hireDate}" pattern="yyyy/MM/dd" />' />
                    </div>

                    <div class="form-group">
                        <label>email</label>
                        <input class="form-control" name='email'
                               value='<c:out value="${emp.email }"/>' >
                    </div>

                    <div class="form-group">
                        <label>address</label>
                        <input class="form-control" name='address'
                               value='<c:out value="${emp.address }"/>' >
                    </div>

                    <div class="form-group">
                        <label>workDate</label>
                        <input class="form-control" name='workDate'
                               value='<c:out value="${emp.workDate }"/>' >
                    </div>

                    <div class="form-group">
                        <label>birthDate</label>
                        <input class="form-control" name='birthDate'
                               value='<c:out value="${emp.birthDate }"/>' >
                    </div>

                    <div class="form-group">
                        <label>deptNum</label>
                        <input class="form-control" name='deptNum'
                               value='<c:out value="${emp.deptNum }"/>' >
                    </div>
                    <div class="form-group">
                        <input type="hidden" class="form-control" name='Enabled'
                               value="1">
                    </div>

                    <button type="submit" data-oper='modify' class="btn btn-secondary">Modify</button>
                    <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
                    <button type="submit" data-oper='list' class="btn btn-info">List</button>

                </form>


            </div>
            <!--  end panel-body -->

        </div>
        <!--  end panel panel-default -->
    </div>
    <!-- end col-lg-12 -->
</div>
<!-- /.row -->

<script type="text/javascript">
    $(document).ready(function() {
        var role='<c:out value="${emp.role}"/>'
        $("#Auth").hide();
        $("document").on("click",function (e){

            if(role==="ROLE_ADMIN"){
                $("#Auth").show();
            }
        });





        var formObj = $("form");

        $('button').on("click", function(e){

            e.preventDefault();

            var operation = $(this).data("oper");

            console.log(operation);

            if(operation === 'remove'){
                formObj.attr("action", "/emp/remove");

            }else if(operation === 'list'){
                //move to list
                self.location="/emp/list";
                return;

            }

            formObj.submit();
        });



    });
</script>

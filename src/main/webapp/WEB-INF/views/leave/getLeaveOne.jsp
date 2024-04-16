<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Your other stylesheets and scripts -->
	
<style>
</style>
</head>

<body>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Leave Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Leave Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="form-group">
					<label>휴가번호</label> <input class="form-control" name='leaveNum'
						value='<c:out value="${leave.leaveNum }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>사원번호</label> <input class="form-control" name='empNum'
						value='<c:out value="${leave.empNum}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>휴가요청일</label> <input class="form-control" name='requestDate'
						value='<fmt:formatDate pattern="yy-MM-dd"
									value="${leave.requestDate}" />' readonly="readonly">
				</div>

				<div class="form-group">
					<label>휴가시작일</label> <input class="form-control" name='startDate'
						value='<fmt:formatDate pattern="yy-MM-dd"
									value="${leave.startDate}" />' readonly="readonly">
				</div>

				<div class="form-group">
					<label>휴가종료일</label> <input class="form-control" name='endDate'
						value='<fmt:formatDate pattern="yy-MM-dd"
									value="${leave.endDate}" />' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>휴가일수</label> <input class="form-control" name='leaveDays'
						value='<c:out value="${leave.leaveDays }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>휴가유형</label> <input class="form-control" name='leaveType'
						value='<c:out value="${leave.leaveType }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>휴가사유</label>
					<textarea class="form-control" rows="3" name='leaveReason'
						readonly="readonly"><c:out value="${leave.leaveReason}" /></textarea>
				</div>

				<!-- 버튼 -->
				<button data-oper='modify' class="btn btn-default">수정</button>
				<button data-oper='list' class="btn btn-info">목록</button>


				<form id='operForm' action="/leave/modify" method="get">
					<input type='hidden' id='leaveNum' name='leaveNum'
						value='<c:out value="${leave.leaveNum}"/>'> <input
						type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum}"/>'> <input
						type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword}"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

				</form>



			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<!-- 수업중 추가된부분 -->
<div class='bigPictureWrapper'>
	<div class='bigPicture'></div>
</div>

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/leave/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#leaveNum").remove();
			operForm.attr("action", "/leave/request")
			operForm.submit();

		});
	});
</script>

</body>

</html>
















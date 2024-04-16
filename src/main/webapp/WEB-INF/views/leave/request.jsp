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
</head>

<body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Leave List Page
				<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
					New Leave</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#휴가번호</th>
							<th>사원번호</th>
							<th>휴가요청일</th>
							<th>휴가시작일</th>
							<th>휴가종료일</th>
							<th>휴가일수</th>
							<th>휴가유형</th>
							<th>휴가사유</th>
							<th>휴가 요청 수정일</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="leave">
						<tr>
							<td><a class='move'
								href='<c:out value="${leave.leaveNum}"/>'> <c:out
										value="${leave.leaveNum}" /> <b>[읽지않은]</b>
							</a></td>
							<td><c:out value="${leave.empNum}" /></td>
							<td><fmt:formatDate pattern="yy-MM-dd"
									value="${leave.requestDate}" /></td>
							<td><fmt:formatDate pattern="yy-MM-dd"
									value="${leave.startDate}" /></td>
							<td><fmt:formatDate pattern="yy-MM-dd"
									value="${leave.endDate}" /></td>
							<td><c:out value="${leave.leaveDays}" /></td>
							<td><c:out value="${leave.leaveType}" /></td>
							<td><c:out value="${leave.leaveReason}" /></td>
							<td><fmt:formatDate pattern="yy-MM-dd"
									value="${leave.updateDate}" /></td>
						</tr>
					</c:forEach>
				</table>

				<div class='pull-right'>
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>

					</ul>
				</div>
				<!--  end Pagination -->
			</div>

			<form id='actionForm' action="/leave/request" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			</form>

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->



<script type="text/javascript">
	$(document)
			.ready(
					function() {


						$("#regBtn").on("click", function() {

							self.location = "/leave/register";

						});

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='leaveNum' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/leave/getLeaveOne");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

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
					});
</script>

</body>

</html>
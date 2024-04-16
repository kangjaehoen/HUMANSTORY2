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
    <style type="text/css">
    	
    </style>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script type="text/javascript">
    
	 $(document).ready(function() {
	
		 $("#startDate, #endDate").datepicker({
		        dateFormat: 'yy-mm-dd',
		        showButtonPanel: true,
		        selectOtherMonths: true,
		        showOtherMonths: true,
		        changeMonth: true,
		        changeYear: true,
		        minDate: 0,
		        maxDate: '+1y',
		        onSelect: function(dateText, inst) {
		            if (inst.id === 'startDate') {
		                $('#endDate').datepicker('option', 'minDate', dateText); // 시작일 이후의 날짜만 선택 가능하도록 종료일의 최소 날짜를 설정
		            } else if (inst.id === 'endDate') {
		                var startDate = $('#startDate').datepicker('getDate');
		                var endDate = $('#endDate').datepicker('getDate');
		                if (startDate && endDate && endDate < startDate) {
		                    alert('종료일은 시작일 이후의 날짜를 선택해야 합니다.');
		                    $('#startDate').datepicker('setDate', endDate); // 시작일을 종료일로 변경
		                    $('#endDate').datepicker('setDate', startDate); // 종료일을 시작일로 변경
		                }
		            }
		        }
		    });
	    
	        // leaveType의 값이 변경될 때마다 leaveDays 값을 조절합니다.
	     // 휴가 유형이 변경될 때마다 총 휴가일수를 계산합니다.
	        $('#leaveType').change(function() {
	            calculateLeaveDays(); // 휴가 유형이 변경될 때마다 총 휴가일수를 계산합니다.
	        });
	
	        // 휴가 시작일과 종료일이 변경될 때마다 총 휴가일수를 계산합니다.
	        $('#startDate, #endDate').change(function() {
	            calculateLeaveDays();
	        });
	
	        function calculateLeaveDays() {
	            var startDate = $('#startDate').datepicker('getDate'); // 시작일
	            var endDate = $('#endDate').datepicker('getDate'); // 종료일
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
	        }
	
	
	    });
    
    </script>
</head>
<body>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Leave Modify</h1>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Leave Modify</div>
      <div class="panel-body">
        <form role="form" action="/leave/modify" method="post">
          <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
          <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
          <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
          <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>

          <div class="form-group">
            <label> 휴가번호</label> 
            <input class="form-control" name='leaveNum' id="leaveNum" value='<c:out value="${leave.leaveNum }"/>' readonly="readonly">
          </div>
          
          <div class="form-group">
            <label>사원번호</label> 
            <input class="form-control" name='empNum' id="empNum" value='<c:out value="${leave.empNum }"/>' readonly="readonly">
          </div>


          <div class="form-group">
              <label for="datepicker">휴가시작일</label> 
              <input class="form-control" name='startDate' id="startDate" placeholder="이곳을 누르세요" 
              value='<fmt:formatDate pattern = "yy/MM/dd" value = "${leave.startDate}" />' >            
          </div>
          
          <div class="form-group">
              <label  for="datepicker">휴가종료일</label> 
              <input class="form-control" name='endDate' id="endDate" placeholder="이곳을 누르세요" 
              value='<fmt:formatDate pattern = "yy/MM/dd" value = "${leave.endDate}" />' >            
          </div>
          
          <div class="form-group">
            <label>휴가일수</label> 
            <input class="form-control" name='leaveDays' id="leaveDays" readonly="readonly" value='<c:out value="${leave.leaveDays}"/>' >            
          </div>
          
          <div class="form-group">
            <label>휴가유형</label> 
            <input class="form-control" name='leaveType' id="leaveType" value='<c:out value="${leave.leaveType}"/>'>            
          </div>
          
          <div class="form-group">
			    <label>휴가사유</label>
			    <textarea class="form-control" rows="8" cols="" name='leaveReason' id="leaveReason"  placeholder="휴가 사유를 작성하십시오">${leave.leaveReason}</textarea>
		 </div>


          <button type="submit" data-oper='modify' class="btn btn-default">수정</button>
          <button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
          <button type="submit" data-oper='list' class="btn btn-info">목록</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $("#startDate").datepicker({
        dateFormat: 'yy/mm/dd' // Date format
    });

    $("#endDate").datepicker({
        dateFormat: 'yy/mm/dd' // Date format
    });

    var formObj = $("form");

    $('button').on("click", function(e){
        e.preventDefault(); 
        var operation = $(this).data("oper");

        if(operation === 'remove'){
            formObj.attr("action", "/leave/remove");
        } else if(operation === 'list'){
            // Move to list
            formObj.attr("action", "/leave/request").attr("method","get");
            
            var pageNumTag = $("input[name='pageNum']").clone();
            var amountTag = $("input[name='amount']").clone();
            var keywordTag = $("input[name='keyword']").clone();
            var typeTag = $("input[name='type']").clone();      
            
            formObj.empty();
            
            formObj.append(pageNumTag);
            formObj.append(amountTag);
            formObj.append(keywordTag);
            formObj.append(typeTag);	       
        }
        
        formObj.submit();
    });
});
</script>

</body>
</html>

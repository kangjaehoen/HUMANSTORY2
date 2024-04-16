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
     <script>
 
	 $(document).ready(function() {
	
		 $("#startDate").datepicker({
		        dateFormat: 'yy-mm-dd',
		        showButtonPanel: true,
		        selectOtherMonths: true,
		        showOtherMonths: true,
		        changeMonth: true,
		        changeYear: true,
		        minDate: 0,
		        maxDate: '+1y'
		    });

		    $('#endDate').datepicker({
		        dateFormat: 'yy-mm-dd',
		        showButtonPanel: true,
		        selectOtherMonths: true,
		        showOtherMonths: true,
		        changeMonth: true,
		        changeYear: true,
		        minDate: 0,
		        maxDate: '+1y',
		        onSelect: function(dateText, inst) {
		            var startDate = $('#startDate').datepicker('getDate');
		            var endDate = $('#endDate').datepicker('getDate');
		            if (startDate && endDate && endDate < startDate) {
		            	alert("종료일은 시작일 이후여야 합니다."); // 경고창 표시
		                // 종료일이 시작일보다 앞설 경우, 시작일과 종료일을 서로 교환
		                $('#startDate').datepicker('setDate', endDate);
		                $('#endDate').datepicker('setDate', startDate);
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
            <h1 class="page-header">Leave Register</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">

                <div class="panel-heading">Leave Register</div>
                <!-- /.panel-heading -->
                <div class="panel-body">

                    <form role="form" action="/leave/register" method="post">
                    
                    	<div class="form-group">
						    <label for="empNum">사원번호</label> 
						    <select class="form-control" id='empNum' name='empNum'>
						    	<option selected="">휴가 유형을 고르세요</option>
						        <option value="101">박길동</option>
						        <option value="201">홍길동</option>
						        <option value="301">최길동</option>
						        <option value="401">유길동</option>
						        <option value="501">김길동</option>
						    </select>
						</div>

		               <div class="form-group">
						    <label for="datepicker">휴가시작일</label>
						    <input id='startDate' class="form-control" name='startDate'>
						</div>
						
						<div class="form-group">
						    <label for="datepicker">휴가종료일</label>
						    <input id='endDate' class="form-control" name='endDate'>
						</div>						
						
						
						<div class="form-group">
						    <label for='leaveType'>휴가 유형</label>
						    <select class="form-control" id='leaveType' name='leaveType'>
						        <option selected="">휴가 유형을 고르세요</option>
						        <option value="연차">연차</option>
						        <option value="반차">반차</option>
						        <option value="반반차">반반차</option>
						        <option value="병가">병가</option>
						        <option value="출산휴가">출산휴가</option>
						        <option value="가족돌봄휴가">가족돌봄휴가</option>
						    </select>
						</div>
						
						<div class="form-group">
						    <label>휴가일수</label>
						    <input class="form-control" id='leaveDays' name='leaveDays' readonly="readonly">
						    휴가 유형에 따라 자동으로 설정될 휴가일수
						</div>  
						
						
                        <div class="form-group">
                            <label>휴가사유</label>
                            <textarea class="form-control" rows="3" name='leaveReason' id="leaveReason" placeholder="휴가 사유를 작성하십시오"></textarea>
                        </div>  
                        
                        <button type="submit" data-oper='register' class="btn btn-default">제출 버튼</button>
                        <button type="reset" class="btn btn-default">리셋 버튼</button>
                    </form>

                </div>
                <!--  end panel-body -->

            </div>
            <!--  end panel-body -->
        </div>
        <!-- end panel -->
    </div>
    <!-- /.row -->


</body>

</html>

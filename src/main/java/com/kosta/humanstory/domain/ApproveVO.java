package com.kosta.humanstory.domain;

import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class ApproveVO {

    private Long leaveNum;// 휴가 신청 번호 PK
    private String empNum; // 사원번호 FK
    private String deptNum;//부서 번호
    private String leaveType;// 휴가유형 FK
    private Date startDate;// 휴가 시작 날짜
    private Date endDate;// 휴가 종료 날짜
    private Date requestDate;// 휴가 신청 날짜
    private Date approvedDate; //결재 날짜
    private int num; //결재 알람용 디폴트값 1 인 컬럼

    private String empName; //사원명
    private String deptName; //부서명
    private int leaveDays; //종료날짜 - 시작날짜 = 휴가일수
    /*매니저입장에서*/
    /*본인 직원 , 휴가내역 ,부서명*/
    /*사원번호 or 사원명,부서명,휴가시작일~종료일,휴가유형 , 휴가일수, 신청날짜 */

    /*유저입장에서*/
    /*본인 휴가내역*/
    /*사원이름 ,부서명 ,휴가시작일~종료일 , 휴가유형 ,휴가일수 ,결재날짜*/


    public ApproveVO() {}

    public ApproveVO(Long leaveNum, String deptNum, String leaveType, Date startDate, Date endDate, Date approvedDate, int num, String empName, String deptName) {
        this.leaveNum = leaveNum;
        this.deptNum = deptNum;
        this.leaveType = leaveType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.approvedDate = approvedDate;
        this.num = num;
        this.empName = empName;
        this.deptName = deptName;
    }

    public ApproveVO(Long leaveNum, String empNum, String leaveType, Date startDate, Date endDate, Date requestDate, int num, String deptName) {
        this.leaveNum = leaveNum;
        this.empNum = empNum;
        this.leaveType = leaveType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.requestDate = requestDate;
        this.num = num;
        this.deptName = deptName;
    }

    public String getStartDate() {
        if (startDate == null) {
            return null;
        } else {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            return formatter.format(startDate);
        }
    }

    public String getEndDate() {
        if (endDate == null) {
            return null;
        } else {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            calculateLeaveDays();
            return formatter.format(endDate);
        }
    }

    public String getRequestDate() {
        if (requestDate == null) {
            return null;
        } else {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            return formatter.format(requestDate);
        }
    }

    public String getApprovedDate() {
        if (approvedDate == null) {
            return null;
        } else {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            return formatter.format(approvedDate);
        }
    }

    private void calculateLeaveDays() {
        long startTime = startDate.getTime();
        long endTime = endDate.getTime();
        long diffTime = endTime - startTime;
        long diffDays = diffTime / (1000 * 60 * 60 * 24); // 밀리초를 날짜로 변환
        leaveDays = (int) diffDays + 1;
    }


}

/*// 컨트롤러에서 휴가 신청 데이터를 가져와서 휴가 상태를 변경하여 보내는 예시 코드
List<LeaveRequest> leaveRequests = leaveRequestService.getLeaveRequestsByEmpNum(empNum); // 특정 사원의 휴가 신청 데이터를 가져오는 메소드를 가정
for (LeaveRequest leaveRequest : leaveRequests) {
        if (leaveRequest.getNum() == 1) {
        leaveRequest.setStatus("결재대기중"); // 휴가 상태를 결재대기중으로 변경
    } else if (leaveRequest.getNum() == 0) {
        leaveRequest.setStatus("결재확인"); // 휴가 상태를 결재확인으로 변경
    } else if (leaveRequest.getNum() == 2) {
        leaveRequest.setStatus("반려된결재"); // 휴가 상태를 반려된결재로 변경
    }
            }
            model.addAttribute("leaveRequests", leaveRequests); // 변경된 휴가 신청 데이터를 View로 보냄*/


/*
// View에서 휴가 신청 데이터를 받아서 휴가 상태를 표현하는 예시 코드
<c:forEach items="${leaveRequests}" var="leaveRequest">
    <tr>
<td>${leaveRequest.getLeaveNum()}</td>
<td>${leaveRequest.getStartDate()}</td>
<td>${leaveRequest.getEndDate()}</td>
<td>${leaveRequest.getLeaveReason()}</td>
<td>${leaveRequest.getLeaveType()}</td>
        <td>
            <c:choose>
                <c:when test="${leaveRequest.getNum() eq 1}">결재대기중</c:when>
                <c:when test="${leaveRequest.getNum() eq 0}">결재확인</c:when>
                <c:when test="${leaveRequest.getNum() eq 2}">반려된결재</c:when>
            </c:choose>
        </td>
    </tr>
</c:forEach>
*/

package com.kosta.humanstory.domain;

import lombok.Data;

import java.util.Date;

@Data
public class LeaveVO {
    private Long leaveNum;// 휴가 신청 번호
    private Date startDate;// 휴가 시작 날짜
    private Date endDate;// 휴가 종료 날짜
    private Date requestDate;// 휴가 신청 날짜
    private Date updateDate;//휴가 수정 날짜
    private double leaveDays; // 휴가 신청한 일수
    private String leaveReason;// 휴가 사유
    private String empNum; // 사원번호
    private String leaveType; // 휴가유형

}

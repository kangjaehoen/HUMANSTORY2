package com.kosta.humanstory.domain;

import lombok.Data;

@Data
public class LeaveCategoryVO {
    private  String leaveType;
    private Double grantDate; //회계일 기준 휴가 부여일수(DB에 저장되어있어야 사원 각각 부여 가능)
    private String grantDay; // 회계일 기준 설정
}

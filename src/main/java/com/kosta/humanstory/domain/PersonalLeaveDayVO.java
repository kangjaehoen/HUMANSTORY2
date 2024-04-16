package com.kosta.humanstory.domain;

import lombok.Data;

@Data
public class PersonalLeaveDayVO {

    private String empNum; // fk
    private String leaveType;//휴가 유형 , fk
    private double it_days;//휴가 유형에 따른 휴가 일수 표현
  /*  private String leaveGrantDay; // 휴가 유형에 따른 휴가일수 날짜 설정*/



}

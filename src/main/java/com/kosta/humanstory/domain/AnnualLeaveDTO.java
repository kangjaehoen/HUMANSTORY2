package com.kosta.humanstory.domain;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class AnnualLeaveDTO {
    private  String empNum; // 사원번호
    private double grantDate; // 회계일 기준 초기 휴가 부여일수
    private String grantDay; // 회계일 설정
    
}

package com.kosta.humanstory.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EmployeeVO {

    private String empNum; // 사원번호
    private String empName; // 사원명
    private String pw; // 비밀번호
    private String job; // 직책
    private int phoneNum; // 전화번호
    private Date hireDate; // 입사일
    private String email; // 이메일
    private int annualLeaveNum; // 연차일
    private String address; // 주소
    private int workDate; // 근무일
    private int birthDate; // 생년월일
    private  String  departNum; // 부서
    private String uploadPath; // 사원 프로필사진
    private boolean enabled; // 시큐리티 적용확인

    private String role;

      private List<AuthVO> authList; // 권한

      private List<LeaveVO> leaveVO; //휴가 신청내역


}

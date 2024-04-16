package com.kosta.humanstory.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
    public class EmployeeVO {

    private String empNum; // 사원번호

    private String empName; // 사원명

    private String pw; // 비밀번호

    private String job; // 직책

    private int phoneNum; // 전화번호

    private Date hireDate; // 입사일

    private String email; // 이메일

    private String address; // 주소

    private int workDate; // 근무일

    private int birthDate; // 생년월일

    private  String  departNum; // 부서 // -추가

    private String uploadPath; // 사원 프로필사진 - > 수정(추가)

    private boolean enabled; // 시큐리티 적용확인

    private List<AuthVO> authList; // 권한

    private List<LeaveRequestVO> leaveVO; //휴가 신청내역

    private String manager; //사원별 매니저





}

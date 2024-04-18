package com.kosta.humanstory.domain;

import lombok.Data;

@Data
public class EmpEmailInfoDTO {
    private String empNum;
    private String empName;
    private String email;
    private String leaveType;
    private double lt_days;
    private String job;
    private String message;
}


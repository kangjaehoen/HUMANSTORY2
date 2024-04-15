package com.kosta.humanstory.domain;

import lombok.Data;

@Data
public class EmpEmailInfoDTO {
    private String empNum;
    private String empName;
    private String email;
    private String leaveType;
    private double it_days;
    private String job;
    private String message;
}

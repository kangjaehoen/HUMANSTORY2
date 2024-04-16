package com.kosta.humanstory.domain;

import lombok.Data;

@Data
public class LeaveUserDTO {
    private String empNum;
    private String empName;
    private String email;
    private String leaveType;
    private double lt_days;
}

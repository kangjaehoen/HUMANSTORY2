package com.kosta.humanstory.domain;

import lombok.Data;

import java.util.List;

@Data
public class EmployeeWithPersonalLeaveDayDTO {
    private String empNum;
    private String empName;
    private String email;
    private String leaveType;
    private double it_days;
    private PersonalLeaveDayVO leaveVO;
}

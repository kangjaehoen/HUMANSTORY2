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
public class EmployeeDTO {
    private List<EmployeeVO> employeeVOList;
    private Date workDate;
    private String uploadPath; // 사원 프로필사진
}

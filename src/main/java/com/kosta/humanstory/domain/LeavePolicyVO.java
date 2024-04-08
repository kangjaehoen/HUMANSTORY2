package com.kosta.humanstory.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class LeavePolicyVO {

    private int lpNum;
    private String empNum;
    private String title;
    private String detail;
    private Date registerDate;

    private List<AttachVO> attachList;
}

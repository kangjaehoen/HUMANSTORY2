package com.kosta.humanstory.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class LeavePromoteVO {
    private int lprNum;
    private String empNum;
    private String title;
    private String detail;
    private Date registerDate;
    private Date updateDate;

    private List<PromoteAttachVO> attachList;
}

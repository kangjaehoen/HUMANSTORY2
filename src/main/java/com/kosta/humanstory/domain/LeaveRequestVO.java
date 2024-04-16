package com.kosta.humanstory.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LeaveRequestVO {
    private Long leaveNum;
    private Date startDate;
    private Date endDate;
    private Date requestDate;
    private Date updateDate;
    private String leaveReason;
    private String empNum;
    private String leaveType;
    private int num;

    public LeaveRequestVO() {
    }

    public LeaveRequestVO(Long leaveNum, Date startDate, Date endDate, Date requestDate, Date updateDate, String leaveReason, String empNum, String leaveType, int num) {
        this.leaveNum = leaveNum;
        this.startDate = startDate;
        this.endDate = endDate;
        this.requestDate = requestDate;
        this.updateDate = updateDate;
        this.leaveReason = leaveReason;
        this.empNum = empNum;
        this.leaveType = leaveType;
        this.num = num;
    }

    public String toString() {
        return "LeaveVO [leaveNum=" + this.leaveNum + ", startDate=" + this.startDate + ", endDate=" + this.endDate + ", requestDate=" + this.requestDate + ", updateDate=" + this.updateDate + ", leaveReason=" + this.leaveReason + ", empNum=" + this.empNum + ", leaveType=" + this.leaveType + ". num =" + this.num + "]";
    }

    public String getStartDate() {
        new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String startFormattedDate = formatter.format(this.startDate);
        return startFormattedDate;
    }

    public String getEndDate() {
        new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String endFormattedDate = formatter.format(this.endDate);
        return endFormattedDate;
    }

    public String getRequestDate() {
        new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String requestFormattedDate = formatter.format(this.requestDate);
        return requestFormattedDate;
    }

    public String getupdateDate() {
        new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String updateFormattedDate = formatter.format(this.updateDate);
        return updateFormattedDate;
    }

    public Long getLeaveNum() {
        return this.leaveNum;
    }

    public Date getUpdateDate() {
        return this.updateDate;
    }

    public String getLeaveReason() {
        return this.leaveReason;
    }

    public String getEmpNum() {
        return this.empNum;
    }

    public String getLeaveType() {
        return this.leaveType;
    }

    public int getNum() {
        return this.num;
    }
}

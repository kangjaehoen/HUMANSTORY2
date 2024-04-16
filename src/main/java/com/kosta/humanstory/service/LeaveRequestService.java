package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.LeaveRequestDTO;
import com.kosta.humanstory.domain.LeaveRequestVO;

import java.util.List;

public interface LeaveRequestService {

    public List<LeaveRequestVO> getEmpLeaveCharts(String empNum);//해당 사원 휴가 전체 조회
    public List<LeaveRequestVO> getLeaveCharts();//매니저 휴가 전체 조회
    public void registerLeave(LeaveRequestDTO leave);//휴가 신청
    public LeaveRequestVO getLeaveOne(Long leaveNum);//휴가 지정 조회
    public boolean modifyLeave(LeaveRequestDTO leave);//휴가 수정
    public boolean removeLeave(Long leaveNum);//휴가 삭제
}

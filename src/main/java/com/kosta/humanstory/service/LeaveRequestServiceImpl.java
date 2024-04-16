package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.LeaveRequestDTO;
import com.kosta.humanstory.domain.LeaveRequestVO;
import com.kosta.humanstory.mapper.LeaveRequestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeaveRequestServiceImpl implements LeaveRequestService {

    @Autowired
    private LeaveRequestMapper mapper;

    @Override
    public List<LeaveRequestVO> getEmpLeaveCharts(String empNum) {
        System.out.println("휴가 전체 조회 실행");
        return mapper.getEmpList(empNum);
    }

    @Override
    public List<LeaveRequestVO> getLeaveCharts() {
        System.out.println("휴가 전체 조회 실행");
        return mapper.getList();
    }

    @Override
    public void registerLeave(LeaveRequestDTO leave) {
        System.out.println("휴가 등록 실행");
        mapper.insert(leave);
    }

    @Override
    public LeaveRequestVO getLeaveOne(Long leaveNum) {
        System.out.println("휴가 지정 조회 실행");
        return mapper.getDetail(leaveNum);
    }

    @Override
    public boolean modifyLeave(LeaveRequestDTO leave) {
        System.out.println("휴가 수정 실행");
        return mapper.update(leave) ==1;
    }

    @Override
    public boolean removeLeave(Long leaveNum) {
        System.out.println("휴가 삭제 실행");
        return mapper.delete(leaveNum)==1;
    }
}

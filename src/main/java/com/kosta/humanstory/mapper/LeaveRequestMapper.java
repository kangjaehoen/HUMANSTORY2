package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.LeaveRequestDTO;
import com.kosta.humanstory.domain.LeaveRequestVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LeaveRequestMapper {

    public List<LeaveRequestVO> getEmpList(String empNum); //해당 사원 휴가 전체 조회
    public List<LeaveRequestVO> getList(); //매니저 휴가 전체 조회

    public void insert(LeaveRequestDTO leave); //휴가 등록

    public LeaveRequestVO getDetail(Long leaveNum); //휴가 지정 조회

    public int update(LeaveRequestDTO leave); //휴가 수정

    public int delete(Long leaveNum); //휴가 삭제
}

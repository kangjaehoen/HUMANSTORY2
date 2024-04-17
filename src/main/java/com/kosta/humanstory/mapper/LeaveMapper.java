package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.LeaveRequestVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LeaveMapper {
    public List<LeaveRequestVO> getAllLeave();
}

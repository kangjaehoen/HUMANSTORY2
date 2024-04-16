package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.AlarmVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AlarmMapper {
    public AlarmVO alarmSessionEmpNum(String empNum);

}

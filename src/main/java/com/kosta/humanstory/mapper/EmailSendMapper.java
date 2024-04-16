package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.domain.EmployeeWithPersonalLeaveDayDTO;
import com.kosta.humanstory.domain.PersonalLeaveDayVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmailSendMapper {
    public List<EmployeeWithPersonalLeaveDayDTO> empEmailSend();
}

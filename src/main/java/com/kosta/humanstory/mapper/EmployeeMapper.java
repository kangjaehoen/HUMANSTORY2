package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface EmployeeMapper {

    public EmployeeVO managerCheck(String empNum); //해당 사원 휴가 전체 조회
    public EmployeeVO read(String empNum);


}

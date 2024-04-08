package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmployeeMapper {
    public List<EmployeeVO> getList();
    public EmployeeVO read(String empNum);
    public void insertEmpInfo(EmployeeVO emp);
//public  updateEmpInfo
    public int delete(String empNum);
    public int update(EmployeeVO emp);


}

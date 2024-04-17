package com.kosta.humanstory.mapper;



import com.kosta.humanstory.domain.Criteria;

import com.kosta.humanstory.domain.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmployeeMapper {

    public EmployeeVO managerCheck(String empNum); //해당 사원 휴가 전체 조회
    public EmployeeVO read(String empNum);
    public List<EmployeeVO> getList();


    public List<EmployeeVO> getListWithPaging(Criteria cri);

    public void insertEmpInfo(EmployeeVO emp);

    public int delete(String empNum);

    public int update(EmployeeVO emp);

    public int getTotalCount(Criteria cri);

    public void authdelete(String empNum);

    public EmployeeVO findByEmpNum(String EmpNum);

}

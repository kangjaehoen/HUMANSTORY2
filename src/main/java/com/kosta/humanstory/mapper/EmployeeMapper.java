package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmployeeMapper {
    public List<EmployeeVO> getList();

    public EmployeeVO read(String empNum);

    public EmployeeVO authread(String empNum);

    public List<EmployeeVO> getListWithPaging(Criteria cri);

    public void insertEmpInfo(EmployeeVO emp);

    public int delete(String empNum);

    public int update(EmployeeVO emp);

    public int getTotalCount(Criteria cri);

    public void authdelete(String empNum);

//    public List<EmployeeVO> empEmailSend();



}

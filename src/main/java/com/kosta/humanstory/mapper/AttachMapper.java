package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.AttachVO;
import com.kosta.humanstory.domain.EmpAttachVO;
import com.kosta.humanstory.domain.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AttachMapper {
    public void insert(AttachVO vo);
    public void delete(String uuid);
//    public List<AttachVO> findByEmpNum(Long empNum);
    public List<AttachVO> findByEmpNum(String EmpNum);

    public void insertEmp(EmpAttachVO vo);
}

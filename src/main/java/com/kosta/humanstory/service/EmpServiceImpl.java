package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.mapper.EmployeeMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.management.relation.Role;
import java.util.List;

@Service
@AllArgsConstructor
public class EmpServiceImpl implements EmpService{

    @Autowired
    EmployeeMapper mapper;
    @Override
    public void register(EmployeeVO emp) {
        mapper.insertEmpInfo(emp);
    }

    @Override
    public void read(EmployeeVO emp) {
        mapper.read(emp.getEmpNum());

    }

    @Override
    public List<EmployeeVO> getList() {
        return mapper.getList();
    }

    @Override
    public List<EmployeeVO> getList(Criteria cri) {
        return mapper.getListWithPaging(cri);
    }

    @Override
    public boolean remove(String empNum) {
        return mapper.delete(empNum)==1;
    }

    @Override
    public boolean modify(EmployeeVO emp) {
        return mapper.update(emp)==1;
    }

    @Override
    public EmployeeVO get(String empNum) {
        return mapper.read(empNum);
    }

    @Override
    public int getTotal(Criteria cri) {
        return mapper.getTotalCount(cri);
    }



}

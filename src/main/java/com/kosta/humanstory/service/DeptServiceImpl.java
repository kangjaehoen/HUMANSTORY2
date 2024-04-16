package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.DeptVO;
import com.kosta.humanstory.mapper.DeptMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class DeptServiceImpl implements DeptService{

    @Autowired
     private DeptMapper mapper;
    @Override
    public void register(DeptVO dept) {
        mapper.insertDeptInfo(dept);
    }
//
    @Override
    public void read(DeptVO dept) {
    mapper.read(dept.getDeptNum());
    }

    @Override
    public List<DeptVO> getList() {
        return mapper.getList();
    }

    @Override
    public List<DeptVO> getList(Criteria cri) {
        return mapper.getListWithPaging(cri);
    }

    @Override
    public boolean remove(String deptNum) {
        return mapper.delete(deptNum)==1;
    }

    @Override
    public boolean modify(DeptVO dept) {
        return mapper.update(dept)==1;
    }

    @Override
    public DeptVO get(String deptNum) {
        return mapper.read(deptNum);
    }

    @Override
    public int getTotal(Criteria cri) {
        return mapper.getTotalCount(cri);
    }
}

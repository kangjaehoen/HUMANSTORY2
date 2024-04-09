package com.kosta.humanstory.service;


import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.DeptVO;

import java.util.List;

public interface DeptService {
    public void register(DeptVO dept);
    public void read(DeptVO dept);
    public List<DeptVO> getList();
    public List<DeptVO> getList(Criteria cri);
    public boolean remove(String deptNum);
    public boolean modify(DeptVO dept);
    public DeptVO get(String deptNum);
    public int getTotal(Criteria cri);
}

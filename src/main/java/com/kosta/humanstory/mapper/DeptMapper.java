package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.DeptVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface DeptMapper {
    public List<DeptVO> getList();
    public DeptVO read(String deptNum);
    public List<DeptVO> getListWithPaging(Criteria cri);
    public void insertDeptInfo(DeptVO dept);
    public int delete(String DeptNum);
    public int update(DeptVO dept);
    public int getTotalCount(Criteria cri);
}

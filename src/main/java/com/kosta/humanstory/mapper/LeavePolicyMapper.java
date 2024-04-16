package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.LeavePolicyVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LeavePolicyMapper {
    public List<LeavePolicyVO> getList(Criteria cri);
    public int listTotalCount(Criteria cri);

    public void insert(LeavePolicyVO vo);
    public LeavePolicyVO getDetail(int lpNum);
    public int update(LeavePolicyVO vo);

    public int delete(int lpNum);


}

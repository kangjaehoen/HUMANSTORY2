package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.LeavePromoteVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LeavePromoteMapper {
    public void insert(LeavePromoteVO vo);

    public List<LeavePromoteVO> getList(Criteria cri);

    public LeavePromoteVO getDetail(int lprNum);

    public int update(LeavePromoteVO vo);

    public int delete(int lprNum);

    public int listTotalCount(Criteria cri);
}


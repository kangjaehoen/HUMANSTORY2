package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.ApproveVO;
import com.kosta.humanstory.domain.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ApprovalMapper {
    public List<ApproveVO> getList();
    public List<ApproveVO> getListWithPaging(String empNum);
    public int getTotalCount(Criteria cri);

    public ApproveVO getOne(Long leaveNum);
    /*public void insert(BoardVO board);
    public Integer insertSelectKey(BoardVO board);
    public BoardVO read(Long bno);
    public int delete(Long bno);
    public int update(BoardVO board);*/
}

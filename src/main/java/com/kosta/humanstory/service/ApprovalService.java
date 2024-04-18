package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.ApproveVO;
import com.kosta.humanstory.domain.Criteria;

import java.util.List;

public interface ApprovalService {
    public List<ApproveVO> getLeaveCharts(String empNum);
    public int getTotalCount(Criteria cri);

    public ApproveVO get(Long leaveNum);

}

package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.LeavePolicyVO;
import com.kosta.humanstory.mapper.LeavePolicyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeavePolicyService {
    @Autowired
    private LeavePolicyMapper leavePolicyMapper;

    public List<LeavePolicyVO> getLeavePolicyCharts(Criteria cri) {
        System.out.println(leavePolicyMapper.getList(cri));
        return leavePolicyMapper.getList(cri);
    }

    public int listTotal(Criteria cri) {
        System.out.println("총개수");
        return leavePolicyMapper.listTotalCount(cri);
    }

}

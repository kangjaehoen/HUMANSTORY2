package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.LeaveRequestVO;
import com.kosta.humanstory.mapper.LeaveMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class LeaveServiceImpl implements LeaveService{

    @Autowired
    private LeaveMapper mapper;


    @Override
    public List<LeaveRequestVO> getList() {
        return mapper.getAllLeave();
    }
}


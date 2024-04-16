package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.AlarmVO;
import com.kosta.humanstory.mapper.AlarmMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlarmServiceImpl  implements  AlarmService{

    @Autowired
    AlarmMapper alarmMapper;

    @Override
    public AlarmVO alarmSessionEmpNum(String empNum) {
        return alarmMapper.alarmSessionEmpNum(empNum);
    }
}

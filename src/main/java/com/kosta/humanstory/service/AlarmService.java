package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.AlarmVO;
import org.springframework.stereotype.Service;

import java.util.List;


public interface AlarmService {
    public AlarmVO alarmSessionEmpNum(String empNum);
}

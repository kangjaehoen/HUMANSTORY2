package com.kosta.humanstory.domain;

import com.kosta.humanstory.service.AlarmService;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AlarmVO {

    @Autowired
    private AlarmService service;

    private int idx;
    private String target; // 해당되는 사원
    private String checked; 
    private String prefix;

    public List<AlarmDTO> selectAlarm(String empNum) {
        service.alarmSessionEmpNum(empNum);
        return null;
    }
}

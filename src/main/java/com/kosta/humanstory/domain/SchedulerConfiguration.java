package com.kosta.humanstory.domain;

import com.kosta.humanstory.service.SystemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class SchedulerConfiguration {
    @Autowired
    private SystemService systemService;
    @Autowired
    private  AnnualLeaveDTO annualLeaveDTO;


    @Scheduled(fixedDelay = 100000)
    public void run(){
        System.out.println("시스템 자동부여");
        systemService.updateLeaveAnnual(annualLeaveDTO);

    }
}

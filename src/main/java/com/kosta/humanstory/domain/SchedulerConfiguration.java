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


   @Scheduled(fixedRate = 100000)
    public void run(){
        System.out.println("시스템 자동부여");

       systemService.updateLeaveAnnual(annualLeaveDTO);


    }
    @Scheduled(cron = "0 0 0 1 * ?") //  매월 1일 0시 0분 0초에 작동 cron = "0 0 0 1 * ?"
    public void run2(){

        System.out.println("시스템 자동뷰여 2");
        systemService.less1Years();
    }

}

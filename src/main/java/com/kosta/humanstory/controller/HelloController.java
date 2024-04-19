package com.kosta.humanstory.controller;

import com.kosta.humanstory.Config.auth.PrincipalDetail;
import com.kosta.humanstory.service.LeaveRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
    @Autowired
    private LeaveRequestService service;

   /* @GetMapping("/main")
    public String hello(){
        return "/main";
    }*/
    @GetMapping("/main")
    public String list(@AuthenticationPrincipal PrincipalDetail principalDetail, Model model) {
        String empNum = principalDetail.getEmp().getEmpNum();
        System.out.println("컨트롤러 /조회/달력/ 작동");
        model.addAttribute("list", service.getEmpLeaveCharts(empNum)); // 이벤트 데이터를 모델에 추가

        System.out.println("===========" + model + "===========" );
        return "/main"; // 해당 JSP 페이지 이름 반환
    }

    @GetMapping("/dashboard")
    public String dashBoard() {
        return "/leavePolicy/list";
    }

    @GetMapping("/")
    public String test() {
        return "/getStart";
    }
}
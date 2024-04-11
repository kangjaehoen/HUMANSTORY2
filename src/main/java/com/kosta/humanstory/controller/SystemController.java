package com.kosta.humanstory.controller;

import com.kosta.humanstory.domain.AnnualLeaveDTO;
import com.kosta.humanstory.service.EmailSendService;
import com.kosta.humanstory.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/system")
public class SystemController {
    @Autowired
    private SystemService systemService;
    @Autowired
    private EmailSendService emailSendService;

    @GetMapping("/annualForm")
    public void annualForm(Model model) {
        System.out.println("휴가설정폼");
        model.addAttribute("day",systemService.leaveGrantDaySetApply());
        model.addAttribute("num",systemService.annulLeaveNumSetApply());
        model.addAttribute("user",emailSendService.empEmailSend());
    }
    @PostMapping("/leaveGrant")
    public String leaveGrant(@ModelAttribute AnnualLeaveDTO dto) {
        System.out.println("휴가날 선정 : " + dto);
        System.out.println(dto.getGrantDay());
        systemService.intannulLeaveDay(dto);
        return "redirect:/system/annualForm";
    }

    @PostMapping("/annualNumSetting")
    public String annualNumSetting(@ModelAttribute AnnualLeaveDTO dto) {
        System.out.println("휴가일수 선정");

        systemService.leaveGrantNum(dto);
        return "redirect:/system/annualForm";
    }



}

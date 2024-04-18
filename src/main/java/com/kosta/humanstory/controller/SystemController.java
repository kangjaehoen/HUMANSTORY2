package com.kosta.humanstory.controller;

import com.kosta.humanstory.domain.AnnualLeaveDTO;
import com.kosta.humanstory.domain.LeaveUserDTO;
import com.kosta.humanstory.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.kosta.humanstory.service.EmailSendService;

@Controller
@RequestMapping("/system")
public class SystemController {
    @Autowired
    private SystemService systemService;


    @GetMapping("/annualForm")
    public void annualForm(Model model) {
        System.out.println("휴가설정폼");
        model.addAttribute("day",systemService.leaveGrantDaySetApply());
        model.addAttribute("num",systemService.annulLeaveNumSetApply());
        model.addAttribute("leave",systemService.userListManager());
        model.addAttribute("user",systemService.userList());
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

    @PostMapping("/updateLeave")
    public String updateLeaveANDInsertLeave(@ModelAttribute LeaveUserDTO leaveUserDTO){
        System.out.println("휴가 업데이트 또는 등록");
        System.out.println(leaveUserDTO);
        systemService.insertAndUpdateLeave(leaveUserDTO);
        return "redirect:/system/annualForm";
    }



}

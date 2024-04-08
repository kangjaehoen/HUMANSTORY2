package com.kosta.humanstory.controller;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.PageDTO;
import com.kosta.humanstory.service.LeavePolicyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/leavePolicy/*")
public class LeavePolicyController {
    @Autowired
    private LeavePolicyService leavePolicyService;


    @GetMapping("list")
    public void getLeavePolicyCharts(Model model, Criteria cri) {
        System.out.println("휴가정책 게시판 리스트 컨트롤러");
        int total = leavePolicyService.listTotal(cri);
        model.addAttribute("list", leavePolicyService.getLeavePolicyCharts(cri));
        model.addAttribute("page", new PageDTO(cri, leavePolicyService.listTotal(cri)));

    }

}

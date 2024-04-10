package com.kosta.humanstory.controller;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.DeptVO;
import com.kosta.humanstory.domain.PageDTO;
import com.kosta.humanstory.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/dept/*")
public class DeptController {
    @Autowired
    private DeptService service;

    @GetMapping("/list")
    public void list(Criteria cri, Model model){
        System.out.println("list");
        model.addAttribute("list",service.getList());
//        model.addAttribute("list",service.getList(cri));
//        model.addAttribute("pageMaker",new PageDTO(cri,service.getTotal(cri)));
    }

    @GetMapping("/register")
    public void register(){

    }
    @PostMapping("/register")
    public String register(DeptVO dept, RedirectAttributes rttr){
        service.register(dept);
        rttr.addFlashAttribute("result",dept.getDeptNum());
        return "redirect:/dept/list";
    }
    @GetMapping({"/get","/modify"})
    public void get(@RequestParam("deptNum")String deptNum,Model model){
        System.out.println("/get or /modify");
        model.addAttribute("dept",service.get(deptNum));
    }

    @PostMapping("/modify")
    public String modify(DeptVO dept, RedirectAttributes rttr){
        System.out.println(dept);
        if(service.modify(dept)){
            rttr.addFlashAttribute("result","success");
        }
//        rttr.addAttribute("pageNum",cri.getPageNum());
//        rttr.addAttribute("amount",cri.getAmount());
        return "redirect:/dept/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("deptNum") String deptNum, RedirectAttributes rttr){
        if(service.remove(deptNum)){
            rttr.addFlashAttribute("result","success");

        };
        return  "redirect:/dept/list";
    }

}


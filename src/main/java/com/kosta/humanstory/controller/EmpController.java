package com.kosta.humanstory.controller;


import com.kosta.humanstory.Config.auth.PrincipalDetail;
import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.domain.PageDTO;
import com.kosta.humanstory.service.EmpService;
import oracle.ucp.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
@RequestMapping("/emp/*")
public class EmpController {
    @Autowired
    private EmpService service;

//    @GetMapping("/hello")
//    public String hello(){
//        return "/emp/hello";
//    }
    @GetMapping("/list")
    public void list(Criteria cri  ,Model model){
        System.out.println("list");
        model.addAttribute("list",service.getList());
//        model.addAttribute("list",service.getList(cri));
//        model.addAttribute("pageMaker",new PageDTO(cri,service.getTotal(cri)));
    }
    @GetMapping("/register")
    public void register(){

    }
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @PostMapping("/register")
    public String register(EmployeeVO emp, RedirectAttributes rttr){
        emp.setRole("ROLE_USER");
        String rawPassword= emp.getPw();
        String encPassword=bCryptPasswordEncoder.encode(rawPassword);
        emp.setPw(encPassword);
        service.register(emp);
        rttr.addFlashAttribute("result",emp.getEmpNum());

        return "redirect:/emp/list";
    }
    @GetMapping({"/get","/modify"})
    public void get(@RequestParam("empNum")String empNum,Model model){
        System.out.println("/get or /modify");
        model.addAttribute("emp",service.get(empNum));
    }
    @PostMapping("/modify")
    public String modify(EmployeeVO emp,RedirectAttributes rttr){
        emp.setRole("ROLE_USER");
        String rawPassword= emp.getPw();
        String encPassword=bCryptPasswordEncoder.encode(rawPassword);
        emp.setPw(encPassword);
        System.out.println(emp);
        if(service.modify(emp)){
            rttr.addFlashAttribute("result","success");
        }
//        rttr.addAttribute("pageNum",cri.getPageNum());
//        rttr.addAttribute("amount",cri.getAmount());
        return "redirect:/emp/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("empNum") String empNum,RedirectAttributes rttr){
        if(service.remove(empNum)){
            rttr.addFlashAttribute("result","success");
        };
//        System.out.println("remove 작동중");
        return "redirect:/emp/list";
    }

    

}

























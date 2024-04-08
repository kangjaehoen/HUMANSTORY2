package com.kosta.humanstory.controller;


import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public void list(Model model){
        System.out.println("list");
        model.addAttribute("list",service.getList());

    }
    @GetMapping("/register")
    public void register(){

    }
    @PostMapping("/register")
    public String register(EmployeeVO emp, RedirectAttributes rttr){
        service.register(emp);
        rttr.addFlashAttribute("result",emp.getEmpNum());

        return "redirect:/emp/list";
    }
    @GetMapping({"/get","/modify"})
    public void get(@RequestParam("empNum")String empNum,Model model){
        System.out.println("/get or modify");
        model.addAttribute("emp",service.get(empNum));
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("empNum") String empNum,RedirectAttributes rttr){
        if(service.remove(empNum)){
            rttr.addFlashAttribute("result","success");
        };

        return "redirect:/emp/list";
    }

}

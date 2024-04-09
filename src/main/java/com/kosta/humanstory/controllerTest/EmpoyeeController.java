package com.kosta.humanstory.controllerTest;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.PageDTO;
import com.kosta.humanstory.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/emp2")
public class EmpoyeeController {
    @Autowired
    private EmpService service;
    @GetMapping("/list")
    public void list(Criteria cri  , Model model){
        System.out.println("list");
//        model.addAttribute("list",service.getList());
        model.addAttribute("list",service.getList(cri));
        model.addAttribute("pageMaker",new PageDTO(cri,service.getTotal(cri)));
    }
    @GetMapping({"/get","/modify"})
    public void get(@RequestParam("empNum")String empNum, Model model){
        System.out.println("/get or /modify");
        model.addAttribute("emp",service.get(empNum));
    }
}

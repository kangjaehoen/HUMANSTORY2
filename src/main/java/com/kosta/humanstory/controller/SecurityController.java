package com.kosta.humanstory.controller;

import com.kosta.humanstory.Config.auth.PrincipalDetail;
import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SecurityController {
    @Autowired
    private EmpService service;
//    private EmployeeVO emp;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("/user")
    public String user(@AuthenticationPrincipal PrincipalDetail principalDetail){
        System.out.println("principalDetails:"+principalDetail.getEmp());
        return "user";
    } // @AuthenticationPrincipal 인증되어있는 Principal데이터를 받아올 수 있다.
    @GetMapping("/admin")
    public String admin(){
        return "admin";
    }
    @GetMapping("/manager")
    public String manager(){
        return "manager";
    }


    @GetMapping("/customlogin")
    public String customlogin(){
        System.out.println("customlogin 이동");
        return "login/customlogin";
    }


    @GetMapping("/login/joinForm")
    public String joinForm(){
        System.out.println("회원가입");
        return "/login/joinForm";
    }
    @PostMapping("/join")
    public @ResponseBody String join(EmployeeVO emp){
        System.out.println(emp);
        emp.setRole("ROLE_USER");

        String rawPassword= emp.getPw();
        String encPassword=bCryptPasswordEncoder.encode(rawPassword);
        emp.setPw(encPassword);

        service.register(emp);

        return "/login/customlogin";
    }
    @Secured("ROLE_ADMIN")
    @GetMapping("/info")
    public @ResponseBody String info(){
        return "개인정보";
    }
    @PreAuthorize("hasRole('ROLE_MANAGER')or hasRole('ROLE_ADMIN')")
    @GetMapping("/data")
    public @ResponseBody String data(){
        return "데이터";
    }

}

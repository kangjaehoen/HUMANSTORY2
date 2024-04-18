package com.kosta.humanstory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

    @GetMapping("/main")
    public String hello(){
        return "/main";
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
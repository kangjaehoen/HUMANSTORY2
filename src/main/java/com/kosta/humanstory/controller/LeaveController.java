package com.kosta.humanstory.controller;

import com.kosta.humanstory.service.LeaveService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@AllArgsConstructor
public class LeaveController {

   @Autowired
   private LeaveService service;

    @GetMapping("/grid")
    public String grid() {
        return "/leaveGrid/grid";
    }

}

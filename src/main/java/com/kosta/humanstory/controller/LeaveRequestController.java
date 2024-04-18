package com.kosta.humanstory.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.humanstory.Config.auth.PrincipalDetail;
import com.kosta.humanstory.domain.LeaveRequestDTO;
import com.kosta.humanstory.domain.LeaveRequestVO;
import com.kosta.humanstory.service.LeaveRequestService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/leave/")
@AllArgsConstructor
public class LeaveRequestController {
    @Autowired
    private LeaveRequestService service;

    @GetMapping("/emp_delivery")
    public void logoutGET() {

    }


    /*@Secured("ROLE_USER")*/
    @GetMapping("/calendar")
    public String list(@AuthenticationPrincipal PrincipalDetail principalDetail,Model model) {
        String empNum = principalDetail.getEmp().getEmpNum();
        System.out.println("컨트롤러 /조회/달력/ 작동");
        model.addAttribute("list", service.getEmpLeaveCharts(empNum)); // 이벤트 데이터를 모델에 추가

        System.out.println("===========" + model + "===========" );
        return "/leave/calendar"; // 해당 JSP 페이지 이름 반환
    }


    /*@Secured("ROLE_MANAGER")*/
    /*@GetMapping("/calendar")
    public String managerList(Model model) {
        System.out.println("===========" + model + "===========" );
        System.out.println("컨트롤러 /조회/달력/ 작동");
        model.addAttribute("list", service.getLeaveCharts()); // 이벤트 데이터를 모델에 추가
        return "/leave/calendar"; // 해당 JSP 페이지 이름 반환
    }*/

    @PostMapping("/register")
    public String register(LeaveRequestDTO leave, RedirectAttributes rttr)throws Exception {
        System.out.println("===========" +leave + "===========" );
        System.out.println("컨트롤러 /등록/ 작동");
        try {
            service.registerLeave(leave);
            rttr.addFlashAttribute("result", leave.getEmpNum()); //값을 담아갈때
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/leave/calendar";
    }

    @GetMapping({"/getLeaveOne","/modify"})
    public void get(@RequestParam("leaveNum") Long leaveNum, Model model) {
        System.out.println("===========" +leaveNum + "===========" );
        System.out.println("컨트롤러 /수정/지정조회/ 작동");
        model.addAttribute("leave", service.getLeaveOne(leaveNum));
    }

    @PostMapping("/modify")
    public String modify(LeaveRequestDTO leave, RedirectAttributes rttr) {
        System.out.println("===========" +leave + "===========" );
        System.out.println("컨트롤러 /수정/ 작동");

        if(service.modifyLeave(leave)) {
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/leave/calendar";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("leaveNum") Long leaveNum, RedirectAttributes rttr) {
        System.out.println("===========" +leaveNum + "===========" );
        System.out.println("컨트롤러 /등록/ 작동");

        if(service.removeLeave(leaveNum)) {
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/leave/calendar";
    }

    @GetMapping("/grid")
    public ResponseEntity<List<LeaveRequestVO>> grid(Model model)  throws JsonProcessingException {
        // LeaveRequestVO 객체를 JSON 문자열로 변환합니다.
/*        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(service.getLeaveCharts());

        // JSON 문자열을 모델에 추가합니다.
        model.addAttribute("leaveRequestJSON", json);
        System.out.println(model);*/

        return ResponseEntity.ok().body(service.getLeaveCharts());
    }

    @GetMapping("/gridList")
    public String gridList() {
        return "/leaveGrid/grid";
    }

}

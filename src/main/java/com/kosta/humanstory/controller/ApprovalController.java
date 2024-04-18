package com.kosta.humanstory.controller;

import com.kosta.humanstory.Config.auth.PrincipalDetail;
import com.kosta.humanstory.domain.ApproveDTO;
import com.kosta.humanstory.domain.ApproveVO;
import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.PageDTO;
import com.kosta.humanstory.service.ApprovalService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/approve/")
@AllArgsConstructor
public class ApprovalController {
    @Autowired
    private ApprovalService service;

    @GetMapping("/emp_del")
    public void logoutGET() {
    }

    @GetMapping("/register")
    public void register() {}

    /*사원 휴가 리스트 (결재)*/
    @GetMapping("/list")
    public String approveList(Criteria cri, Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
        String empNum = principalDetail.getEmp().getEmpNum();
        System.out.println("===========" + model + "===========");
        System.out.println("컨트롤러 /조회/결재/ 작동");
        model.addAttribute("list", service.getLeaveCharts(empNum));
        model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount(cri)));
        return "/approve/list";
    }

    @GetMapping("/get")
    public void get(@RequestParam("leaveNum") Long leaveNum, @ModelAttribute("cri") Criteria cri, Model model) {
        model.addAttribute("chart", service.get(leaveNum));
        System.out.println("===========" + model + "===========");
    }


    /*매니저 휴가 리스트 (결재)*/

    /*@PostMapping("/register")
    public String register(ApproveDTO approve, RedirectAttributes rttr)throws Exception {

        try {
            service.registerLeave(leave);
            rttr.addFlashAttribute("result", leave.getLeaveNum()); //값을 담아갈때
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/leave/calendar";
    }


    @GetMapping({"/getLeaveOne","/modify"})
    public void get(@RequestParam("leaveNum") Long leaveNum, @ModelAttribute("cri") Criteria cri, Model model) {
        model.addAttribute("leave", service.getLeaveOne(leaveNum));
    }

    @PostMapping("/modify")
    public String modify(LeaveDTO leave, RedirectAttributes rttr) {

        if(service.modifyLeave(leave)) {
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/leave/calendar";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("leaveNum") Long leaveNum, RedirectAttributes rttr) {

        if(service.removeLeave(leaveNum)) {
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/leave/calendar";
    }*/
}
/*// 컨트롤러에서 휴가 신청 데이터를 가져와서 휴가 상태를 변경하여 보내는 예시 코드
List<LeaveRequest> leaveRequests = leaveRequestService.getLeaveRequestsByEmpNum(empNum); // 특정 사원의 휴가 신청 데이터를 가져오는 메소드를 가정
for (LeaveRequest leaveRequest : leaveRequests) {
        if (leaveRequest.getNum() == 1) {
        leaveRequest.setStatus("결재대기중"); // 휴가 상태를 결재대기중으로 변경
    } else if (leaveRequest.getNum() == 0) {
        leaveRequest.setStatus("결재확인"); // 휴가 상태를 결재확인으로 변경
    } else if (leaveRequest.getNum() == 2) {
        leaveRequest.setStatus("반려된결재"); // 휴가 상태를 반려된결재로 변경
    }
            }
            model.addAttribute("leaveRequests", leaveRequests); // 변경된 휴가 신청 데이터를 View로 보냄*/


/*
// View에서 휴가 신청 데이터를 받아서 휴가 상태를 표현하는 예시 코드
<c:forEach items="${leaveRequests}" var="leaveRequest">
    <tr>
<td>${leaveRequest.getLeaveNum()}</td>
<td>${leaveRequest.getStartDate()}</td>
<td>${leaveRequest.getEndDate()}</td>
<td>${leaveRequest.getLeaveReason()}</td>
<td>${leaveRequest.getLeaveType()}</td>
        <td>
            <c:choose>
                <c:when test="${leaveRequest.getNum() eq 1}">결재대기중</c:when>
                <c:when test="${leaveRequest.getNum() eq 0}">결재확인</c:when>
                <c:when test="${leaveRequest.getNum() eq 2}">반려된결재</c:when>
            </c:choose>
        </td>
    </tr>
</c:forEach>
*/

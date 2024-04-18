package com.kosta.humanstory.controller;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.LeavePromoteVO;
import com.kosta.humanstory.domain.PageDTO;
import com.kosta.humanstory.domain.PromoteAttachVO;
import com.kosta.humanstory.service.LeavePromoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/leavePromote/*")
public class LeavePromoteController {
    @Autowired
    private LeavePromoteService leavePromoteService;

    @GetMapping("register")
    public void registerForm() {
        System.out.println("등록폼 이동");
    }

    @PostMapping("register")
    public String registerLeavePromote(LeavePromoteVO vo) {

        System.out.println("휴가촉진 등록 컨트롤러");
        System.out.println(vo);

        if (vo.getAttachList() != null) {

            vo.getAttachList().forEach(attach -> System.out.println(attach));
            System.out.println("AttachList 확인1 :" + vo.getAttachList());
        }
        System.out.println("AttachList 확인2 :" + vo.getAttachList());

        leavePromoteService.registerLeavePromote(vo);
        return "redirect:/leavePromote/list";
    }

    @GetMapping("list")
    public void getLeavePromoteCharts(Model model, Criteria cri) {
        System.out.println("휴가 촉진 게시판 리스트 컨트롤러");
        int total = leavePromoteService.listTotal(cri);
        model.addAttribute("list", leavePromoteService.getLeavePromoteCharts(cri));
        model.addAttribute("page", new PageDTO(cri, leavePromoteService.listTotal(cri)));
    }

    @GetMapping({ "get", "update" })
    public void getLeavePromoteOne(@RequestParam("lprNum") int lprNum, Model model) {
        System.out.println("휴가 촉진 세부 조회");
        System.out.println(lprNum);
        model.addAttribute("get", leavePromoteService.getLeavePromoteOne(lprNum));

    }

    @PostMapping("update")
    public String modifyLeavePromote(LeavePromoteVO vo) {

        System.out.println("휴가 정책 수정");
        System.out.println(vo);
        leavePromoteService.modifyLeavePromote(vo);
        return "redirect:/leavePromote/list";
    }

    @PostMapping("delete")
    public String removeLeavePromote(@RequestParam("lprNum") int lprNum) {
        leavePromoteService.removeLeavePromote(lprNum);
        return "redirect:/leavePromote/list";

    }

    @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<PromoteAttachVO>> getAttachList(int lprNum) {
        System.out.println("getAttachList " + lprNum);
        return new ResponseEntity<>(leavePromoteService.getAttachList(lprNum), HttpStatus.OK);
    }

}

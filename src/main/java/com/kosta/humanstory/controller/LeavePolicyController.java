package com.kosta.humanstory.controller;

import com.kosta.humanstory.domain.AttachVO;
import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.LeavePolicyVO;
import com.kosta.humanstory.domain.PageDTO;
import com.kosta.humanstory.service.LeavePolicyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/leavePolicy/*")
public class LeavePolicyController {
    @Autowired
    private LeavePolicyService leavePolicyService;


    @GetMapping("register")
    public void registerForm() {
        System.out.println("휴가 정책 게시판 폼으로 이동");
    }


    @GetMapping("list")
    public void getLeavePolicyCharts(Model model, Criteria cri) {
        System.out.println("휴가정책 게시판 리스트 컨트롤러 : "+leavePolicyService.getLeavePolicyCharts(cri));
        int total = leavePolicyService.listTotal(cri);
        System.out.println("왜 출력 안돼"+cri);
        System.out.println(model);

        model.addAttribute("list", leavePolicyService.getLeavePolicyCharts(cri));
        model.addAttribute("page", new PageDTO(cri, leavePolicyService.listTotal(cri)));

    }

    @PostMapping("register")
    public String registerLeavePolicy(LeavePolicyVO vo) {
        System.out.println("휴가 정책 게시판 등록");
        System.out.println("등록 정보 : " + vo);

        if (vo.getAttachList() != null) {
            vo.getAttachList().forEach(attach -> System.out.println(attach));
            System.out.println("AttachList 확인1 :"+vo.getAttachList());
        }
        System.out.println("AttachList 확인2 :"+vo.getAttachList());

        leavePolicyService.registerLeavePolicy(vo);
        return "redirect:/leavePolicy/list";
    }
    @GetMapping({ "get", "update" })
    public void getLeavePolicyOne(@RequestParam("lpNum") int lpNum, Model model) {
        System.out.println("휴가 정책 세부 조회(컨트롤러 단) : " +
                leavePolicyService.getLeavePolicyOne(lpNum));

        model.addAttribute("get", leavePolicyService.getLeavePolicyOne(lpNum));

    }

    @PostMapping("update")
    public String modifyLeavePolicy(LeavePolicyVO vo) {
        System.out.println("휴가 정책 수정 : ");
        System.out.println(leavePolicyService.modifyLeavePolicy(vo));
        leavePolicyService.modifyLeavePolicy(vo);
        return "redirect:/leavePolicy/list";
    }
    @PostMapping("delete")
    public String removeLeavePolicy(@RequestParam("lpNum") int lpNum) {
        leavePolicyService.removeLeavePolicy(lpNum);
        return "redirect:/leavePolicy/list";

    }

    @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<AttachVO>> getAttachList(int lpNum) {

        System.out.println("getAttachList" + lpNum);
        return new ResponseEntity<>(leavePolicyService.getAttachList(lpNum), HttpStatus.OK);
    }


}
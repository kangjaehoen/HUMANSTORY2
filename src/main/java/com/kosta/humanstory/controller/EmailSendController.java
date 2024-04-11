package com.kosta.humanstory.controller;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.EmpEmailInfoDTO;
import com.kosta.humanstory.domain.EmployeeWithPersonalLeaveDayDTO;
import com.kosta.humanstory.service.EmailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/email")
public class EmailSendController {
    @Autowired
    private EmailSendService emailSendService;
    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/list")
    public String empEmailList(Model model, Criteria cri) {
        System.out.println("휴가 촉진 대상 리스트");
        List<EmployeeWithPersonalLeaveDayDTO> list = emailSendService.empEmailSend();
        model.addAttribute("list", list);
        return "/email/list"; // 사용할 JSP 페이지의 이름을 리턴합니다.
    }

    @RequestMapping("/emailSend")
    public String findAuth(EmpEmailInfoDTO dto, Model model) {

        Map map = new HashMap();

        StringBuilder sb = new StringBuilder();

        String setFrom = "gjsdms3340@gmail.com";
        String tomail = dto.getEmail();
        String title = "안녕하세요 HUMANSTORY에서 보내는 휴가 잔여 촉구 안내입니다.";
        sb.append(String.format("안녕하세요 %s님\n", dto.getEmpName()));
        sb.append("휴가 잔여일은 ").append(dto.getIt_days()).append(" 일입니다.\n");
        sb.append(String.format("만료일 까지 연차 휴가 사용을 부탁드립니다."));
        String content = sb.toString();

        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "utf-8");

            msgHelper.setFrom(setFrom);
            msgHelper.setTo(tomail);
            msgHelper.setSubject(title);
            msgHelper.setText(content);

            mailSender.send(msg);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        map.put("status", true);
        map.put("name", dto.getEmpName());
        map.put("leaveNum", dto.getIt_days());

         return "redirect:/email/list";
    }
}

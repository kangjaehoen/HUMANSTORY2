package com.kosta.humanstory.controller;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.EmpEmailInfoDTO;
import com.kosta.humanstory.domain.EmployeeWithPersonalLeaveDayDTO;
import com.kosta.humanstory.service.EmailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
        sb.append("휴가 잔여일은 ").append(dto.getLt_days()).append(" 일입니다.\n");
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
        map.put("leaveNum", dto.getLt_days());

        return "redirect:/email/list";
    }

//    @RequestMapping("/updateLeaveSend")
//    public String findAuth1(EmpEmailInfoDTO dto, Model model) {
//
//        Map map = new HashMap();
//
//        StringBuilder sb = new StringBuilder();
//
//        String setFrom = "gjsdms3340@gmail.com";
//        String tomail = dto.getEmail();
//        String title = dto.getLeaveType()+" 부여 안내 메일";
//        sb.append(String.format("안녕하세요 %s님\n", dto.getEmpName()));
//        sb.append(String.format(" %s가\t", dto.getLeaveType()));
//        sb.append(String.format(" %s일 부여되었습니다.\n", dto.getlt_days()));
////        sb.append("휴가  ").append(dto.getlt_days()).append(" 일입니다.\n");
//        sb.append(String.format("자신이 해당하지 않는 메일이라면 인사팀에 문의해주십시오.\n"));
//        sb.append(String.format("감사합니다..\n"));
//
//        String content = sb.toString();
//
//        try {
//            MimeMessage msg = mailSender.createMimeMessage();
//            MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "utf-8");
//
//            msgHelper.setFrom(setFrom);
//            msgHelper.setTo(tomail);
//            msgHelper.setSubject(title);
//            msgHelper.setText(content);
//
//            mailSender.send(msg);
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//        map.put("status", true);
//        map.put("name", dto.getEmpName());
//        map.put("leaveNum", dto.getlt_days());
//
//
//
//        return "redirect:/email/list";
//    }

    @RequestMapping("/updateLeaveSend")
    public ResponseEntity<String> findAuth1(EmpEmailInfoDTO dto, Model model) {

        LocalDate currentDate = LocalDate.now();

// 날짜 포맷 설정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");

        StringBuilder sb = new StringBuilder();

        sb.append("<span style=\"font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("<table style=\"border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;\"><!-- Header --><colgroup><col width=\"310\"><col width=\"490\"></colgroup>");
        sb.append(" <tbody>");
        sb.append("<tr>");
        sb.append("<td style=\"background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;\" colspan=\"2\" class=\"dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l\">");
        sb.append("휴가원");
        sb.append("</td>");
        sb.append("</tr>");

        sb.append("<tr>");
        sb.append("<td style=\"background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;\">");
        sb.append("<table style=\"border: 1px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;\"><!-- User --><colgroup><col width=\"100\"><col width=\"220\"></colgroup>");
        sb.append("<tbody>");
        sb.append("<tr>");
        sb.append("<td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;\">\n");
        sb.append("기안자");
        sb.append("</td>");
        sb.append(" <td style=\"background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;\">");
        sb.append(" <span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"11\" data-dsl=\"{{label:draftUser}}\" data-wrapper=\"\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\" data-autotype=\"\"><span class=\"comp_item\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">Humanstory Team</span><span contenteditable=\"false\" class=\"comp_active\" style=\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <span class=\"Active_dot1\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span><span class=\"Active_dot2\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0");
        sb.append("px; margin-bottom: 0px;\"></span> <span class=\"Active_dot3\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span><span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"11\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\"></a> </span> </span><br>");;
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr>");
        sb.append("<td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;\">\n");
        sb.append("기안부서");
        sb.append("</td>");
        sb.append("<td style=\"background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;\">");
        sb.append("<span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"12\" data-dsl=\"{{label:draftDept}}\" data-wrapper=\"\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\" data-autotype=\"\"><span class=\"comp_item\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">HumanStory 개발팀</span><span contenteditable=\"false\" class=\"comp_active\" style=\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <span class=\"Active_dot1\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span><span class=\"Active_dot2\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: ");
        sb.append("0px; margin-bottom: 0px;\"></span> <span class=\"Active_dot3\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span><span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"12\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\"></a> </span> </span><br>");
        sb.append("</td>");
        sb.append("</tr>");

        sb.append("<tr>");
        sb.append("<td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;\">");
        sb.append("기안일");
        sb.append("</td>");
        sb.append("  <td style=\"background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;\">");
        sb.append("<span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"13\" data-dsl=\"{{label:draftDate}}\" data-wrapper=\"\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\" data-autotype=\"\"><span class=\"comp_item\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append(currentDate.format(formatter));
        sb.append("</span><span contenteditable=\"false\" class=\"comp_active\" style=\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <span class=\"Active_dot1\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span><span class=\"Active_dot2\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0 px; margin-bottom: 0px;\">");
        sb.append("</span>");
        sb.append("<span class=\"Active_dot3\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span>");
        sb.append("<span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"13\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("<a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\"></a> </span> </span><br>");
        sb.append("</td>");
        sb.append("</tr>");


        sb.append("<tr>");
        sb.append("<td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;\">");
        sb.append("문서번호");
        sb.append("</td>");
        sb.append("<td style=\"background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;\">");
        sb.append(" <span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"14\" data-dsl=\"{{label:docNo}}\" data-wrapper=\"\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\" data-autotype=\"\"><span class=\"comp_item\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("1");//문서번호
        sb.append("</span><span contenteditable=\"false\" class=\"comp_active\" style=\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <span class=\"Active_dot1\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span><span class=\"Active_dot2\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> ");
        sb.append("</span> <span class=\"Active_dot3\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span><span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"14\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\"></a> </span> </span><br>");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("</tbody>");
        sb.append("</table>");
        sb.append("</td>");
        sb.append("  <td style=\"background: white; padding: 0px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;\">");
        sb.append("[결재선]");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("</tr>");
        sb.append("</tbody>");
        sb.append("</table>");



        sb.append("<table style=\"border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;\"><!-- 품의서 --><colgroup><col width=\"200\"><col width=\"350\"><col width=\"200\"><col width=\"200\"></colgroup>");
        sb.append("<tbody>");
        sb.append("<tr>");
        sb.append("<td style=\"padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(221, 221, 221);\" colspan=\"4\">");
        sb.append("<span style=\"font-weight: bold; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">부여대상자</span>");
        sb.append("</td>");
        sb.append(" </tr>");
        sb.append("<tr>");
        sb.append("<td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;\">");
        sb.append("소속");
        sb.append(" </td>");
        sb.append("<td style=\"background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;\" colspan=\"3\" class=\"dext_table_border_t\">");
        sb.append("<span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"4\" data-dsl=\"{{text}}\" data-wrapper=\"\" style=\"width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\"><input class=\"ipt_editor\" type=\"text\" readonly value='");
//    sb.append(dto.getEmpName()+"부서명"); // 소속
        sb.append("\'><span contenteditable=\\\"false\\\" class=\\\"comp_active\\\" style=\\\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\\\"> <span class=\\\"Active_dot1\\\" style=\\\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\\\"></span><span class=\\\"Active_dot2\\\" style=\\\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\\\"></span> <span class=\\\"Active_dot3\\\" style=\\\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\\\">");
        sb.append("</span>");
        sb.append("<span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\">");
        sb.append("</a> </span> </span><br>");
        sb.append("</td>");
        sb.append("</tr>");

        sb.append("<tr>");
        sb.append("  <td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;\">");
        sb.append("직책");
        sb.append("</td>");
        sb.append(" <td style=\"background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;\" colspan=\"3\" class=\"dext_table_border_t\">");
        sb.append(" <span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"5\" data-dsl=\"{{text}}\" data-wrapper=\"\" style=\"width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\"><input class=\"ipt_editor\" type=\"text\" readonly value='");
        sb.append(dto.getJob());
        sb.append("'><span contenteditable=\"false\" class=\"comp_active\" style=\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <span class=\"Active_dot1\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span><span class=\"Active_dot2\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> <span class=\"Active_dot3\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-he ight: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span><span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"5\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\"></a> </span> </span><br>");
        sb.append(" </td>");
        sb.append("</tr>");

        sb.append("<tr>");
        sb.append("  <td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;\">");
        sb.append("성명");
        sb.append("</td>");
        sb.append(" <td style=\"background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;\" colspan=\"3\" class=\"dext_table_border_t\">");
        sb.append(" <span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"5\" data-dsl=\"{{text}}\" data-wrapper=\"\" style=\"width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\"><input class=\"ipt_editor\" type=\"text\" readonly value='");
        sb.append(dto.getEmpName());
        sb.append("'><span contenteditable=\"false\" class=\"comp_active\" style=\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <span class=\"Active_dot1\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span><span class=\"Active_dot2\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> <span class=\"Active_dot3\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-he ight: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span><span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"5\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\"></a> </span> </span><br>");
        sb.append(" </td>");
        sb.append("</tr>");

        sb.append("<tr>");
        sb.append("  <td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;\">");
        sb.append("휴가 종류");
        sb.append("</td>");
        sb.append(" <td style=\"background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;\" colspan=\"3\" class=\"dext_table_border_t\">");
        sb.append(" <span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"5\" data-dsl=\"{{text}}\" data-wrapper=\"\" style=\"width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\"><input class=\"ipt_editor\" type=\"text\" readonly value='");
        sb.append(dto.getLeaveType());
        sb.append("'><span contenteditable=\"false\" class=\"comp_active\" style=\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <span class=\"Active_dot1\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span><span class=\"Active_dot2\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> <span class=\"Active_dot3\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-he ight: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span><span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"5\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\"></a> </span> </span><br>");
        sb.append(" </td>");
        sb.append("</tr>");

        sb.append(" <tr>");
        sb.append("<td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;\">");
        sb.append("휴가부여 일수");
        sb.append("</td>");
        sb.append("<td style=\"background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;\">");
        sb.append("  <span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"8\" data-dsl=\"{{period}}\" data-wrapper=\"\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\"> ");
        sb.append("<input class=\"ipt_editor ipt_editor_date\"  readonly type=\"text\" value='");
        sb.append(dto.getLt_days()); //
        sb.append("'> <span contenteditable=\"false\" class=\"comp_active\" style=\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <span class=\"Active_dot1\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span>");
        sb.append("<span class=\"Active_dot2\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> <span class=\"Active_dot3\" style=\"font-family: &quot;malgu n gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span>");
        sb.append("<span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"8\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\"></a> </span> </span><br>");
        sb.append("</td>");


        sb.append(" <td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;\">");
        sb.append("잔여일");
        sb.append("</td>");
        sb.append("  <td style=\"background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;\">");
        sb.append("<span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"10\" data-dsl=\"{{text$width:60$}}\" data-wrapper=\"\" style=\"width: 60px; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\">");
        sb.append("<input class=\"ipt_editor\" readonly type=\"text\"value='");
        sb.append(dto.getLt_days()); //잔여일 임시
        sb.append("'>");
        sb.append("<span contenteditable=\"false\" class=\"comp_active\" \"=\"\" style=\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <span class=\"Active_dot1\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span><span class=\"Active_dot2\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> <span class=\"Active_dot3\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span>");
        sb.append("<span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"10\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\"></a> </span> </span>");
        sb.append("</td>");
        sb.append("</tr>");

        sb.append("<tr>");
        sb.append("  <td style=\"background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;\">");
        sb.append("휴가 사유");
        sb.append("</td>");
        sb.append(" <td style=\"background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;\" colspan=\"3\" class=\"dext_table_border_t\">");
        sb.append(" <span unselectable=\"on\" contenteditable=\"false\" class=\"comp_wrap\" data-cid=\"5\" data-dsl=\"{{text}}\" data-wrapper=\"\" style=\"width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\" data-value=\"\"><input class=\"ipt_editor\" type=\"text\" readonly value='");
        sb.append(dto.getMessage());
        sb.append("'><span contenteditable=\"false\" class=\"comp_active\" style=\"display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <span class=\"Active_dot1\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span><span class=\"Active_dot2\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> <span class=\"Active_dot3\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-he ight: normal; margin-top: 0px; margin-bottom: 0px;\">");
        sb.append("</span><span class=\"Active_dot4\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"></span> </span> <span contenteditable=\"false\" class=\"comp_hover\" data-content-protect-cover=\"true\" data-origin=\"5\" style=\"font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\"> <a contenteditable=\"false\" class=\"ic_prototype ic_prototype_trash\" data-content-protect-cover=\"true\" data-component-delete-button=\"true\"></a> </span> </span><br>");
        sb.append(" </td>");
        sb.append("</tr>");

        sb.append("<tr>");
        sb.append("<td style=\"border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 100px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);\" colspan=\"4\" class=\"dext_table_border_t\">");
        sb.append("<span style=\"font-weight: bold; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;\">휴가기준 제 13조에 의거 휴가를 신청하오니 허락하여 주시기 바랍니다.</span>");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("</tbody>");
        sb.append("</table>");
        sb.append("</span>");
        sb.append("<p style=\"font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;\"><br></p>");





        String content = sb.toString();
        String toEmail = dto.getEmail();
        String leaveType = dto.getLeaveType();

        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "utf-8");

            msgHelper.setFrom("gjsdms3340@gmail.com");
            msgHelper.setTo(toEmail);
            msgHelper.setSubject(leaveType + " 부여 안내 메일");
            msgHelper.setText(content, true); // HTML 형식으로 설정

            mailSender.send(msg);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("이메일 전송 중 오류가 발생했습니다.");
        }

        // 성공 시
        return ResponseEntity.ok().body("이메일이 성공적으로 전송되었습니다.");
    }


}

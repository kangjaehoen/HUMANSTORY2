package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.EmployeeWithPersonalLeaveDayDTO;
import com.kosta.humanstory.mapper.EmailSendMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmailSendService {

    @Autowired
    private EmailSendMapper emailSendMapper;

    public List<EmployeeWithPersonalLeaveDayDTO> empEmailSend() {
        System.out.println("휴가 촉진 대상 리스트 출력(서비스)");
        System.out.println(emailSendMapper.empEmailSend());
        return emailSendMapper.empEmailSend();
    }
}

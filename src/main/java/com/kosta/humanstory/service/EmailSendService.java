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
        return emailSendMapper.empEmailSend();
    }

    public int empSendInfo(EmployeeWithPersonalLeaveDayDTO dto) {
        System.out.println("저장된듯");
        System.out.println(dto.getEmail());
        emailSendMapper.empEmailInfo(dto);
        return 1; //zz
    }
}

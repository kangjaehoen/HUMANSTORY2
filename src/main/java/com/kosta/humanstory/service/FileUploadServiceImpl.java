package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.AttachVO;
import com.kosta.humanstory.domain.EmpAttachVO;
import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.mapper.AttachMapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class FileUploadServiceImpl implements FileUploadService {

@Autowired
AttachMapper mapper;


    @Override
    public void saveFileAndData(EmpAttachVO empAttachVO) {
        mapper.insertEmp(empAttachVO);
    }


//    @Override
//    public boolean deleteFile(MultipartFile file, AttachVO vo) {
//
//    }
}

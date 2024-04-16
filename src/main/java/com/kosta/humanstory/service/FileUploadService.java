package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.AttachVO;
import com.kosta.humanstory.domain.EmpAttachVO;
import com.kosta.humanstory.domain.EmployeeVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface FileUploadService {
    public void saveFileAndData(EmpAttachVO empAttachVO);



}

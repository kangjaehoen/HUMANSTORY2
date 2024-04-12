package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.AttachVO;
import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
    public void saveFileAndData(MultipartFile file, AttachVO vo);
//    public int deleteFile(MultipartFile file, AttachVO vo);
}

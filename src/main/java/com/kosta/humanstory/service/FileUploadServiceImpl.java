package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.AttachVO;
import com.kosta.humanstory.mapper.EmpAttachMapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class FileUploadServiceImpl implements FileUploadService {

@Autowired
 EmpAttachMapper mapper;


    @Override
    public void saveFileAndData(MultipartFile file, AttachVO vo) {
        mapper.insert(vo);
    }

//    @Override
//    public boolean deleteFile(MultipartFile file, AttachVO vo) {
//
//    }
}

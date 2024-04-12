package com.kosta.humanstory.controller;

import com.kosta.humanstory.service.FileUploadService;
import com.kosta.humanstory.service.FileUploadServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;

@Controller
public class FileUploadController {
    @Autowired
    private FileUploadService service;

    @GetMapping("/upload")
    public void uploadFile(){
        System.out.println("upload ajax");
    }

    @PostMapping("/upload")
    public void uploadFile(MultipartFile[] uploadFile){

        String uploadFolder="D:\\upload";

        for (MultipartFile multipartFile: uploadFile){
            System.out.println("===========================");
            System.out.println("Upload File Name"+multipartFile.getOriginalFilename());
            System.out.println("Upload File Size"+multipartFile.getSize());

            File saveFile=new File(uploadFolder,multipartFile.getOriginalFilename());



            try {
                multipartFile.transferTo(saveFile);
            }catch (Exception e){
                System.out.println(e.getMessage());
            }

        }//end for

    }
//    @PostMapping("/upload")
//    public void uploadFormPost(MultipartFile[] uploadFile,Model model){
//        for (MultipartFile multipartFile: uploadFile){
//            System.out.println("----------------");
//            System.out.println("Upload File Name:"+multipartFile.getOriginalFilename());
//            System.out.println("Upload File Size:"+multipartFile.getSize());
//
//        }
//
//    }

}

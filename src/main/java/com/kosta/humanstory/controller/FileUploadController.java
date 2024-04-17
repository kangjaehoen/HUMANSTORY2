package com.kosta.humanstory.controller;

import com.kosta.humanstory.domain.AttachVO;
import com.kosta.humanstory.domain.EmpAttachVO;
import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.UUID;

@Controller
public class FileUploadController {
    @Autowired
    private FileUploadService service;

    @GetMapping("/upload")
    public void uploadFile(){
        System.out.println("upload ajax");
    }

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile[] uploadFile, @ModelAttribute("vo") EmpAttachVO empAttachVO) throws IOException {

        String uploadFolder = "C:\\workspace\\springboot_work\\kosta270\\HUMASTORY2\\src\\main\\resources\\static\\img";

        System.out.println("empNum: " + empAttachVO.getEmpNum());

        for (MultipartFile multipartFile : uploadFile) {
            System.out.println("===========================");
            System.out.println("Upload File Name" + multipartFile.getOriginalFilename());


            File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

            String uuid = UUID.randomUUID().toString();
            String fileName = multipartFile.getOriginalFilename();
            String fileType = multipartFile.getContentType();
            String filePath = "/uploads/" + uuid + "/" + fileName;

        
            System.out.println("시작"+uuid);
            System.out.println(fileName);
            System.out.println(fileType);
            System.out.println(filePath);

            empAttachVO.setUuid(uuid);
            empAttachVO.setFileName(fileName);
            empAttachVO.setFileType((fileType));
            empAttachVO.setUploadPath(filePath);

            System.out.println(empAttachVO);

            service.saveFileAndData(empAttachVO);






            try {
               multipartFile.transferTo(saveFile);
                if (checkImageType(saveFile)) {
                    FileOutputStream thumbnail=new FileOutputStream(new File(uploadFolder,"s_"+
                            saveFile.getName()));

//                    FileOutputStream 으로 섬네일을 새로운 객체로 만드는데 들어가는 파일은 uploadFolder이고,
//                    저장한 파일 이름으로 섬네일 이미지를 만든다.
                    System.out.println("s_"+saveFile.getName());
                    BufferedImage bo_image= ImageIO.read(saveFile);
                    //ImageIo에서 saveFile객체를 읽어 BufferedImage에 저장
                    BufferedImage bt_image=new BufferedImage(300,500,
                            BufferedImage.TYPE_3BYTE_BGR);
                    //BufferedImage(int width, int height, int imageType)
                    //이 생성자는 너비, 높이,그리고 이미지 유형을 인자로 받아 새로운 객체를 생성한다.
                    Graphics2D graphics2D=bt_image.createGraphics();
                    //Java에서 그래픽을 그리는 데 사용되는 클래스로 고급적인 2D 그래픽 기능을 제공
                    //위에서 새로 만든 객체에다 그려서 넣는다는 말
                    graphics2D.drawImage(bo_image,0,0,300,500,null);
                    //1. 그릴 이미지, 이미지가 그려질 위치, 이미지의 크기, 이미지 관련 옵션
                    ImageIO.write(bt_image,"jpg",thumbnail);
                    //BufferedImage객체를 이미지 파일로 저장하는 역할을 한다.
                    //여기서 사용된느 write메서드는 이미지를 파일로 저장하는데 사용됩니다.

                    thumbnail.close();
                    //출력 스트림을 닫는다.
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }//end catch
        }//end for
        return "redirect:/emp/list";
    }
        private boolean checkImageType(File fileTwo){
            try {
                String contentType=Files.probeContentType(fileTwo.toPath());
                return contentType.startsWith("image");
            }catch (IOException e){
                e.printStackTrace();
            }
            return false;
        }
}


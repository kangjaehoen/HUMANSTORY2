package com.kosta.humanstory.controller;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import java.util.UUID;


import com.kosta.humanstory.domain.AttachFileDTO;
import net.coobird.thumbnailator.util.ThumbnailatorUtils;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

import javax.imageio.ImageIO;

@Controller
public class UploadController {

	@PostMapping("/uploadFormAction")
	public void uploadPost(MultipartFile[] uploadFile, Model model) {
		for (MultipartFile multipartFile : uploadFile) {
//			log.info("Uploaded file: " + multipartFile.getOriginalFilename());
		}
	}

    @PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {



        List<AttachFileDTO> list = new ArrayList<>();
        String uploadFolder = "C:\\upload\\";

        String uploadFolderPath = getFolder();
        // make folder --------
        File uploadPath = new File(uploadFolder, uploadFolderPath);

        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        for (MultipartFile multipartFile : uploadFile) {

            AttachFileDTO attachDTO = new AttachFileDTO();



            String uploadFileName = multipartFile.getOriginalFilename();



            attachDTO.setFileName(uploadFileName);

            UUID uuid = UUID.randomUUID();

            uploadFileName = uuid.toString() + "_" + uploadFileName;

            System.out.println("uploadFileName : "+ uploadFileName);

            try {
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);

                System.out.println("uploadPath :"+uploadPath);

                attachDTO.setUuid(uuid.toString());
                attachDTO.setUploadPath(uploadFolderPath);

                System.out.println("-----");
                System.out.println("attachDTO , UploadPath : "+attachDTO.getUploadPath());
                System.out.println("attachDTO , UUID : "+attachDTO.getUuid());
                System.out.println("attachDTO , FileName : "+attachDTO.getFileName());
                System.out.println("-----");

                // check image type file
                if (checkImageType(saveFile)) {

                    attachDTO.setImage(true);

                    System.out.println();

                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "_" + uploadFileName));

                    //System.out.println("썸네일 확인 : "+thumbnail);

                    //Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
                    Thumbnailator.createThumbnail(new File(uploadPath+"\\" + uploadFileName), new File(uploadPath+"thums_" + uploadFileName), 100, 100);

                    thumbnail.close();
                }

                // add to List
                list.add(attachDTO);

            } catch (Exception e) {
                e.printStackTrace();
            }

        } // end for
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

//    @PostMapping("/uploadAction")
//    public String uploadAction(MultipartFile uploadFile[])throws IOException {
//        String uploadFolder = "D:\\upload";
//
//        for (MultipartFile multipartFile : uploadFile) {
//
//            System.out.println("-------------------------------------");
//            System.out.println("Upload File Name: " + multipartFile.getOriginalFilename());
//
//
//            File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
//
//            try {
//                multipartFile.transferTo(saveFile);
//
//                if (checkImageType(saveFile)) {
//
//                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_" +
//                            saveFile.getName()));
//
//                    BufferedImage bo_image = ImageIO.read(saveFile);
//                    BufferedImage bt_image = new BufferedImage(300, 500, BufferedImage.TYPE_3BYTE_BGR);
//
//                    Graphics2D graphic = bt_image.createGraphics();
//
//                    graphic.drawImage(bo_image, 0, 0,300,500, null);
//
//                    ImageIO.write(bt_image, "jpg", thumbnail);
//
//                    thumbnail.close();
//                }
//
//            } catch (Exception e) {
//                System.out.println(e.getMessage());
//            } // end catch
//        } // end for
//
//        return null;
//    }




    private String getFolder() {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String str = sdf.format(date);

        return str.replace("-", File.separator);
    }

    private boolean checkImageType(File file) {

        try {
            String contentType = Files.probeContentType(file.toPath());

            return contentType.startsWith("image");

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }

    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName) {


        System.out.println("disPlay , fileName: " + fileName);

        File file = new File("C:\\upload\\" + fileName);


        System.out.println("display , file: " + file);

        ResponseEntity<byte[]> result = null;

        try {
            HttpHeaders header = new HttpHeaders();

            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
            System.out.println("display , result : "+ result);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
    }

    @GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {

        Resource resource = new FileSystemResource("C:\\upload\\" + fileName);

        if (resource.exists() == false) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        String resourceName = resource.getFilename();

        // remove UUID
        String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

        HttpHeaders headers = new HttpHeaders();
        try {

            boolean checkIE = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

            String downloadName = null;

            if (checkIE) {
                downloadName = URLEncoder.encode(resourceOriginalName, "UTF8").replaceAll("\\+", " ");
            } else {
                downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
            }

            headers.add("Content-Disposition", "attachment; filename=" + downloadName);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
    }

}

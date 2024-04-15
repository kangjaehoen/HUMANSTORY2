package com.kosta.humanstory.domain;

import lombok.Data;

@Data
public class EmpAttachVO {
    private String uuid;
    private String uploadPath;
    private String fileName;
    private boolean fileType;
    private String empNum;
}

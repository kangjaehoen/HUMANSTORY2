package com.kosta.humanstory.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpAttachVO {
    private String uuid;
    private String uploadPath;
    private String fileName;
    private String fileType;
    private String empNum;
}

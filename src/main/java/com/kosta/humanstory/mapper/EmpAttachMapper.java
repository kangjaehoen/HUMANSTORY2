package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.AttachVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmpAttachMapper {
    public void insert(AttachVO vo);
    public void delete(String uuid);
//    public List<AttachVO> findByEmpNum(Long empNum);
}

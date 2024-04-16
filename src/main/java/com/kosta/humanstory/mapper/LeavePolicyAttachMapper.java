package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.AttachVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LeavePolicyAttachMapper {
    public void insert(AttachVO attach);
    public List<AttachVO> findByBno(int lpNum);
    public void delete(String uuid);
    public void deleteAll(int lpNum);
}

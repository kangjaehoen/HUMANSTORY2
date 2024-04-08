package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.PromoteAttachVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LeavePromoteAttachMapper {
    public void insert(PromoteAttachVO attach);

    public List<PromoteAttachVO> findByBno(int lprNum);

    public void delete(String uuid);

    public void deleteAll(int lprNum);

}

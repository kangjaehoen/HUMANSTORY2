package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.AttachVO;
import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.LeavePolicyVO;
import com.kosta.humanstory.mapper.LeavePolicyAttachMapper;
import com.kosta.humanstory.mapper.LeavePolicyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeavePolicyService {
    @Autowired
    private LeavePolicyMapper leavePolicyMapper;
    @Autowired
    private LeavePolicyAttachMapper leavePolicyAttachMapper;

    public List<LeavePolicyVO> getLeavePolicyCharts(Criteria cri) {
        System.out.println(leavePolicyMapper.getList(cri));
        return leavePolicyMapper.getList(cri);
    }

    public int listTotal(Criteria cri) {
        System.out.println("총개수");
        return leavePolicyMapper.listTotalCount(cri);
    }

    public void registerLeavePolicy(LeavePolicyVO vo) {
        System.out.println("휴가 정책 등록 , 서비스");
        System.out.println("휴가정책 서비스 등록(파일 추가)");
        leavePolicyMapper.insert(vo);
        System.out.println("서비스 등록정보 "+vo);

        if (vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
            return;
        }
        vo.getAttachList().forEach(attach -> {
            attach.setLpNum(vo.getLpNum());
            leavePolicyAttachMapper.insert(attach);
            System.out.println("파일 등록 서비스 :"+attach);
        });

    }
    public LeavePolicyVO getLeavePolicyOne(int lpNum) {
        System.out.println("휴가 정책 서비스단  세부 조회"+lpNum);
        return leavePolicyMapper.getDetail(lpNum);
    }

    public boolean modifyLeavePolicy(LeavePolicyVO vo) {

        System.out.println("휴가 정책 게시물 수정, 서비스 : " +vo);

        leavePolicyAttachMapper.deleteAll(vo.getLpNum());
        boolean result = leavePolicyMapper.update(vo) == 1;

        if (result && vo.getAttachList() != null && vo.getAttachList().size() > 0) {
            vo.getAttachList().forEach(attach -> {
                attach.setLpNum(vo.getLpNum());
                leavePolicyAttachMapper.insert(attach);
            });
        }
        return result;
    }
    public int removeLeavePolicy(int lpNum) {

        System.out.println("휴가정책 서비스 , 삭제");

        return leavePolicyMapper.delete(lpNum);
    }

    public List<AttachVO> getAttachList(int lpNum) {
        System.out.println("파일 첨부"+lpNum);
        return leavePolicyAttachMapper.findByBno(lpNum);
    }



}
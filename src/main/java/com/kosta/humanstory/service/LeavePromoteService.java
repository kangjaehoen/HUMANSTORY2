package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.LeavePromoteVO;
import com.kosta.humanstory.domain.PromoteAttachVO;
import com.kosta.humanstory.mapper.LeavePromoteAttachMapper;
import com.kosta.humanstory.mapper.LeavePromoteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLOutput;
import java.util.List;

@Service
public class LeavePromoteService {

    @Autowired
    private LeavePromoteMapper leavePromoteMapper;
    @Autowired
    private LeavePromoteAttachMapper leavePromoteAttachMapper;




    public void registerLeavePromote(LeavePromoteVO vo) {
        System.out.println("휴가 촉진 등록 , 서비스");
        System.out.println("휴가촉진 서비스 등록(파일 추가)");
        leavePromoteMapper.insert(vo);
        System.out.println("서비스 등록정보 "+vo);

        if (vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
            return;
        }
        vo.getAttachList().forEach(attach -> {
            attach.setLprNum(vo.getLprNum());
            leavePromoteAttachMapper.insert(attach);


            System.out.println("파일 등록 서비스 :"+attach);
        });

    }


    public List<LeavePromoteVO> getLeavePromoteCharts(Criteria cri) {
        System.out.println("휴가촉진 리스트 , 서비스");
        return leavePromoteMapper.getList(cri);
    }


    public LeavePromoteVO getLeavePromoteOne(int lprNum) {
        System.out.println("휴가 촉진 세부조회 , 서비스");
        return leavePromoteMapper.getDetail(lprNum);
    }


    public boolean modifyLeavePromote(LeavePromoteVO vo) {
        System.out.println("휴가 촉진 게시물 수정, 서비스");

        leavePromoteAttachMapper.deleteAll(vo.getLprNum());
        boolean result = leavePromoteMapper.update(vo) == 1;

        if(result && vo.getAttachList() != null && vo.getAttachList().size()>0) {
            vo.getAttachList().forEach(attach->{
                attach.setLprNum(vo.getLprNum());
                leavePromoteAttachMapper.insert(attach);
            });
        }
        return result;
    }


    public int removeLeavePromote(int lprNum) {
        System.out.println("휴가 촉진 삭제, 서비스");

        return leavePromoteMapper.delete(lprNum);
    }


    public int listTotal(Criteria cri) {
        System.out.println("총개수");
        return leavePromoteMapper.listTotalCount(cri);
    }


    public List<PromoteAttachVO> getAttachList(int lprNum) {

        System.out.println("파일 첨부"+lprNum);
        return leavePromoteAttachMapper.findByBno(lprNum);
    }

}

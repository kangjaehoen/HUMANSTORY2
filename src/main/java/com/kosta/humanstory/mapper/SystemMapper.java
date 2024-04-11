package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.AnnualLeaveDTO;
import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.domain.LeaveCategoryVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SystemMapper {
    public List<EmployeeVO> hireDateFind();
    public  int leaveGrantNum(AnnualLeaveDTO dto);
    public int  annulLeaveDay(AnnualLeaveDTO dto);
    public LeaveCategoryVO annulLeaveNumSetApply();
    public LeaveCategoryVO leaveGrantDaySetApply();
    public int oneYears(AnnualLeaveDTO dto);
    public void oneYearsLess(String empNum, double leaveDays);


}

package com.kosta.humanstory.mapper;

import com.kosta.humanstory.domain.*;
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
    public int leaveUpdate(LeaveUserDTO dto);
    public int insertLeave(LeaveUserDTO dto);
    public PersonalLeaveDayVO existenceLeave(LeaveUserDTO dto);

    public List<EmployeeWithPersonalLeaveDayDTO> userListManager();

    public EmployeeVO findById(String empNum);


}

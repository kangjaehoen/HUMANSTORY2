package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.AnnualLeaveDTO;
import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.domain.LeaveCategoryVO;
import com.kosta.humanstory.mapper.SystemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

@Service
public class SystemService {

    @Autowired
    private SystemMapper systemMapper;

    public int leaveGrantNum(AnnualLeaveDTO  dto){
        System.out.println("서비스 : 회계일 기준 휴가일수 부여 설정 : "  +dto);
        return systemMapper.leaveGrantNum(dto);
    }
public int intannulLeaveDay(AnnualLeaveDTO dto){
    System.out.println("서비스 : 회계일 설정 : "+dto);
    return systemMapper.annulLeaveDay(dto);
}

public LeaveCategoryVO  annulLeaveNumSetApply(){
    System.out.println("휴가일수 :" + systemMapper.annulLeaveNumSetApply() );
      return  systemMapper.annulLeaveNumSetApply();
}
public LeaveCategoryVO leaveGrantDaySetApply(){
    System.out.println("회계일 : "+systemMapper.leaveGrantDaySetApply());
       return  systemMapper.leaveGrantDaySetApply();
}
public void  updateLeaveAnnual(AnnualLeaveDTO dto) {
    LeaveCategoryVO annualDay = systemMapper.leaveGrantDaySetApply(); //설정일
    LeaveCategoryVO grantDate = systemMapper.annulLeaveNumSetApply(); // 설정일 수
    dto.setGrantDate(grantDate.getGrantDate());
    dto.setGrantDay(annualDay.getGrantDay());

    System.out.println("휴가 부여 설정일 수 : " + grantDate.getGrantDate());
    System.out.println("설정일 : " + annualDay.getGrantDay());


    LocalDate today = LocalDate.now(); // 지금 날짜
    System.out.println("오늘 날짜 : " + today);


    List<EmployeeVO> emp = systemMapper.hireDateFind(); //사원의 입사일


    String grantDayString = annualDay.getGrantDay(); // 날짜를 문자로 변환
    LocalDate grantDay = LocalDate.parse(grantDayString); //localDat로 변환

    if (grantDay.equals(today)) { // 설정일 과 오늘날짜와 같다면
        System.out.println("동작 확인");

        for (int i = 0; i < emp.size(); i++) {

            System.out.println("사원 명단:  " + emp.get(i));

            Date hireDate = emp.get(i).getHireDate();
            LocalDate hireLocalDate = hireDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();


            long daysSinceHire = ChronoUnit.DAYS.between(hireLocalDate, today); // 근무일
            System.out.println("근무일 : " + daysSinceHire);

            double leaveDays;

            if (daysSinceHire < 365) {

                leaveDays = daysSinceHire / 30.0; // 1달에 1일씩 적립
                systemMapper.oneYearsLess(emp.get(i).getEmpNum(), leaveDays);
                System.out.println("1년미만 사원 : " + emp.get(i));


            } else if (365 <= daysSinceHire && daysSinceHire < 1095) {
                systemMapper.oneYears(dto);

                System.out.println(systemMapper.oneYears(dto));

            } else if (1095 <= daysSinceHire) {
                leaveDays = dto.getGrantDate() + (double) ((daysSinceHire - 365) / 730);
                System.out.println("총 휴가일 " + leaveDays);

                dto.setGrantDate(leaveDays);
                systemMapper.oneYears(dto);


            }
            dto.setGrantDate(grantDate.getGrantDate()); // 반복문 끝나면 초기화
        }
    }
    
}

}

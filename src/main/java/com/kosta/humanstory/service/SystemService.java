package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.*;
import com.kosta.humanstory.mapper.SystemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

@Service
public class SystemService {

    @Autowired
    private SystemMapper systemMapper;

    public int leaveGrantNum(AnnualLeaveDTO dto) {
        System.out.println("서비스 : 회계일 기준 휴가일수 부여 설정 : " + dto);
        return systemMapper.leaveGrantNum(dto);
    }

    public int intannulLeaveDay(AnnualLeaveDTO dto) {
        System.out.println("서비스 : 회계일 설정 : " + dto);
        return systemMapper.annulLeaveDay(dto);
    }

    public LeaveCategoryVO annulLeaveNumSetApply() {
        System.out.println("휴가일수 :" + systemMapper.annulLeaveNumSetApply());
        return systemMapper.annulLeaveNumSetApply();
    }

    public LeaveCategoryVO leaveGrantDaySetApply() {
        System.out.println("회계일 : " + systemMapper.leaveGrantDaySetApply());
        return systemMapper.leaveGrantDaySetApply();
    }

    public void updateLeaveAnnual(AnnualLeaveDTO dto) { // 1년이상 3년 미만 근무자 휴가 부여일 수
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

        if (grantDay.equals(today) ) { // 설정일 과 오늘날짜와 같다면
            System.out.println("동작 확인");

            for (int i = 0; i < emp.size(); i++) {

                System.out.println("사원 명단:  " + emp.get(i));

                Date hireDate = emp.get(i).getHireDate();
                LocalDate hireLocalDate = hireDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();


                long daysSinceHire = ChronoUnit.DAYS.between(hireLocalDate, today); // 근무일
                System.out.println("근무일 : " + daysSinceHire);

                double leaveDays;

               if (365 <= daysSinceHire && daysSinceHire < 1095) {
                    dto.setEmpNum(emp.get(i).getEmpNum());
                    systemMapper.oneYears(dto);
                    System.out.println(systemMapper.oneYears(dto));

                } else if (1095 <= daysSinceHire) {
                    leaveDays = dto.getGrantDate() + (double) ((daysSinceHire - 365) / 730);
                    System.out.println("총 휴가일 " + leaveDays);
                   if (leaveDays > 25) {
                       leaveDays = 25;
                   }
                    dto.setEmpNum(emp.get(i).getEmpNum());
                    dto.setGrantDate(leaveDays);
                    systemMapper.oneYears(dto);

                }
                dto.setGrantDate(grantDate.getGrantDate()); // 반복문 끝나면 초기화
            }
        }
    }

    public void less1Years() { // 1년 미만인 사람에게 부여되는 휴가 부여 매서드
        LocalDate today = LocalDate.now(); // 현재 날짜

        List<EmployeeVO> emp = systemMapper.hireDateFind();

        for (EmployeeVO employee : emp) {
            Date hireDate = employee.getHireDate();
            LocalDate hireLocalDate = hireDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            long monthsSinceHire = ChronoUnit.MONTHS.between(hireLocalDate, today); // 입사 후 개월 수


            // 만약 한 달이 경과했을 때에만 휴가 일수를 증가시킴
            if (monthsSinceHire < 12) { // 12개월(1년)미만일 때 증가
                double leaveDays = 1.0; // 1개월에 1일씩 증가
                systemMapper.oneYearsLess(employee.getEmpNum(), leaveDays);

            }
        }
    }
    public List<EmployeeVO> userList(){
        System.out.println("유저 리스트");
        return systemMapper.hireDateFind();
    }


    public void insertAndUpdateLeave(LeaveUserDTO dto) {
        PersonalLeaveDayVO personalLeaveDayVO = systemMapper.existenceLeave(dto);
        System.out.println("서비스단 확인 : "+personalLeaveDayVO);

        if (personalLeaveDayVO == null) {
            System.out.println("한번도 신청한적 없는 휴가 , 등록");
           systemMapper.insertLeave(dto);
        } else {
            System.out.println("신청내역이 있어서 업데이트");
             systemMapper.leaveUpdate(dto);
        }
    }

    public List<EmployeeWithPersonalLeaveDayDTO>  userListManager(){
        System.out.println("관리자용 사원 휴가 리스트");
        return systemMapper.userListManager();
    }


}

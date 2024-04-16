package com.kosta.humanstory.controller;

/*import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.mapper.EmployeeMapper;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;*/

/*@Aspect
@Component*/
public class AccessAspect {

  /*  @Autowired
    private EmployeeMapper mapper;

    @Pointcut("execution(* com.kosta.humanstory.controller.LeaveController.managerList(..))")
    private void managerListExecution() {}

    @Around("managerListExecution()")
    public Object aroundManagerList(ProceedingJoinPoint joinPoint) throws Throwable {
        String empNum = "101"; // 임시로 empNum을 설정

        // empNum이 매니저 번호인지 확인
        EmployeeVO employee = isManager(empNum);
        System.out.println(employee);
        if (employee != null && employee.getManager() != null) {
            // 매니저인 경우에만 메서드 실행
            return joinPoint.proceed();
        } else {
            // 매니저가 아닌 경우에는 예외를 던지거나 다른 처리를 수행할 수 있음
            throw new IllegalAccessException("Only managers are allowed to access this method");
        }
    }

    // empNum이 매니저 번호인지 확인하는 메서드
    private EmployeeVO isManager(String empNum) {
        // 매니저 번호 여부 확인 로직 구현
        return mapper.managerCheck(empNum);
    }*/


}
/*

 if (args.length > 0 && args[0] instanceof String) {
String empNum = (String) args[0];
*/

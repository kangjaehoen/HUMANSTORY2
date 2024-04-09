package com.kosta.humanstory.serviceTest;

import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.mapper.EmployeeMapper;
import com.kosta.humanstory.service.EmpService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import java.time.LocalDate;
import java.util.Date;

@AutoConfigureMockMvc
@SpringBootTest
public class empServiceTest {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private EmpService empService;


    @Test
	public void testRegister(){

        EmployeeVO emp=new EmployeeVO();
        emp.setEmpName("jongwon");
        emp.setPw("1231");
        emp.setJob("대리");
        emp.setPhoneNum(26467154);
        emp.setAddress("성남시");
        emp.setAnnualLeaveNum(15);


        empService.register(emp);
	}
//    @Test
//    public void testRemove(){
//        if(empService.remove("201")){
//            System.out.println(empService.remove("201"));
//        }
//        else System.out.println("boolean값 확인");
//    }

//    @Test
//    public void testUpdate(){
//        EmployeeVO emp=empService.get("1");
//       if(emp==null){
//           return;
//       }
//       emp.setEmpName("Ok");
//       emp.setPw("1818");
//
//        System.out.println("modify result"+empService.modify(emp));
//    }


}

package com.kosta.humanstory.serviceTest;

import com.kosta.humanstory.domain.DeptVO;
import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.service.DeptService;
import com.kosta.humanstory.service.EmpService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

@AutoConfigureMockMvc
@SpringBootTest
public class deptServiceTest {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private DeptService service;


    @Test
	public void testRegister(){

        DeptVO dept=new DeptVO();
        dept.setDeptName("serviceTest중");

        service.register(dept);
	}
//    @Test
//    public void testRead(DeptVO dept){
//        dept.setDeptNum("1");
//        service.read(dept);
//    }
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


    @Test
    public void testList(){
        List<DeptVO> dept=service.getList();
        System.out.println(dept);
    }
}

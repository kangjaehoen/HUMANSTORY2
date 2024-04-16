package com.kosta.humanstory.mapperTest;

import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.mapper.EmployeeMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.util.List;

@AutoConfigureMockMvc
@SpringBootTest
public class empMapperTest {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private EmployeeMapper mapper;

//    @Test
//	public void testInsertEmpInfo() {
//	    EmployeeVO emp = new EmployeeVO();
//	    emp.setEmpName("ddd");
//
//	    emp.setPw("son7Hoor");
//	    mapper.insertEmpInfo(emp);
//	}

//	@Test
//	public void testRead(){
//		EmployeeVO emp=mapper.read("101");
//		System.out.println(emp);
//	}

//	@Test
//	public void testLilst(){
//		List <EmployeeVO> emp = mapper.getList();
//		System.out.println(emp);
//	}

//	@Test
//	public void testUpdate(){
//		EmployeeVO emp=new EmployeeVO();
//		emp.setEmpNum("1");
//		emp.setEmpName("jw");
//        emp.setPw("new");
//		int count=mapper.update(emp);
//		System.out.println("update count"+count
//		);
//	}

//	@Test
//	public void testDelete(){
//		System.out.println(mapper.delete("101"));
//	}



}

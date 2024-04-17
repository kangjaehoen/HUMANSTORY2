package com.kosta.humanstory.mapperTest;

import com.kosta.humanstory.domain.DeptVO;
import com.kosta.humanstory.mapper.DeptMapper;
import com.kosta.humanstory.mapper.EmployeeMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

@AutoConfigureMockMvc
@SpringBootTest
public class deptMapperTest {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private DeptMapper mapper;

    @Test
	public void testInsertEmpInfo() {
	    DeptVO dept = new DeptVO();
	    dept.setDeptName("과학부");
	    mapper.insertDeptInfo(dept);
	}


	@Test
	public void testRead(){
		DeptVO dept=mapper.read("1");
		System.out.println(dept);
	}

	@Test
	public void testLilst(){
		List<DeptVO> dept = mapper.getList();
		System.out.println(dept);
	}

	@Test
	public void testUpdate(){
		DeptVO dept=new DeptVO();
		dept.setDeptNum("101");
		dept.setDeptName("부서명");

		int count=mapper.update(dept);
		System.out.println("update count"+count
		);
	}

	@Test
	public void testDelete(){
		System.out.println(mapper.delete("101"));
	}



}

package com.kosta.humanstory.controller;

import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@WebAppConfiguration
@AutoConfigureMockMvc
@SpringBootTest
public class empControllerTest {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private EmpController controller;
    @Autowired
    private WebApplicationContext ctx;

    @Before
    public void setUP(){
        this.mockMvc= MockMvcBuilders.webAppContextSetup(ctx)
                .build();
    }
//    @Test
//   public void removeController() throws Exception {
//        System.out.println(mockMvc.perform(MockMvcRequestBuilders.post("/emp/remove")
//                .param("empNum","301"))
//                .andReturn().getModelAndView().getViewName());
//        System.out.println("제거되었습니다.");
//    }

    @Test
    public void testModify() throws Exception{
        String resultPage=mockMvc.perform(MockMvcRequestBuilders.post("/emp/modify")
                .param("empNum","1")
                .param("empName","ten8")
                .param("pw","security")
                )
                .andReturn().getModelAndView().getViewName();
        System.out.println(resultPage);
    }

}

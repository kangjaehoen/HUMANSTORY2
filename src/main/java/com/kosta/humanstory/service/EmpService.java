package com.kosta.humanstory.service;

import com.kosta.humanstory.domain.Criteria;
import com.kosta.humanstory.domain.EmployeeVO;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.List;


public interface EmpService {
   public void register(EmployeeVO emp);
   public void read(EmployeeVO emp);
   public List<EmployeeVO> getList();
   public List<EmployeeVO> getList(Criteria cri);
//   @PreAuthorize("hasRole('ROLE_ADMIN')")
   public boolean remove(String empNum);
   public boolean modify(EmployeeVO emp);
   public EmployeeVO get(String empNum);

   public int getTotal(Criteria cri);


}

package com.kosta.humanstory.Config.auth;

import com.kosta.humanstory.domain.EmployeeVO;
import com.kosta.humanstory.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class PrincipalDetailService implements UserDetailsService {
    @Autowired
    private EmployeeMapper mapper;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        System.out.println("empNum: "+ username);
        EmployeeVO empEntity=mapper.findByEmpNum(username);
//        System.out.println("empEntity: " + empEntity);
        if(empEntity!=null){
            return new PrincipalDetail(empEntity);
        }
        return null;
    }
}

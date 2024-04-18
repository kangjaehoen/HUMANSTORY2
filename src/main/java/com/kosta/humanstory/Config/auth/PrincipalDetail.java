package com.kosta.humanstory.Config.auth;

import com.kosta.humanstory.domain.EmployeeVO;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.Objects;

@Data
public class PrincipalDetail implements UserDetails {
    private EmployeeVO emp;
    private Map<String, Object> attributes;
    public PrincipalDetail(EmployeeVO emp){
        this.emp=emp;
    }

    public PrincipalDetail(EmployeeVO emp, Map<String,Object> attributes){
        this.emp=emp;
        this.attributes=attributes;
    }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collect = new ArrayList<>();
        collect.add(new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return emp.getRole();
            }
        });
        return collect;
    }
    @Override
    public String getPassword() {
        return emp.getPw();
    }
    @Override
    public String getUsername() {
        return emp.getEmpName();
    }
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
    @Override
    public boolean isEnabled() {
        return true;
    }
}

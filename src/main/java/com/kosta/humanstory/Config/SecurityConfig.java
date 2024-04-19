package com.kosta.humanstory.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true,prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public BCryptPasswordEncoder encoderPwd(){
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //csrf토큰을 막는다.
        http.csrf().disable();

        // /emp로 들어가는 주소는 모두 허락해준다.
        http.headers().frameOptions().disable();
        http.authorizeRequests().antMatchers("/login/joinForm/**").permitAll();

        http.authorizeRequests()
                .antMatchers("/main").authenticated() //등록하면 유저 권한만 들어갈 수 있다.
                .antMatchers("/dept/**") //어드민과 매니저 권한이 있어야한다.
                .access("hasRole('ROLE_ADMIN')or hasRole('ROLE_MANAGER')")
                .antMatchers("/system/**","/email/**")//어드민 권한이 있어야 한다.
                .access("hasRole('ROLE_ADMIN')")
                .anyRequest().permitAll() // 그 외는 모두 허락
                .and()
                .formLogin()
                .loginPage("/customlogin")
                .loginProcessingUrl("/customlogin")
                .defaultSuccessUrl("/main");

        http.logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/customlogin")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll();

//        System.out.println();
    }
}

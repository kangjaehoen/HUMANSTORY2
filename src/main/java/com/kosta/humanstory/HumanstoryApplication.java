package com.kosta.humanstory;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;


@EnableScheduling
@SpringBootApplication
public class HumanstoryApplication {
   
    public static void main(String[] args) {
        SpringApplication.run(HumanstoryApplication.class, args);
    };


}

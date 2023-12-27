package com.edk4j.manual;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ApplicationBoot extends SpringBootServletInitializer{ 
	public static void main(String[] args) throws IOException {
		SpringApplication.run(ApplicationBoot.class,args);
	}
}

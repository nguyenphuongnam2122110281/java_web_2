package com.example.NguyenPhuongNam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import com.example.NguyenPhuongNam.config.JwtProperties;

@SpringBootApplication
@EnableConfigurationProperties(JwtProperties.class)
public class NguyenPhuongnamApplication {
	public static void main(String[] args) {
		SpringApplication.run(NguyenPhuongnamApplication.class, args);
	}
}

package com.stellantis.group;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.stellantis.group.repositories.EnvironmentRepository;
import com.stellantis.group.repositories.VehicleRepository;

@SpringBootApplication
public class GlobalApplication {

	public static void main(String[] args) {
		SpringApplication.run(GlobalApplication.class, args);
	}

}

package com.stellantis.group.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stellantis.group.dtos.EnvironmentDTO;
import com.stellantis.group.models.Environment;
import com.stellantis.group.repositories.EnvironmentRepository;

@Service
public class EnvironmentService {

	@Autowired
	private EnvironmentRepository environmentRepository;

	public List<Environment> findAll() {
		try {
			return environmentRepository.findAll();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public void removeEnviroment(int id) {
		try {
			environmentRepository.deleteById(id);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void saveEnviroment(Environment environment) {
		try {
			environmentRepository.save(environment);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public Object updateEnviromentById(Integer id, Environment environmentModel) {
		try {
			Optional<Environment> environment = environmentRepository.findById(id);
			if (!environment.isPresent())
				return null;

			environmentModel.setId(id);
			environmentRepository.save(environmentModel);
			return environmentModel;
		} catch (Exception e) {
			System.out.println(e);
		}
		return Optional.empty();
	}

}

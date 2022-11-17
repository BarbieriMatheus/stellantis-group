package com.stellantis.group.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stellantis.group.models.Regional;
import com.stellantis.group.repositories.RegionalRepository;

@Service
public class RegionalService {

	@Autowired
	RegionalRepository repository;

	public void removeRegioanl(int id) {
		try {
			repository.deleteById(id);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void saveRegional(Regional regional) {
		repository.save(regional);
	}

}
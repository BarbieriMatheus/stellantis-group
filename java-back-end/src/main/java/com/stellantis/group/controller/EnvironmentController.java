package com.stellantis.group.controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.stellantis.group.dtos.EnvironmentDTO;
import com.stellantis.group.models.Environment;
import com.stellantis.group.services.EnvironmentService;

@RestController
@CrossOrigin(origins = "*", maxAge = 3600)
@RequestMapping("/environments")
public class EnvironmentController {

	@Autowired
	private EnvironmentService ambienteService;

	@GetMapping
	public ResponseEntity<Collection<Environment>> getEnvironments() {
		Collection<Environment> environments = ambienteService.findAll();
		return new ResponseEntity<>(environments, HttpStatus.OK);
	}

}

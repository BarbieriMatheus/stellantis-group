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

import com.stellantis.group.dtos.VehicleDTO;
import com.stellantis.group.models.Environment;
import com.stellantis.group.models.Regional;
import com.stellantis.group.models.Vehicle;
import com.stellantis.group.services.EnvironmentService;
import com.stellantis.group.services.RegionalService;
import com.stellantis.group.services.VehicleService;

@RestController
@CrossOrigin(origins = "*", maxAge = 3500)
@RequestMapping("/vehicles")
public class VehicleController {

	@Autowired
	private EnvironmentService ambienteService;

	@Autowired
	private RegionalService regionalService;

	@Autowired
	private VehicleService vehicleService;

	@GetMapping
	public ResponseEntity<Collection<Vehicle>> getVehicles() {
		return ResponseEntity.ok(vehicleService.findAllVehicles());
	}

	@PostMapping
	public ResponseEntity<Vehicle> postVehicles(@RequestBody VehicleDTO dto) {
		System.out.println(dto);
		Vehicle vehicleModel = dto.toEntity();
		vehicleService.saveVehicles(vehicleModel);
		return new ResponseEntity<>(vehicleModel, HttpStatus.CREATED);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Vehicle> deleteVehicles(@PathVariable(value = "id") String id) {
		regionalService.removeRegioanl(Integer.parseInt(id));
		vehicleService.removeVehicles(Integer.parseInt(id));
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Void> updateVehicles(@PathVariable(value = "id") String id, @RequestBody VehicleDTO dto) {
		Vehicle vehicle = vehicleService.updateVehiclesById(Integer.parseInt(id), dto);
		if (vehicle != null)
			return ResponseEntity.ok().build();

		return ResponseEntity.notFound().build();
	}

}

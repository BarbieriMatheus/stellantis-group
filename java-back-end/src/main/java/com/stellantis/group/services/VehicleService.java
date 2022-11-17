package com.stellantis.group.services;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.Future;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stellantis.group.dtos.VehicleDTO;
import com.stellantis.group.models.Environment;
import com.stellantis.group.models.Vehicle;
import com.stellantis.group.repositories.VehicleRepository;

@Service
public class VehicleService {

	@Autowired
	private VehicleRepository vehicleRepository;

	@Autowired
	private EnvironmentService ambienteService;

	public List<Vehicle> findAllVehicles() {
		try {
			return vehicleRepository.findAll();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public void saveVehicles(Vehicle vehicle) {
		try {
//			return vehicleRepository.save(vehicle);
			vehicleRepository.save(vehicle);
		} catch (Exception e) {
			System.out.println(e);
		}
//		return null;
	}

	public Vehicle updateVehiclesById(Integer id, VehicleDTO dto) {
		Optional vehicle = vehicleRepository.findById(id);
		if (vehicle.isPresent()) {
			Vehicle vehicleAntigo = (Vehicle) vehicle.get();
			Vehicle entity = dto.toEntity();
			return vehicleRepository.save(entity);
		} else {
			return null;
		}
	}

	public void removeVehicles(int id) {
		try {
			vehicleRepository.deleteById(id);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}

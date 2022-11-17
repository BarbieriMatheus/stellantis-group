package com.stellantis.group.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.stellantis.group.models.Vehicle;

@Repository
public interface VehicleRepository extends JpaRepository<Vehicle, Integer> {

}

package com.stellantis.group.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.stellantis.group.models.Environment;

@Repository
public interface EnvironmentRepository extends JpaRepository<Environment, Integer> {

}

package com.stellantis.group.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.stellantis.group.models.Regional;

@Repository
public interface RegionalRepository extends JpaRepository<Regional, Integer> {

}
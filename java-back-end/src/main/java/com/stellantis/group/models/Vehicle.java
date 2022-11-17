package com.stellantis.group.models;

import lombok.Data;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Data
@Table(name = "vehicles")
public class Vehicle {

	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "id_Sequence")
    @SequenceGenerator(name = "id_Sequence", sequenceName = "ID_SEQ")
	private int id;

	@Column(nullable = false)
	private String brand;

	@Column(nullable = false)
	private String vehiclePlate;

	@Column(nullable = false)
	private double mileage;

	@Column(nullable = false)
	private String model;

	@OneToOne(mappedBy = "vehicle", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonManagedReference
	private Environment environment;

	public Vehicle() {
	}

	public Vehicle(int id, String brand, String vehiclePlate, double mileage, String model) {
		this.id = id;
		this.brand = brand;
		this.vehiclePlate = vehiclePlate;
		this.mileage = mileage;
		this.model = model;
	}

	public Environment getEnvironment() {
		return environment;
	}

	public void setEnvironment(Environment environment) {
		this.environment = environment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getVehiclePlate() {
		return vehiclePlate;
	}

	public void setVehiclePlate(String vehiclePlate) {
		this.vehiclePlate = vehiclePlate;
	}

	public double getMileage() {
		return mileage;
	}

	public void setMileage(double mileage) {
		this.mileage = mileage;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

}

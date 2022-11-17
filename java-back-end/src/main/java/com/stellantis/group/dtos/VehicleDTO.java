package com.stellantis.group.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.stellantis.group.models.Environment;
import com.stellantis.group.models.Vehicle;

public class VehicleDTO {

	private int id;

	@JsonProperty("environment")
	private Environment environment;

	private String model;
	private String brand;
	private String vehiclePlate;
	private double mileage;

	public Vehicle toEntity() {
		Vehicle vehicleModel = new Vehicle();
		vehicleModel.setModel(getModel());
		vehicleModel.setBrand(getBrand());
		vehicleModel.setMileage(getMileage());
		vehicleModel.setVehiclePlate(getVehiclePlate());

		Environment environmentModel = getEnvironment();
		environmentModel.setVehicle(vehicleModel);

//        environmentModel.setAirQuality(getAmbiente().getAirQuality());
//        environmentModel.setState(getAmbiente().getState());
//        environmentModel.setCity(getAmbiente().getCity());
//        environmentModel.setDistrict(getAmbiente().getDistrict());
//        environmentModel.setTempEnvironment(getAmbiente().getTempEnvironment());
		vehicleModel.setEnvironment(environmentModel);
		return vehicleModel;
	}

	public VehicleDTO() {
	}

	public VehicleDTO(Environment environment, String model, String brand, String vehiclePlate, double mileage) {
		this.environment = environment;
		this.model = model;
		this.brand = brand;
		this.vehiclePlate = vehiclePlate;
		this.mileage = mileage;
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

	public Environment getAmbiente() {
		return environment;
	}

	public void setAmbiente(Environment environment) {
		this.environment = environment;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
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

}
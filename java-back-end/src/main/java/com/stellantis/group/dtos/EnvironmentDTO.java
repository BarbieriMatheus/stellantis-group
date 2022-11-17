package com.stellantis.group.dtos;

import com.stellantis.group.models.Vehicle;

public class EnvironmentDTO {

	private int id;
	private Vehicle vehicle;
	private String state;
	private String city;
	private String district;
	private double tempEnvironment;
	private String airQuality;

	public EnvironmentDTO() {
	}

	public EnvironmentDTO( String state, String city, String district, double tempEnvironment,
			String airQuality) {
//		this.vehicle = vehicle;
		this.state = state;
		this.city = city;
		this.district = district;
		this.tempEnvironment = tempEnvironment;
		this.airQuality = airQuality;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public double getTempEnvironment() {
		return tempEnvironment;
	}

	public void setTempEnvironment(double tempEnvironment) {
		this.tempEnvironment = tempEnvironment;
	}

	public String getAirQuality() {
		return airQuality;
	}

	public void setAirQuality(String airQuality) {
		this.airQuality = airQuality;
	}

}

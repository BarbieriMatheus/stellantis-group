package com.stellantis.group.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "environments")
public class Environment {
	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_Sequence")
	@SequenceGenerator(name = "id_Sequence", sequenceName = "ID_SEQ")
	private int id;

	@Column(nullable = false)
	private String city;

	@Column(nullable = false)
	private double tempEnvironment;

	@Column(nullable = false)
	private String airQuality;

	@Column(nullable = false)
	private String state;

	@Column(nullable = false)
	private String district;

	@OneToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "vehicle_id", nullable = false)
	@JsonBackReference
	private Vehicle vehicle;

	public Environment() {
	}

	public Environment(String city, double tempEnvironment, String airQuality, String state, String district) {
		this.city = city;
		this.tempEnvironment = tempEnvironment;
		this.airQuality = airQuality;
		this.state = state;
		this.district = district;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

}

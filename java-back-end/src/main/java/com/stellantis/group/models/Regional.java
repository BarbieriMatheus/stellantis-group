package com.stellantis.group.models;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

import static java.time.LocalDateTime.now;

@Entity
@Data
public class Regional {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "id_Sequence")
    @SequenceGenerator(name = "id_Sequence", sequenceName = "ID_SEQ")
	private int id;

	private int vehicleId;

	@Column(nullable = false)
	private LocalDateTime operateDate = now();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}

	public LocalDateTime getOperateDate() {
		return operateDate;
	}

	public void setOperateDate(LocalDateTime operateDate) {
		this.operateDate = operateDate;
	}

}
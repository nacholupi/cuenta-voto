package com.tripodes.model.bean;

import java.io.Serializable;

public class Mesa implements Serializable {
	
	private static final long serialVersionUID = 1L;
    
	private Integer id;
	private String descripcion;
	private Integer cantVotantes;
	private Integer idCircuito;
	
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Integer getCantVotantes() {
		return cantVotantes;
	}
	public void setCantVotantes(Integer cantVotantes) {
		this.cantVotantes = cantVotantes;
	}
	public Integer getIdCircuito() {
		return idCircuito;
	}
	public void setIdCircuito(Integer idCircuito) {
		this.idCircuito = idCircuito;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}	
}

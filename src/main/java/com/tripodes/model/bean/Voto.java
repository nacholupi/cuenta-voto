package com.tripodes.model.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Voto implements Serializable {
	
	private static final long serialVersionUID = 1L;
    
	private Integer id;
	private Integer idMesa;
	private Integer idOpcionVoto;
	private Integer idUsuario;
	private Integer cantDiputado;
	private Integer cantLegislador;
	private Integer cantConsejal;
	private Timestamp fechaAlta;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getIdMesa() {
		return idMesa;
	}
	public void setIdMesa(Integer idMesa) {
		this.idMesa = idMesa;
	}
	public Integer getIdOpcionVoto() {
		return idOpcionVoto;
	}
	public void setIdOpcionVoto(Integer idOpcionVoto) {
		this.idOpcionVoto = idOpcionVoto;
	}
	public Integer getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}
	public Integer getCantDiputado() {
		return cantDiputado;
	}
	public void setCantDiputado(Integer cantDiputado) {
		this.cantDiputado = cantDiputado;
	}
	public Integer getCantLegislador() {
		return cantLegislador;
	}
	public void setCantLegislador(Integer cantLegislador) {
		this.cantLegislador = cantLegislador;
	}
	public Integer getCantConsejal() {
		return cantConsejal;
	}
	public void setCantConsejal(Integer cantConsejal) {
		this.cantConsejal = cantConsejal;
	}
	public Timestamp getFechaAlta() {
		return fechaAlta;
	}
	public void setFechaAlta(Timestamp fechaAlta) {
		this.fechaAlta = fechaAlta;
	}
	
}

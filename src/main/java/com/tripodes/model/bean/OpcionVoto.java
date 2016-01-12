package com.tripodes.model.bean;

import java.io.Serializable;

public class OpcionVoto implements Serializable {
	

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer orden;
	private Integer nroLista;
	private String agrupacion;
	private String listaInt;
	private Boolean tieneDip;
	private Boolean tieneLeg;
	private Boolean tieneCons;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNroLista() {
		return nroLista;
	}
	public void setNroLista(Integer nroLista) {
		this.nroLista = nroLista;
	}
	public Integer getOrden() {
		return orden;
	}
	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	public String getAgrupacion() {
		return agrupacion;
	}
	public void setAgrupacion(String agrupacion) {
		this.agrupacion = agrupacion;
	}
	public String getListaInt() {
		return listaInt;
	}
	public void setListaInt(String listaInt) {
		this.listaInt = listaInt;
	}
	public Boolean getTieneDip() {
		return tieneDip;
	}
	public void setTieneDip(Boolean tieneDip) {
		this.tieneDip = tieneDip;
	}
	public Boolean getTieneLeg() {
		return tieneLeg;
	}
	public void setTieneLeg(Boolean tieneLeg) {
		this.tieneLeg = tieneLeg;
	}
	public Boolean getTieneCons() {
		return tieneCons;
	}
	public void setTieneCons(Boolean tieneCons) {
		this.tieneCons = tieneCons;
	}
}

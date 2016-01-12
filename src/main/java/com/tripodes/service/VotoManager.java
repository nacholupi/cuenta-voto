package com.tripodes.service;

import java.util.List;

import com.tripodes.model.bean.Voto;

public interface VotoManager {

	public boolean save(Voto voto);

	public boolean saveAll(List<Voto> listVoto);
	
	public boolean delete(Voto voto);

	public Voto findById(Integer id);

	public List<Voto> getVotoList();
}

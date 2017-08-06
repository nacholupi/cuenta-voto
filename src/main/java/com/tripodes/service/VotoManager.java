package com.tripodes.service;

import java.util.List;

import com.tripodes.model.bean.Voto;

public interface VotoManager {

	boolean save(Voto voto);

	boolean saveAll(List<Voto> listVoto);
	
	boolean delete(Voto voto);

	Voto findById(Integer id);

	List<Voto> getVotoList();
}

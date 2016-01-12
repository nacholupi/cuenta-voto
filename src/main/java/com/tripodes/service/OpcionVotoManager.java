package com.tripodes.service;

import java.util.List;

import com.tripodes.model.bean.OpcionVoto;

public interface OpcionVotoManager {

	public boolean save(OpcionVoto opcionVoto);

	public boolean delete(OpcionVoto opcionVoto);

	public OpcionVoto findById(Integer id);

	public List<OpcionVoto> getOpcionVotoList();
}

package com.tripodes.service;

import java.util.List;

import com.tripodes.model.bean.OpcionVoto;

public interface OpcionVotoManager {

	boolean save(OpcionVoto opcionVoto);

	boolean delete(OpcionVoto opcionVoto);

	OpcionVoto findById(Integer id);

	List<OpcionVoto> getOpcionVotoList();
}

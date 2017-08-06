package com.tripodes.service;

import java.util.List;

import com.tripodes.model.bean.Mesa;

public interface MesaManager {

	boolean save(Mesa mesa);

	boolean delete(Mesa mesa);

	List<Mesa> getMesaList();
}

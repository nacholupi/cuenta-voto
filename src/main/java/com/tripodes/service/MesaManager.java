package com.tripodes.service;

import java.util.List;

import com.tripodes.model.bean.Mesa;

public interface MesaManager {

	public boolean save(Mesa mesa);

	public boolean delete(Mesa mesa);

	public Mesa findById(Integer id);

	public List<Mesa> getMesaList();
}

package com.tripodes.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.transaction.annotation.Transactional;

import com.tripodes.model.bean.Mesa;
import com.tripodes.model.dao.MesaDAO;

public class MesaManagerImpl implements MesaManager {

	private MesaDAO mesaDAO;

	public MesaDAO getMesaDAO() {
		return mesaDAO;
	}

	public void setMesaDAO(MesaDAO mesaDAO) {
		this.mesaDAO = mesaDAO;
	}

	@Transactional
	public boolean save(Mesa mesa) {
		try {
			mesaDAO.saveOrUpdate(mesa);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional
	public boolean delete(Mesa mesa) {
		try {
			mesaDAO.delete(mesa);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional(readOnly = true)
	public Mesa findById(Integer id) {
		try {
			return mesaDAO.find(Mesa.class, id);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Transactional(readOnly = true)
	public List<Mesa> getMesaList() {
		try {
			return mesaDAO.findAll(Mesa.class);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
	}
}

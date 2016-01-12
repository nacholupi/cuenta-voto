package com.tripodes.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.transaction.annotation.Transactional;

import com.tripodes.model.bean.OpcionVoto;
import com.tripodes.model.dao.OpcionVotoDAO;

public class OpcionVotoManagerImpl implements OpcionVotoManager {

	private OpcionVotoDAO opcionVotoDAO;

	public OpcionVotoDAO getOpcionVotoDAO() {
		return opcionVotoDAO;
	}

	public void setOpcionVotoDAO(OpcionVotoDAO opcionVotoDAO) {
		this.opcionVotoDAO = opcionVotoDAO;
	}

	@Transactional
	public boolean save(OpcionVoto opcionVoto) {
		try {
			opcionVotoDAO.saveOrUpdate(opcionVoto);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional
	public boolean delete(OpcionVoto opcionVoto) {
		try {
			opcionVotoDAO.delete(opcionVoto);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional(readOnly = true)
	public OpcionVoto findById(Integer id) {
		try {
			return opcionVotoDAO.find(OpcionVoto.class, id);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Transactional(readOnly = true)
	public List<OpcionVoto> getOpcionVotoList() {
		try {
			return opcionVotoDAO.findAll(OpcionVoto.class);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
	}
}

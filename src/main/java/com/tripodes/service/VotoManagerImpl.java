package com.tripodes.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.transaction.annotation.Transactional;

import com.tripodes.model.bean.Voto;
import com.tripodes.model.dao.VotoDAO;

public class VotoManagerImpl implements VotoManager {

	private VotoDAO votoDAO;

	public VotoDAO getVotoDAO() {
		return votoDAO;
	}

	public void setVotoDAO(VotoDAO votoDAO) {
		this.votoDAO = votoDAO;
	}

	@Transactional
	public boolean save(Voto voto) {
		try {
			votoDAO.saveOrUpdate(voto);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional
	public boolean saveAll(List<Voto> listVoto) {
		try {
			for (Voto voto : listVoto) {
				votoDAO.saveOrUpdate(voto);	
			}
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional
	public boolean delete(Voto voto) {
		try {
			votoDAO.delete(voto);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional(readOnly = true)
	public Voto findById(Integer id) {
		try {
			return votoDAO.find(Voto.class, id);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Transactional(readOnly = true)
	public List<Voto> getVotoList() {
		try {
			return votoDAO.findAll(Voto.class);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
	}
}

package com.tripodes.model.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tripodes.model.bean.Mesa;

public class MesaDAO extends HibernateDaoSupport {

	public void saveOrUpdate(Mesa mesa) throws DataAccessException {
		getHibernateTemplate().saveOrUpdate(mesa);
	}

	public void delete(Mesa mesa) throws DataAccessException {
		getHibernateTemplate().delete(mesa);
	}

	public Mesa find(Class<Mesa> clazz, Integer id) throws DataAccessException {
		return getHibernateTemplate().load(clazz, id);
	}

	@SuppressWarnings("unchecked")
	public List<Mesa> findAll(Class<Mesa> clazz) throws DataAccessException {
		return (List<Mesa>) getHibernateTemplate().find("from " + clazz.getName() );
	}
}

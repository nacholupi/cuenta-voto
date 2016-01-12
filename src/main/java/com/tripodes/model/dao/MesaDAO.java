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
		Mesa mesa = (Mesa) getHibernateTemplate().load(clazz, id);
		return mesa;
	}

	@SuppressWarnings("unchecked")
	public List<Mesa> findAll(Class<Mesa> clazz) throws DataAccessException {
		List<Mesa> list = getHibernateTemplate().find("from " + clazz.getName() );
		return list;
	}
}

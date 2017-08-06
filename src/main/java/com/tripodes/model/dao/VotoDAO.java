package com.tripodes.model.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tripodes.model.bean.Voto;

public class VotoDAO extends HibernateDaoSupport {

	public void saveOrUpdate(Voto voto) throws DataAccessException {
		getHibernateTemplate().saveOrUpdate(voto);
	}

	public void delete(Voto voto) throws DataAccessException {
		getHibernateTemplate().delete(voto);
	}

	public Voto find(Class<Voto> clazz, Integer id) throws DataAccessException {
		return getHibernateTemplate().load(clazz, id);
	}

	@SuppressWarnings("unchecked")
	public List<Voto> findAll(Class<Voto> clazz) throws DataAccessException {
		return (List<Voto>) getHibernateTemplate().find("from " + clazz.getName() );
	}
}

package com.tripodes.model.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tripodes.model.bean.OpcionVoto;

public class OpcionVotoDAO extends HibernateDaoSupport {

	public void saveOrUpdate(OpcionVoto opcionVoto) throws DataAccessException {
		getHibernateTemplate().saveOrUpdate(opcionVoto);
	}

	public void delete(OpcionVoto opcionVoto) throws DataAccessException {
		getHibernateTemplate().delete(opcionVoto);
	}

	public OpcionVoto find(Class<OpcionVoto> clazz, Integer id) throws DataAccessException {
		return getHibernateTemplate().load(clazz, id);
	}

	@SuppressWarnings("unchecked")
	public List<OpcionVoto> findAll(Class<OpcionVoto> clazz) throws DataAccessException {
		return (List<OpcionVoto>) getHibernateTemplate().find("from " + clazz.getName() + " order by orden" );
	}
}

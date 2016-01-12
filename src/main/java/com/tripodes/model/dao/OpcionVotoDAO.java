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
		OpcionVoto opcionVoto = (OpcionVoto) getHibernateTemplate().load(clazz, id);
		return opcionVoto;
	}

	@SuppressWarnings("unchecked")
	public List<OpcionVoto> findAll(Class<OpcionVoto> clazz) throws DataAccessException {
		List<OpcionVoto> list = getHibernateTemplate().find("from " + clazz.getName() + " order by orden" );
		return list;
	}
}

package com.tripodes.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

@SuppressWarnings({ "rawtypes", "unchecked" })
public class ReportesDAO {

	private static final String CONCEJALES_PARTIDO = "select cantidad, agrupacion from v_consejales_partido order by cantidad asc";
	private static final String CONCEJALES_LISTINT = "select cantidad, lista from v_consejales_listaint order by cantidad asc";
	private static final String FPV_LOCALIDAD = "select localidad, cantidad from sistemavotacion.v_fpv_por_localidad";
	private static final String COCIENTE_ELECTORAL = "CALL cociente_electoral()";
	private static final String PRINCIPALES_POR_LOCALIDAD = "select id_agrup, localidad, cantidad from sistemavotacion.v_consejales_localidad_reduc";
	private static final String PORC_ESCRUTADO = "select f_porcentaje_escrutado() from dual";

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session session() {
		return getSessionFactory().getCurrentSession();
	}

	protected SQLQuery createSQLQuery(String queryStr) {
		SQLQuery query = session().createSQLQuery(queryStr);
		return query;
	}

	public List concejalesPorPartido() {
		SQLQuery query = createSQLQuery(CONCEJALES_PARTIDO);
		return query.list();
	}

	public List concejalesPorLista() {
		SQLQuery query = createSQLQuery(CONCEJALES_LISTINT);
		return query.list();
	}

	public List fpvPorLocalidad() {
		SQLQuery query = createSQLQuery(FPV_LOCALIDAD);
		return query.list();
	}

	public List bancasPorLista() {
		SQLQuery query = createSQLQuery(COCIENTE_ELECTORAL);
		return query.list();
	}

	public Object[] princPorLocalidad() {
		SQLQuery query = createSQLQuery(PRINCIPALES_POR_LOCALIDAD);
		return toListaIntSeries(query.list());
	}
	
	public Object porcEscrutado() {
		SQLQuery query = createSQLQuery(PORC_ESCRUTADO);
		return query.uniqueResult();
	}

	private Object[] toListaIntSeries(List<Object[]> listOrigen) {
		
		Object[] arrayResult = new Object[4];
		for (int i = 0; i < arrayResult.length; i++) {
			arrayResult[i] = new ArrayList();
		}
		
		for (Object[] row : listOrigen) {
			int index = 0;
			
			switch ((Integer) row[0]) {
			case 9:
				index = 0;
				break;
			case 10:
				index = 1;
				break;
			case 12:
				index = 2;
				break;
			case 13:
				index = 3;
				break;
			default:
				throw new RuntimeException();
			}
			((List)arrayResult[index]).add(new Object[]{row[1], row[2]});
		}
		return arrayResult;

	}
}

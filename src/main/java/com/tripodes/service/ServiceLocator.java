package com.tripodes.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.zkoss.zkplus.spring.SpringUtil;

public class ServiceLocator {

	private ServiceLocator() {
	}

	public static Session getHibernateSession() {
		return ((SessionFactory) SpringUtil.getBean("sessionFactory",
				SessionFactory.class)).getCurrentSession();
	}

	public static OpcionVotoManager getOpcionVotoManager() {
		return (OpcionVotoManager) SpringUtil.getBean("opcionVotoManager",
				OpcionVotoManager.class);
	}

	public static VotoManager getVotoManager() {
		return (VotoManager) SpringUtil.getBean("votoManager",
				VotoManager.class);
	}
	
	public static MesaManager getMesaManager() {
		return (MesaManager) SpringUtil.getBean("mesaManager",
				MesaManager.class);
	}

}

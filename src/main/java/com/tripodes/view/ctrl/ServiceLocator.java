package com.tripodes.view.ctrl;

import com.tripodes.service.MesaManager;
import com.tripodes.service.OpcionVotoManager;
import com.tripodes.service.VotoManager;
import org.zkoss.zkplus.spring.SpringUtil;

public class ServiceLocator {

	private ServiceLocator() {
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

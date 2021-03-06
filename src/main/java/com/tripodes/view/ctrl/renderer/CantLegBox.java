package com.tripodes.view.ctrl.renderer;

import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;

import com.tripodes.model.bean.VotoView;

public class CantLegBox extends CantBox {

	private static final long serialVersionUID = 1L;

	public CantLegBox(final VotoView votoView) {
		super();
		super.setDisabled(!votoView.getTieneLeg());
		super.addEventListener(Events.ON_CHANGE, new EventListener() {
			public void onEvent(Event event) throws Exception {
				votoView.setCantLegislador(getValue());
			}
		});
	}
}
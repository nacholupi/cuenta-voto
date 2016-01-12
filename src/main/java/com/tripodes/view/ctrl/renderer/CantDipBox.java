package com.tripodes.view.ctrl.renderer;

import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;

import com.tripodes.model.bean.VotoView;

public class CantDipBox extends CantBox {

	private static final long serialVersionUID = 1L;

	public CantDipBox(final VotoView votoView) {
		super();
		super.setDisabled(!votoView.getTieneDip());
		super.addEventListener(Events.ON_CHANGE, new EventListener() {
			public void onEvent(Event event) throws Exception {
				votoView.setCantDiputado(getValue());
			}
		});
	}
}
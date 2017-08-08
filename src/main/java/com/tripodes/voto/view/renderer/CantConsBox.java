package com.tripodes.voto.view.renderer;

import com.tripodes.voto.view.VotoView;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;

public class CantConsBox extends CantBox {

    private static final long serialVersionUID = 1L;

    public CantConsBox(final VotoView votoView) {
        super(!votoView.getTieneCons());
        super.addEventListener(Events.ON_CHANGE, new EventListener() {
            public void onEvent(Event event) throws Exception {
                votoView.setCantConsejal(getValue());
            }
        });
    }
}
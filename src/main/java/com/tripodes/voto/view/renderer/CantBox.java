package com.tripodes.voto.view.renderer;

import org.zkoss.zul.Intbox;

public class CantBox extends Intbox {

    private static final long serialVersionUID = 1L;

    public CantBox(final boolean disabled) {
        super();
        super.setDisabled(disabled);
        super.setConstraint("no empty, no negative:Campo Obligatorio");
    }
}
package com.tripodes.voto.view.renderer;

import org.zkoss.zul.Intbox;

public class CantBox extends Intbox {

    private static final long serialVersionUID = 1L;

    public CantBox() {
        super();
        super.setConstraint("no empty, no negative:Campo Obligatorio");
    }
}
package com.tripodes.voto.view.renderer;

import com.tripodes.voto.view.VotoView;
import org.zkoss.zul.Label;
import org.zkoss.zul.Row;
import org.zkoss.zul.RowRenderer;

public class VotoViewRowRenderer implements RowRenderer {

    @Override
    public void render(Row row, Object data) throws Exception {
        VotoView votoView = (VotoView) data;
        row.appendChild(new Label(votoView.getNroListaStr()));
        row.appendChild(new Label(votoView.getAgrupacion()));
        row.appendChild(new Label(votoView.getListaInt()));
        row.appendChild(new CantSenadorBox(votoView));
        row.appendChild(new CantDipBox(votoView));
        row.appendChild(new CantLegBox(votoView));
        row.appendChild(new CantConsBox(votoView));
    }
}
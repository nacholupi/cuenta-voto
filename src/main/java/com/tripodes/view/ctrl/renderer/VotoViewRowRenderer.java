package com.tripodes.view.ctrl.renderer;

import org.zkoss.zul.Label;
import org.zkoss.zul.Row;
import org.zkoss.zul.RowRenderer;

import com.tripodes.model.bean.VotoView;

public class VotoViewRowRenderer implements RowRenderer {

	@Override
	public void render(Row row, Object data) throws Exception {
		VotoView votoView = (VotoView) data;
		row.appendChild(new Label(votoView.getNroListaStr()));
		row.appendChild(new Label(votoView.getAgrupacion()));
		row.appendChild(new CantDipBox(votoView));
		row.appendChild(new CantLegBox(votoView));
		row.appendChild(new CantConsBox(votoView));
	}
}
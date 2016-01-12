package com.tripodes.view.ctrl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.zkoss.util.resource.Labels;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.util.GenericForwardComposer;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.Label;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.api.Grid;
import org.zkoss.zul.impl.api.InputElement;

import com.tripodes.model.bean.Mesa;
import com.tripodes.model.bean.OpcionVoto;
import com.tripodes.model.bean.Voto;
import com.tripodes.model.bean.VotoView;
import com.tripodes.model.converter.VotoConverter;
import com.tripodes.service.ServiceLocator;
import com.tripodes.service.VotoManager;
import com.tripodes.view.ctrl.renderer.CantBox;

public class VotacionCtrl extends GenericForwardComposer {

	private static final long serialVersionUID = 20111130143824L;

	private static final List<OpcionVoto> listOpVoto = ServiceLocator
			.getOpcionVotoManager().getOpcionVotoList();

	private static final List<Mesa> listMesa = ServiceLocator.getMesaManager()
			.getMesaList();

	private VotoManager votoManager = ServiceLocator.getVotoManager();

	private ListModel listaVotos;
	private Integer idMesa;
	private Grid gridOpVoto;
	private Intbox mesaBox;
	private Label descripMesa;

	@Override
	public void doAfterCompose(Component comp) throws Exception {
		super.doAfterCompose(comp);
		listaVotos = new ListModelList(VotoConverter.toListVotoView(listOpVoto));
		gridOpVoto.setModel(listaVotos);
	}

	public ListModel getListaVotos() {
		return listaVotos;
	}

	public void setListaVotos(ListModel listaVotos) {
		this.listaVotos = listaVotos;
	}

	public Integer getIdMesa() {
		return idMesa;
	}

	public void setIdMesa(Integer idMesa) {
		this.idMesa = idMesa;
	}

	@SuppressWarnings("unchecked")
	public void onClick$guardar() throws InterruptedException {
		// Checkeo si existe la idMesa
		Mesa mesa = mesaValida();
		// Checkeo que esten cargados todos las cantidades habilitadas
		checkCantBox(gridOpVoto);

		List<Voto> votos = fillListVoto(((ListModelList) listaVotos).getInnerList(),
				idMesa);

		popUpSubmit(votos, mesa);
	}

	public void onChange$mesaBox() {
		// mesaValida nunca es nulo - hay WrongValueException antes
		descripMesa.setValue(mesaValida().getDescripcion());
	}

	private Mesa mesaValida() {
		Mesa mesa = getFromListMesa(idMesa);
		if (idMesa == null || mesa == null) {
			throw new WrongValueException(this.mesaBox,
					Labels.getLabel("votacion.validacion.mesa"));
		}
		return mesa;
	}

	private static List<Voto> fillListVoto(List<VotoView> listview, Integer idMesa) {
		List<Voto> listResult = new ArrayList<Voto>();
		Timestamp time = new Timestamp(Calendar.getInstance().getTime().getTime());
		for (VotoView votoView : listview) {
			Voto voto = VotoConverter.toVoto(votoView);
			voto.setIdMesa(idMesa);
			// FIXME HARDCODE!!!
			voto.setIdUsuario(1);
			voto.setFechaAlta(time);
			listResult.add(voto);
		}
		return listResult;
	}

	private void popUpSubmit(final List<Voto> listaVoto, final Mesa mesa)
			throws InterruptedException {

		int totalDip = 0;
		int totalLeg = 0;
		int totalCons = 0;

		for (Voto voto : listaVoto) {
			totalDip += voto.getCantDiputado();
			totalLeg += voto.getCantLegislador();
			totalCons += voto.getCantConsejal();
		}

		String mensaje = String.format(Labels.getLabel("votacion.warning.verifTotales"),
				mesa.getId(), totalDip, totalLeg, totalCons);
		Messagebox.show(mensaje, Labels.getLabel("votacion.titulo.confirmacion"),
				Messagebox.YES | Messagebox.NO, Messagebox.QUESTION, new EventListener() {
					public void onEvent(Event evt) throws InterruptedException {
						switch (((Integer) evt.getData()).intValue()) {
						case Messagebox.YES:
							// GUARDAR!
							contProcesoSubmit(listaVoto);
							break;
						case Messagebox.NO:
							break;
						}
					}
				});
	}

	private void contProcesoSubmit(List<Voto> votos) {
		votoManager.saveAll(votos);
		Executions.sendRedirect(Labels.getLabel("votacion.redirect.votacion"));
	}

	@SuppressWarnings("unchecked")
	private void checkCantBox(Component component) {
		checkIsValid(component);
		List<Component> children = component.getChildren();
		for (Component each : children) {
			checkCantBox(each);
		}
	}

	private void checkIsValid(Component component) {
		if (component instanceof InputElement) {
			if (component instanceof CantBox && !((CantBox) component).isDisabled()) {
				// Force show errorMessage
				((CantBox) component).getValue();
			}
		}
	}

	private Mesa getFromListMesa(Integer idMesa) {
		if (idMesa != null) {
			for (Mesa mesa : listMesa) {
				if (mesa.getId().equals(idMesa))
					return mesa;
			}
		}
		return null;
	}
}

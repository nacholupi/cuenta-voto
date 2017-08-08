package com.tripodes.voto.view;

import com.tripodes.voto.core.EleccionService;
import com.tripodes.voto.core.Mesa;
import com.tripodes.voto.core.OpcionVoto;
import com.tripodes.voto.core.Voto;
import com.tripodes.voto.view.renderer.CantBox;
import org.zkoss.util.resource.Labels;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.util.GenericForwardComposer;
import org.zkoss.zkplus.spring.SpringUtil;
import org.zkoss.zul.*;
import org.zkoss.zul.api.Grid;
import org.zkoss.zul.impl.api.InputElement;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class VotacionCtrl extends GenericForwardComposer {

    private static final long serialVersionUID = 20111130143824L;

    private static EleccionService eleccionService = (EleccionService) SpringUtil.getBean("eleccionService",
            EleccionService.class);

    private static final List<OpcionVoto> listOpVoto = eleccionService.getOpcionVotoList();

    private static final List<Mesa> listMesa = eleccionService.getMesaList();

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

        int totalSen = 0;
        int totalDip = 0;
        int totalLeg = 0;
        int totalCons = 0;

        for (Voto voto : listaVoto) {
            totalSen += voto.getCantSenador();
            totalDip += voto.getCantDiputado();
            totalLeg += voto.getCantLegislador();
            totalCons += voto.getCantConsejal();
        }

        String mensaje = String.format(Labels.getLabel("votacion.warning.verifTotales"),
                mesa.getId(), totalSen, totalDip, totalLeg, totalCons);
        Messagebox.show(mensaje, Labels.getLabel("votacion.titulo.confirmacion"),
                Messagebox.YES | Messagebox.NO, Messagebox.QUESTION, new EventListener() {
                    public void onEvent(Event evt) throws InterruptedException {
                        switch ((Integer) evt.getData()) {
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
        eleccionService.saveVotos(votos);
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

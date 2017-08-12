package com.tripodes.voto.core;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class VotoConverter {

    private VotoConverter() {
    }

    public static List<VotoView> toVotoViewList(List<Boleta> listOpVoto) {
        List<VotoView> listResult = new ArrayList<VotoView>();
        for (Boleta opcionVoto : listOpVoto) {
            listResult.add(toVotoView(opcionVoto));
        }
        return listResult;
    }

    public static VotoView toVotoView(Boleta opVoto) {
        VotoView votoView = new VotoView();
        votoView.setIdOpcionVoto(opVoto.getId());
        votoView.setAgrupacion(opVoto.getAgrupacion());
        votoView.setListaInt(opVoto.getListaInt());
        votoView.setNroLista(opVoto.getNroLista());
        votoView.setTieneSenador(opVoto.getTieneSenador());
        votoView.setTieneCons(opVoto.getTieneCons());
        votoView.setTieneDip(opVoto.getTieneDip());
        votoView.setTieneLeg(opVoto.getTieneLeg());
        return votoView;
    }

    public static List<Voto> toVotoList(List<VotoView> listVotoView, Integer mesaId) {
        Timestamp time = new Timestamp(Calendar.getInstance().getTime().getTime());
        List<Voto> listResult = new ArrayList<Voto>();
        for (VotoView votoView : listVotoView) {
            Voto voto = VotoConverter.toVoto(votoView, time, mesaId);
            listResult.add(voto);
        }
        return listResult;
    }

    private static Voto toVoto(VotoView votoView, Timestamp fechaAlta, Integer mesaId) {
        Voto voto = new Voto();
        voto.setCantSenador(votoView.getCantSenador());
        voto.setCantConsejal(votoView.getCantConsejal());
        voto.setCantDiputado(votoView.getCantDiputado());
        voto.setCantLegislador(votoView.getCantLegislador());
        voto.setIdOpcionVoto(votoView.getIdOpcionVoto());
        voto.setIdMesa(mesaId);
        voto.setIdUsuario(1);
        voto.setFechaAlta(fechaAlta);
        return voto;
    }
}
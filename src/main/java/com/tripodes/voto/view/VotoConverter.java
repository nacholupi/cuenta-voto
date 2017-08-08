package com.tripodes.voto.view;

import com.tripodes.voto.core.OpcionVoto;
import com.tripodes.voto.core.Voto;

import java.util.ArrayList;
import java.util.List;

public class VotoConverter {

    private VotoConverter() {
    }

    public static List<VotoView> toListVotoView(List<OpcionVoto> listOpVoto) {
        List<VotoView> listResult = new ArrayList<VotoView>();
        for (OpcionVoto opcionVoto : listOpVoto) {
            listResult.add(toVotoView(opcionVoto));
        }
        return listResult;
    }

    public static VotoView toVotoView(OpcionVoto opVoto) {
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

    public static Voto toVoto(VotoView votoView) {
        Voto voto = new Voto();
        voto.setCantSenador(votoView.getCantSenador() == null ? 0 : votoView.getCantSenador());
        voto.setCantConsejal(votoView.getCantConsejal() == null ? 0 : votoView.getCantConsejal());
        voto.setCantDiputado(votoView.getCantDiputado() == null ? 0 : votoView.getCantDiputado());
        voto.setCantLegislador(votoView.getCantLegislador() == null ? 0 : votoView.getCantLegislador());
        voto.setIdOpcionVoto(votoView.getIdOpcionVoto());
        return voto;
    }
}
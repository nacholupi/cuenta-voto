package com.tripodes.voto.core;

import com.tripodes.voto.core.exception.InvalidAmountException;

import java.util.ArrayList;
import java.util.List;

public class EscrutinioSimplificadoHelper {

    private static final Integer ID_VOTOS_OTROS = 99;
    private static final Integer ID_VOTOS_INVALIDOS = 98;
    private static final Integer ID_TOTAL_A_AGRUPACIONES = -21;
    private static final Integer ID_TOTAL_X_COLUMNAS = -22;
    private static final String TOTAL_A_AGRUPACIONES = "TOTAL VOTOS A AGRUPACIONES POLITICAS";
    private static final String TOTAL_X_COLUMNAS = "TOTAL POR COLUMNAS";

    public static List<VotoView> modificarATotales(List<VotoView> listaConBoletaAgrupada) {
        removeById(listaConBoletaAgrupada, ID_VOTOS_OTROS);
        removeById(listaConBoletaAgrupada, ID_VOTOS_INVALIDOS);
        listaConBoletaAgrupada.add(createTotalVotoView(ID_TOTAL_A_AGRUPACIONES, TOTAL_A_AGRUPACIONES));
        listaConBoletaAgrupada.add(createTotalVotoView(ID_TOTAL_X_COLUMNAS, TOTAL_X_COLUMNAS));
        return listaConBoletaAgrupada;
    }

    public static List<VotoView> modificarABoletaAgrupada(List<VotoView> listaConTotales)
            throws InvalidAmountException {
        List<VotoView> resultado = new ArrayList<VotoView>(listaConTotales);
        VotoView totalXAgrupacion = removeById(resultado, ID_TOTAL_A_AGRUPACIONES);
        VotoView totales = removeById(resultado, ID_TOTAL_X_COLUMNAS);
        VotoView otrosPartidos = calcularOtrosPartidos(resultado, totalXAgrupacion);
        VotoView votosInvalidos = calcularInvalidos(totales, totalXAgrupacion);
        resultado.add(otrosPartidos);
        resultado.add(votosInvalidos);
        return resultado;
    }

    private static VotoView calcularInvalidos(VotoView totales, VotoView totalXAgrupacion)
            throws InvalidAmountException {
        int totalSen = totales.getCantSenador() - totalXAgrupacion.getCantSenador();
        int totalDip = totales.getCantDiputado() - totalXAgrupacion.getCantDiputado();
        int totalLeg = totales.getCantLegislador() - totalXAgrupacion.getCantLegislador();
        int totalCons = totales.getCantConsejal() - totalXAgrupacion.getCantConsejal();

        if (hasInvalidAmounts(totalSen, totalDip, totalLeg, totalCons)) {
            throw new InvalidAmountException(TOTAL_X_COLUMNAS);
        }

        return createTotalVotoView(ID_VOTOS_INVALIDOS, null, totalSen, totalDip, totalLeg, totalCons);
    }

    private static VotoView calcularOtrosPartidos(List<VotoView> listaConTotales, VotoView totalXAgrupacion)
            throws InvalidAmountException {
        int otrosSen = totalXAgrupacion.getCantSenador();
        int otrosDip = totalXAgrupacion.getCantDiputado();
        int otrosLeg = totalXAgrupacion.getCantLegislador();
        int otrosCons = totalXAgrupacion.getCantConsejal();

        for (VotoView voto : listaConTotales) {
            otrosSen -= voto.getCantSenador();
            otrosDip -= voto.getCantDiputado();
            otrosLeg -= voto.getCantLegislador();
            otrosCons -= voto.getCantConsejal();
        }

        if (hasInvalidAmounts(otrosSen, otrosDip, otrosLeg, otrosCons)) {
            throw new InvalidAmountException(TOTAL_A_AGRUPACIONES);
        }

        return createTotalVotoView(ID_VOTOS_OTROS, null, otrosSen, otrosDip, otrosLeg, otrosCons);
    }

    private static boolean hasInvalidAmounts(int cantSen, int cantDip, int cantLeg, int cantCons) {
        return (cantSen < 0) || (cantDip < 0) || (cantLeg < 0) || (cantCons < 0);
    }


    private static VotoView removeById(List<VotoView> listaConTotales, Integer idVoto) {
        for (VotoView votoView : listaConTotales) {
            if (idVoto.equals(votoView.getIdOpcionVoto())) {
                listaConTotales.remove(votoView);
                return votoView;
            }
        }
        return null;
    }

    private static VotoView createTotalVotoView(Integer idOpcionVoto, String agrupacion) {
        return createTotalVotoView(idOpcionVoto, agrupacion, 0, 0, 0, 0);
    }

    private static VotoView createTotalVotoView(Integer idOpcionVoto, String agrupacion, int cantSenador,
                                                int cantDiputado, int cantLegislador, int cantConsejal) {
        VotoView votoView = new VotoView();
        votoView.setIdOpcionVoto(idOpcionVoto);
        votoView.setNroLista(0);
        votoView.setAgrupacion(agrupacion);
        votoView.setTieneSenador(Boolean.TRUE);
        votoView.setTieneDip(Boolean.TRUE);
        votoView.setTieneLeg(Boolean.TRUE);
        votoView.setTieneCons(Boolean.TRUE);
        votoView.setCantSenador(cantSenador);
        votoView.setCantDiputado(cantDiputado);
        votoView.setCantLegislador(cantLegislador);
        votoView.setCantConsejal(cantConsejal);
        return votoView;
    }
}

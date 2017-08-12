package com.tripodes.voto.core;

import java.io.Serializable;

public class VotoView implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer idOpcionVoto;
    private Integer nroLista;
    private String agrupacion;
    private String listaInt;
    private Boolean tieneSenador;
    private Boolean tieneDip;
    private Boolean tieneLeg;
    private Boolean tieneCons;

    private int cantSenador;
    private int cantDiputado;
    private int cantLegislador;
    private int cantConsejal;

    public Integer getIdOpcionVoto() {
        return idOpcionVoto;
    }

    public void setIdOpcionVoto(Integer idOpcionVoto) {
        this.idOpcionVoto = idOpcionVoto;
    }

    public int getCantDiputado() {
        return cantDiputado;
    }

    public void setCantDiputado(int cantDiputado) {
        this.cantDiputado = cantDiputado;
    }

    public int getCantLegislador() {
        return cantLegislador;
    }

    public void setCantLegislador(int cantLegislador) {
        this.cantLegislador = cantLegislador;
    }

    public int getCantConsejal() {
        return cantConsejal;
    }

    public void setCantConsejal(int cantConsejal) {
        this.cantConsejal = cantConsejal;
    }

    public Integer getNroLista() {
        return nroLista;
    }

    public void setNroLista(Integer nroLista) {
        this.nroLista = nroLista;
    }

    public String getAgrupacion() {
        return agrupacion;
    }

    public void setAgrupacion(String agrupacion) {
        this.agrupacion = agrupacion;
    }

    public String getListaInt() {
        return listaInt;
    }

    public void setListaInt(String listaInt) {
        this.listaInt = listaInt;
    }

    public Boolean getTieneDip() {
        return tieneDip;
    }

    public void setTieneDip(Boolean tieneDip) {
        this.tieneDip = tieneDip;
    }

    public Boolean getTieneLeg() {
        return tieneLeg;
    }

    public void setTieneLeg(Boolean tieneLeg) {
        this.tieneLeg = tieneLeg;
    }

    public Boolean getTieneCons() {
        return tieneCons;
    }

    public void setTieneCons(Boolean tieneCons) {
        this.tieneCons = tieneCons;
    }

    public Boolean getTieneSenador() {
        return tieneSenador;
    }

    public void setTieneSenador(Boolean tieneSenador) {
        this.tieneSenador = tieneSenador;
    }

    public int getCantSenador() {
        return cantSenador;
    }

    public void setCantSenador(int cantSenador) {
        this.cantSenador = cantSenador;
    }

    public String getNroListaStr() {
        if (getNroLista() > 0) {
            return getNroLista().toString();
        } else
            return null;
    }
}

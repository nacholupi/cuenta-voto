package com.tripodes.voto.view;

import java.io.Serializable;

public class VotoView implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer idOpcionVoto;
    private Integer nroLista;
    private String agrupacion;
    private String listaInt;
    private Boolean tieneDip;
    private Boolean tieneLeg;
    private Boolean tieneCons;

    private Integer cantDiputado;
    private Integer cantLegislador;
    private Integer cantConsejal;

    public Integer getIdOpcionVoto() {
        return idOpcionVoto;
    }

    public void setIdOpcionVoto(Integer idOpcionVoto) {
        this.idOpcionVoto = idOpcionVoto;
    }

    public Integer getCantDiputado() {
        return cantDiputado;
    }

    public void setCantDiputado(Integer cantDiputado) {
        this.cantDiputado = cantDiputado;
    }

    public Integer getCantLegislador() {
        return cantLegislador;
    }

    public void setCantLegislador(Integer cantLegislador) {
        this.cantLegislador = cantLegislador;
    }

    public Integer getCantConsejal() {
        return cantConsejal;
    }

    public void setCantConsejal(Integer cantConsejal) {
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

    public String getNroListaStr() {
        if (getNroLista() > 0) {
            return getNroLista().toString();
        } else
            return null;
    }
}

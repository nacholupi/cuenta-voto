package com.tripodes.voto.core;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity(name = "opcionvoto")
public class OpcionVoto implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    @Column(name = "idopcionvoto")
    private Integer id;
    private Integer orden;
    @Column(name = "nrolista")
    private Integer nroLista;
    private String agrupacion;
    @Column(name = "listaint")
    private String listaInt;
    @Column(name = "tienediputado")
    private Boolean tieneDip;
    @Column(name = "tienelegislador")
    private Boolean tieneLeg;
    @Column(name = "tieneconsejal")
    private Boolean tieneCons;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNroLista() {
        return nroLista;
    }

    public void setNroLista(Integer nroLista) {
        this.nroLista = nroLista;
    }

    public Integer getOrden() {
        return orden;
    }

    public void setOrden(Integer orden) {
        this.orden = orden;
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
}

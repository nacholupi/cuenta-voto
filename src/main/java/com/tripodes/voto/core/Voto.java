package com.tripodes.voto.core;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
public class Voto implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    @Column(name = "idvoto")
    private Integer id;
    @Column(name = "idmesa")
    private Integer idMesa;
    @Column(name = "idopcionvoto")
    private Integer idOpcionVoto;
    @Column(name = "idusuario")
    private Integer idUsuario;
    @Column(name = "cantsenador")
    private Integer cantSenador;
    @Column(name = "cantdiputado")
    private Integer cantDiputado;
    @Column(name = "cantlegislador")
    private Integer cantLegislador;
    @Column(name = "cantconsejal")
    private Integer cantConsejal;
    @Column(name = "fecha")
    private Timestamp fechaAlta;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdMesa() {
        return idMesa;
    }

    public void setIdMesa(Integer idMesa) {
        this.idMesa = idMesa;
    }

    public Integer getIdOpcionVoto() {
        return idOpcionVoto;
    }

    public void setIdOpcionVoto(Integer idOpcionVoto) {
        this.idOpcionVoto = idOpcionVoto;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
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

    public Timestamp getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(Timestamp fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public Integer getCantSenador() {
        return cantSenador;
    }

    public void setCantSenador(Integer cantSenador) {
        this.cantSenador = cantSenador;
    }
}

package com.tripodes.voto.core;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public class Mesa implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    @Column(name = "idmesa")
    private Integer id;
    private String descripcion;
    @Column(name = "cantidadvotantes")
    private Integer cantVotantes;
    @Column(name = "idcircuito")
    private Integer idCircuito;

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getCantVotantes() {
        return cantVotantes;
    }

    public void setCantVotantes(Integer cantVotantes) {
        this.cantVotantes = cantVotantes;
    }

    public Integer getIdCircuito() {
        return idCircuito;
    }

    public void setIdCircuito(Integer idCircuito) {
        this.idCircuito = idCircuito;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}

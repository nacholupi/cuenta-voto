package com.tripodes.voto.core;

import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Component
public class ReportsRepository {

    private static final String CONCEJALES_PARTIDO = "select cantidad, agrupacion from v_consejales_partido order by cantidad asc";
    private static final String COCIENTE_ELECTORAL = "CALL cociente_electoral()";
    private static final String PORC_ESCRUTADO = "select f_porcentaje_escrutado() from dual";

    @PersistenceContext
    private EntityManager em;


    protected Query createQuery(String queryStr) {
        return em.createNativeQuery(queryStr);
    }

    public List concejalesPorPartido() {
        Query query = createQuery(CONCEJALES_PARTIDO);
        return query.getResultList();
    }

    public List bancasPorLista() {
        Query query = createQuery(COCIENTE_ELECTORAL);
        return query.getResultList();
    }

    public Object porcEscrutado() {
        Query query = createQuery(PORC_ESCRUTADO);
        return query.getSingleResult();
    }
}

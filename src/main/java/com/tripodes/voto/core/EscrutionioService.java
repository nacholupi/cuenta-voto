package com.tripodes.voto.core;

import com.tripodes.voto.core.exception.ForeignKeyException;
import com.tripodes.voto.core.exception.InvalidAmountException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.tripodes.voto.core.EscrutinioSimplificadoHelper.modificarABoletaAgrupada;
import static com.tripodes.voto.core.EscrutinioSimplificadoHelper.modificarATotales;
import static com.tripodes.voto.core.VotoConverter.toVotoList;
import static com.tripodes.voto.core.VotoConverter.toVotoViewList;

@Service
public class EscrutionioService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EscrutionioService.class);

    private VotoRepository votoRepository;
    private List<Boleta> boletasCacheadas;
    private Iterable<Mesa> mesasCacheadas;

    @Autowired
    public EscrutionioService(BoletaRepository boletaRepository, MesaRepository mesaRepository,
                              VotoRepository votoRepository) {
        this.boletasCacheadas = boletaRepository.findAllByOrderByOrdenAsc();
        this.mesasCacheadas = mesaRepository.findAll();
        this.votoRepository = votoRepository;
    }

    public List<VotoView> getVotoViewList() {
        LOGGER.info("Boletas cacheadas - cantidad " + boletasCacheadas.size());
        List<VotoView> votoViews = toVotoViewList(boletasCacheadas);
        return modificarATotales(votoViews);
    }

    public List<Mesa> getMesaList() {
        List<Mesa> mesas = makeCollection(mesasCacheadas);
        LOGGER.info("Mesas cacheadas - cantidad " + mesas.size());
        return mesas;
    }

    public boolean saveVotos(List<VotoView> listVoto, Integer mesaId)
            throws InvalidAmountException, ForeignKeyException {
        LOGGER.info("Salvando votos - cantidad " + listVoto.size() + " - mesa " + mesaId);
        List<VotoView> votoViews = modificarABoletaAgrupada(listVoto);
        List<Voto> votos = toVotoList(votoViews, mesaId);
        save(votos);
        LOGGER.info("Votos salvados - cantidad " + votos.size());
        LOGGER.info("Votos:  " + votos.toString());
        return true;
    }

    private void save(List<Voto> votos) throws ForeignKeyException {
        try {
            votoRepository.save(votos);
        } catch (DataIntegrityViolationException e) {
            throw new ForeignKeyException(e);
        }
    }

    private static <E> List<E> makeCollection(Iterable<E> iter) {
        List<E> list = new ArrayList<E>();
        for (E item : iter) {
            list.add(item);
        }
        return list;
    }
}

package com.tripodes.voto.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.tripodes.voto.core.EscrutinioSimplificadoHelper.modificarABoletaAgrupada;
import static com.tripodes.voto.core.EscrutinioSimplificadoHelper.modificarATotales;
import static com.tripodes.voto.core.VotoConverter.toVotoList;
import static com.tripodes.voto.core.VotoConverter.toVotoViewList;

@Service
public class EscrutionioService {

    private BoletaRepository boletaRepository;
    private MesaRepository mesaRepository;
    private VotoRepository votoRepository;

    @Autowired
    public EscrutionioService(BoletaRepository boletaRepository, MesaRepository mesaRepository,
                              VotoRepository votoRepository) {
        this.boletaRepository = boletaRepository;
        this.mesaRepository = mesaRepository;
        this.votoRepository = votoRepository;
    }

    public List<VotoView> getVotoViewList() {
        List<Boleta> boletas = boletaRepository.findAllByOrderByOrdenAsc();
        List<VotoView> votoViews = toVotoViewList(boletas);
        return modificarATotales(votoViews);
    }

    public List<Mesa> getMesaList() {
        return makeCollection(mesaRepository.findAll());
    }

    public boolean saveVotos(List<VotoView> listVoto, Integer mesaId) {
        List<VotoView> votoViews = modificarABoletaAgrupada(listVoto);
        List<Voto> votos = toVotoList(votoViews, mesaId);
        votoRepository.save(votos);
        return true;
    }

    private static <E> List<E> makeCollection(Iterable<E> iter) {
        List<E> list = new ArrayList<E>();
        for (E item : iter) {
            list.add(item);
        }
        return list;
    }
}

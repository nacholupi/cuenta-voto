package com.tripodes.voto.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EleccionService {

    private OpcionVotoRepository opcionVotoRepository;
    private MesaRepository mesaRepository;
    private VotoRepository votoRepository;

    @Autowired
    public EleccionService(OpcionVotoRepository opcionVotoRepository, MesaRepository mesaRepository,
                           VotoRepository votoRepository) {
        this.opcionVotoRepository = opcionVotoRepository;
        this.mesaRepository = mesaRepository;
        this.votoRepository = votoRepository;
    }

    public List<OpcionVoto> getOpcionVotoList() {
        return makeCollection(opcionVotoRepository.findAll());
    }

    public List<Mesa> getMesaList() {
        return makeCollection(mesaRepository.findAll());

    }

    public boolean saveVotos(List<Voto> listVoto) {
        votoRepository.save(listVoto);
        return true;

    }

    public static <E> List<E> makeCollection(Iterable<E> iter) {
        List<E> list = new ArrayList<E>();
        for (E item : iter) {
            list.add(item);
        }
        return list;
    }
}

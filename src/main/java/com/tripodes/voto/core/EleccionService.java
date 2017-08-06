package com.tripodes.voto.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EleccionService {

    private OpcionVotoRepository opcionVotoRepository;
    private MesaRepository mesaRepository;
    private VotoRepository votoRepository;

    @Autowired
    public void setOpcionVotoRepository(OpcionVotoRepository opcionVotoRepository) {
        this.opcionVotoRepository = opcionVotoRepository;
    }

    @Autowired
    public void setMesaRepository(MesaRepository mesaRepository) {
        this.mesaRepository = mesaRepository;
    }

    @Autowired
    public void setVotoRepository(VotoRepository votoRepository) {
        this.votoRepository = votoRepository;
    }

    public List<OpcionVoto> getOpcionVotoList() {
        try {
            return makeCollection(opcionVotoRepository.findAll());
        } catch (DataAccessException e) {
            //TODO LOGGER
            e.printStackTrace();
            return null;
        }
    }

    public List<Mesa> getMesaList() {
        try {
            return makeCollection(mesaRepository.findAll());
        } catch (DataAccessException e) {
            //TODO LOGGER
            e.printStackTrace();
            return null;
        }
    }

    public boolean saveVotos(List<Voto> listVoto) {
        try {
            votoRepository.save(listVoto);
            return true;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static <E> List<E> makeCollection(Iterable<E> iter) {
        List<E> list = new ArrayList<E>();
        for (E item : iter) {
            list.add(item);
        }
        return list;
    }
}

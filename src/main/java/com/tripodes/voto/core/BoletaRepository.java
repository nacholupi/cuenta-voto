package com.tripodes.voto.core;


import org.springframework.data.repository.CrudRepository;

import java.util.List;

// TODO opcion voto es boleta!
interface BoletaRepository extends CrudRepository<Boleta, Integer> {

    List<Boleta> findAllByOrderByOrdenAsc();
}

package com.tripodes.voto.view.report;

import com.tripodes.voto.core.ReportsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class ReportsController {

    @Autowired
    ReportsRepository reportsRepository;

    @RequestMapping("jsonReports/consPart")
    public List consPart() {
        return reportsRepository.concejalesPorPartido();
    }

    @RequestMapping("jsonReports/porcEscrutado")
    public Object porcEscrutado() {
        return reportsRepository.porcEscrutado();
    }

    @RequestMapping("jsonReports/bancas")
    public Object bancas() {
        return reportsRepository.bancasPorLista();
    }
}

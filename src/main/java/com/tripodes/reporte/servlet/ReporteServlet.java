package com.tripodes.reporte.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.ContextLoader;

import com.google.gson.Gson;
import com.tripodes.model.dao.ReportesDAO;

/**
 * Servlet implementation class ReporteServlet
 */
public class ReporteServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ReportesDAO service = (ReportesDAO) ContextLoader
				.getCurrentWebApplicationContext().getBean("reportesDAO");

		String value = request.getParameter("op");
		
		Object consulta;
		
		if (value.equals("consPart")) {
				consulta = service.concejalesPorPartido();
		} else if (value.equals("consLista")) {
			consulta = service.concejalesPorLista();
		} else if (value.equals("princPorLoc")) {
			consulta = service.princPorLocalidad();
		} else if (value.equals("bancas")) {
			consulta = service.bancasPorLista();
		} else if (value.equals("porcEscrutado")) {
			consulta = service.porcEscrutado();
		} else {
			consulta = null;
		}

		response.setContentType("application/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-store");
		PrintWriter out = response.getWriter();

		// convert java object to JSON format,
		// and returned as JSON formatted string
		Gson gson = new Gson();
		String json = gson.toJson(consulta);
		System.out.println(json);
		out.write(json);
	}
}

package com.tripodes.gson;

import com.google.gson.Gson;
import org.junit.Test;

import java.util.HashMap;

public class GsonTest {

	@Test
	public void test() {
		HashMap<String, Integer> mapa = new HashMap<String, Integer>();
		mapa.put("hola", 23);
		mapa.put("hola2", 53);
		mapa.put("hola3", 13);

		Gson gson = new Gson();

		// convert java object to JSON format,
		// and returned as JSON formatted string
		String json = gson.toJson(mapa);

		System.out.println(json);

	}

	@Test
	public void test2() {
		Object[][][] array2 = { { { "sdsd", 5 }, { "psdfdsf", 7 } }} ;
		Gson gson = new Gson();

		// convert java object to JSON format,
		// and returned as JSON formatted string
		String json = gson.toJson(array2);

		System.out.println(json);

	}
}
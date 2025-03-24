package com.surrender.colegio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.surrender.colegio.model.Alumno;
import com.surrender.colegio.service.AlumnoService;

@RestController
@RequestMapping("/v1/alumnos")
public class AlumnoController {

	@Autowired
	private AlumnoService service;
	
	@GetMapping
	public ResponseEntity<?> listar() throws Exception {
		List<Alumno> lista = service.listar();
		return new ResponseEntity<List<Alumno>>(lista, HttpStatus.OK);
	}
}

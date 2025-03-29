package com.surrender.colegio.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@GetMapping("/{id}")
	public ResponseEntity<?> listarPorId(@PathVariable int id) throws Exception {
		Optional<Alumno> opt = service.listarPorId(id);
		if(!opt.isPresent()) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<Alumno>(opt.get(), HttpStatus.OK);
	}
	
}

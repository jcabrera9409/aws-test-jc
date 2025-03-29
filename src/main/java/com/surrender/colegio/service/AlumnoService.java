package com.surrender.colegio.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surrender.colegio.model.Alumno;
import com.surrender.colegio.repo.IAlumnoRepo;

@Service
public class AlumnoService {

	@Autowired
	private IAlumnoRepo repo = null;
	
	public List<Alumno> listar() throws Exception {
		return repo.findAll();
	}
	
	public Optional<Alumno> listarPorId(int id) throws Exception {
		return repo.findById(id);
	}
}

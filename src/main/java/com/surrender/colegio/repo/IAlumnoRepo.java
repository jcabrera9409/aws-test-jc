package com.surrender.colegio.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.surrender.colegio.model.Alumno;

public interface IAlumnoRepo extends JpaRepository<Alumno, Integer> {

}

package com.surrender.colegio.controller;

import com.surrender.colegio.model.Alumno;
import com.surrender.colegio.service.AlumnoService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;
import java.util.Optional;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(AlumnoController.class)
class AlumnoControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private AlumnoService alumnoService;

    @Test
    void listar_shouldReturnListOfAlumnos() throws Exception {
        Alumno alumno1 = new Alumno();
        alumno1.setId(1);
        alumno1.setNombre("Juan");
        Alumno alumno2 = new Alumno();
        alumno2.setId(2);
        alumno2.setNombre("Ana");
        when(alumnoService.listar()).thenReturn(List.of(alumno1, alumno2));

        mockMvc.perform(get("/v1/alumnos").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].nombre").value("Juan"))
                .andExpect(jsonPath("$[1].nombre").value("Ana"));
    }

    @Test
    void listarPorId_shouldReturnAlumno_whenFound() throws Exception {
        Alumno alumno = new Alumno();
        alumno.setId(1);
        alumno.setNombre("Juan");
        when(alumnoService.listarPorId(1)).thenReturn(Optional.of(alumno));

        mockMvc.perform(get("/v1/alumnos/1").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.nombre").value("Juan"));
    }

    @Test
    void listarPorId_shouldReturnNotFound_whenNotFound() throws Exception {
        when(alumnoService.listarPorId(99)).thenReturn(Optional.empty());

        mockMvc.perform(get("/v1/alumnos/99").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }
}

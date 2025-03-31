# Colegio API

Este proyecto es una API REST desarrollada con Spring Boot para la gestión de alumnos y sus notas.

## Documentación Adicional

- [Configuración de Arquitectura en AWS](./images/README.md): Detalles sobre cómo configurar los servicios de AWS utilizados en esta arquitectura.

## Características

- **Gestión de Alumnos**: Listado de alumnos y consulta de alumnos por ID.
- **Gestión de Notas**: Relación de notas asociadas a cada alumno.
- **Base de Datos**: MySQL como base de datos relacional.
- **Observabilidad**: Integración con OpenTelemetry, Prometheus y Grafana para métricas y trazabilidad.
- **Contenedores**: Configuración de Docker y Docker Compose para despliegue.

## Requisitos Previos

- Java 21
- Maven
- Docker y Docker Compose
- MySQL 8

## Configuración

### Variables de Entorno

El proyecto utiliza las siguientes variables de entorno para la configuración:

- `HOST_BD`: Host de la base de datos.
- `PORT_BD`: Puerto de la base de datos.
- `NAME_BD`: Nombre de la base de datos.
- `USER_BD`: Usuario de la base de datos.
- `PASSWORD_BD`: Contraseña de la base de datos.

### Base de Datos

El script SQL para inicializar la base de datos se encuentra en `scripts/scripts.sql`.

### Observabilidad

El proyecto incluye configuración para OpenTelemetry en el archivo `otel-config/config-2.yaml` y configuración para Prometheus en el archivo `prometheus-docker/prometheus.yml`.

## Ejecución

### Localmente

1. Compila el proyecto con Maven:
   ```bash
   mvn clean package -DskipTests
   ```

2. Ejecuta la aplicación:
   ```bash
   java -jar target/colegio-0.0.1-SNAPSHOT.jar
   ```

### Con Docker

Puedes utilizar la imagen ya existente en Docker Hub.

- jcabrera9409/aws-test:1.0 para la aplicacion sin OpenTelemetry 
- jcabrera9409/aws-test: 1.1-java-agent con OpenTelemetry

Caso contrario, puedes construir la imagen usando el Dockerfile

1. Compila el proyecto con Maven:
   ```bash
   mvn clean package -DskipTests
   ```

2. Construye la imagen docker
   ```bash
   docker build -t aws-test .
   ```

3. Levanta los servicios con Docker Compose:
   ```bash
   docker compose up -d
   ```

## Endpoints

### Alumnos

- **GET** `/v1/alumnos`: Lista todos los alumnos.
- **GET** `/v1/alumnos/{id}`: Obtiene un alumno por su ID.

### Observabilidad

- **Prometheus**: Disponible en `http://localhost:9090`.
- **Grafana**: Al inicio, se debe agregar el DataSource de Prometheus usando el EndPoint `http://prometheus:9090` sin autenticación. Grafana estará disponible en `http://localhost:3000` (usuario: `admin`, contraseña: `admin`).

### Tecnologías usadas

- Spring Boot
- MySQL
- Docker
- OpenTelemetry
- Prometheus
- Grafana

## Demo

- **API**: [https://n7ggl3i9tb.execute-api.us-east-1.amazonaws.com/v1/alumnos](https://n7ggl3i9tb.execute-api.us-east-1.amazonaws.com/v1/alumnos)
- **Grafana**: [http://98.82.0.210](http://98.82.0.210/)

## Autor
Proyecto desarrollado por Jose Cabrera
FROM eclipse-temurin:21-jre

ENV HOST_BD=
ENV PORT_BD=
ENV NAME_BD=
ENV USER_BD=
ENV PASSWORD_BD=

WORKDIR /app

COPY target/*.jar application.jar
COPY opentelemetry-javaagent.jar opentelemetry-javaagent.jar

ENV OTEL_RESOURCE_ATTRIBUTES="deployment.environment=local,service.namespace=api"
ENV OTEL_SERVICE_NAME="api-alumnos"

ENV OTEL_TRACES_ENVER="none"
ENV OTEL_ENVER_OTLP_PROTOCOL="http/protobuf"

ENV OTEL_PROPAGATORS="tracecontext,baggage"
ENV OTEL_TRACES_SAMPLER="parentbased_traceidratio"
ENV OTEL_TRACES_SAMPLER_ARG="0.1"

ENV OTEL_METRICS_ENVER="otlp"
ENV OTEL_LOGS_ENVER="none"

ENV OTEL_EXPORTER_OTLP_ENDPOINT="http://localhost:4318"

ENV JAVA_TOOL_OPTIONS="-javaagent:/app/opentelemetry-javaagent.jar"

EXPOSE 8080

CMD ["java", "-jar", "/app/application.jar"]
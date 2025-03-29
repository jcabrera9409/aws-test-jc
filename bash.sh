export OTEL_RESOURCE_ATTRIBUTES="deployment.environment=local,service.namespace=api"
export OTEL_SERVICE_NAME="api-alumnos"

export OTEL_TRACES_EXPORTER="otlp"
export OTEL_PROPAGATORS="tracecontext,baggage"
export OTEL_TRACES_SAMPLER="parentbased_traceidratio=1.0"

export OTEL_METRICS_EXPORTER="none"
export OTEL_LOGS_EXPORTER="none"

export OTEL_EXPORTER_OTLP_ENDPOINT="localhost:4317"

export JAVA_TOOL_OPTIONS="-javaagent:opentelemetry-javaagent.jar"

java -jar target/colegio-0.0.1-SNAPSHOT.jar
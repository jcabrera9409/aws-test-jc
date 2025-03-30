export OTEL_RESOURCE_ATTRIBUTES="deployment.environment=local,service.namespace=api"
export OTEL_SERVICE_NAME="api-alumnos"

export OTEL_TRACES_EXPORTER="otlp"
export OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"

export OTEL_PROPAGATORS="tracecontext,baggage"
export OTEL_TRACES_SAMPLER="parentbased_traceidratio"
export OTEL_TRACES_SAMPLER_ARG="0.1"

export OTEL_METRICS_EXPORTER="otlp"
export OTEL_LOGS_EXPORTER="otlp"

export OTEL_EXPORTER_OTLP_ENDPOINT="http://localhost:4318"

export JAVA_TOOL_OPTIONS="-javaagent:opentelemetry-javaagent.jar"

java -jar target/colegio-0.0.1-SNAPSHOT.jar
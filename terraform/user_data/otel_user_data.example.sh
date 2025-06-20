#! /bin/sh
echo "Esperando conexión a Internet..."
until curl -s http://google.com >/dev/null; do
  echo "Sin conexión aún, esperando..."
  sleep 5
done
echo "Conectado a Internet, continuando..."

apt update -y
apt install docker.io -y
usermod -a -G docker ubuntu
curl -L https://github.com/docker/compose/releases/download/v2.3.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
chown root:docker /usr/local/bin/docker-compose

mkdir -p /home/ubuntu/otel-config

cat << EOF > /home/ubuntu/docker-compose.yml
services:
    otel:
      image: otel/opentelemetry-collector-contrib:0.121.0
      command: ["--config=/etc/otel-collector-config.yaml", "$${OTELCOL_ARGS}"]
      volumes:
        - ./otel-config/config.yaml:/etc/otel-collector-config.yaml
      ports:
        - "8888:8888"   
        - "4317:4317"
        - "4318:4318" 
EOF

cat << EOF > /home/ubuntu/otel-config/config.yaml

extensions: {}

receivers:        
  otlp:
    protocols:
      http:
        endpoint: 0.0.0.0:4318
      grpc:
        endpoint: 0.0.0.0:4317

connectors: {}

processors:

  batch/logs:
    send_batch_max_size: 1000
    send_batch_size: 200
    timeout: 10

exporters:
  debug/development:
    verbosity: detailed
    use_internal_logger: false
  
  nop:

  prometheusremotewrite:
    endpoint: "http://${ip_private_prometheus}:9090/api/v1/write"
    timeout: 5s
    add_metric_suffixes: false
    remote_write_queue:
      enabled: true
      num_consumers: 10
      queue_size: 10000
    resource_to_telemetry_conversion:
      enabled: false

service:
  telemetry:
    logs:
      level: "info"
    metrics:
      level: detailed
      address: 0.0.0.0:8888
  extensions: []
  pipelines:
    metrics:
      receivers: [otlp]
      processors: []
      exporters: [prometheusremotewrite]
EOF

chown ubuntu:ubuntu /home/ubuntu
/usr/local/bin/docker-compose -f /home/ubuntu/docker-compose.yml up -d
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

mkdir -p /home/ubuntu/prometheus-docker
mkdir -p /home/ubuntu/prometheus-data

cat << EOF > /home/ubuntu/docker-compose.yml
services:
    prometheus:
        image: prom/prometheus:v3.2.1
        ports:
        - "9090:9090"
        volumes: 
        - ./prometheus-docker/:/etc/prometheus/
        - ./prometheus-data:/prometheus
        command: 
        - '--config.file=/etc/prometheus/prometheus.yml'
        - '--storage.tsdb.path=/prometheus'
        - '--web.console.libraries=/usr/share/prometheus/console_libraries'
        - '--web.console.templates=/usr/share/prometheus/consoles'
        - '--web.enable-remote-write-receiver'
EOF

cat << EOF > /home/ubuntu/prometheus-docker/prometheus.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s 

alerting:
  alertmanagers:
    - static_configs:
        - targets:

rule_files:

scrape_configs:
  - job_name: "prometheus"

    static_configs:
      - targets: ["localhost:9090"]
EOF

chown ubuntu:ubuntu /home/ubuntu
chmod 777 /home/ubuntu/prometheus-data
/usr/local/bin/docker-compose -f /home/ubuntu/docker-compose.yml up -d
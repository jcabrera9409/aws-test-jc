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
cat << EOF > /home/ubuntu/docker-compose.yml
services:
apialumnos:
    image: jcabrera9409/aws-test:1.1-java-agent
    environment: 
    - HOST_BD={HOST_BD}
    - PORT_BD=3306
    - NAME_BD=testdb
    - USER_BD={USER_BD}
    - PASSWORD_BD={PASSWORD_BD}
    - OTEL_SERVICE_NAME=apialumnos
    - OTEL_EXPORTER_OTLP_ENDPOINT=http://{PRIVATE_IP}:4318
    ports:
    - "80:8080"
    restart: on-failure
EOF
chown ubuntu:ubuntu /home/ubuntu/docker-compose.yml
/usr/local/bin/docker-compose -f /home/ubuntu/docker-compose.yml up -d
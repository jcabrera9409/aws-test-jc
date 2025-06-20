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
  grafana:
    image: grafana/grafana:latest
    ports:
      - "80:3000"
    environment:
      - GF_SECURITY_ADMIN_USER=admin
      - GF_SECURITY_ADMIN_PASSWORD=admin
      - GF_AUTH_ANONYMOUS_ENABLED=true
      - GF_AUTH_ANONYMOUS_ORG_ROLE=Admin
      - GF_AUTH_DISABLE_LOGIN_FORM=false
EOF

chown ubuntu:ubuntu /home/ubuntu
/usr/local/bin/docker-compose -f /home/ubuntu/docker-compose.yml up -d
docker build -t qrcode-server .\conf\docker\qrcode-server
docker build -t qrcode-client .\conf\docker\qrcode-client
docker network create qrcode-network_rla
docker rm -f qrcode-server_rla
docker rm -f qrcode-client_rla
docker run -d --rm ^
    -v %cd%\src:/tmp ^
    -w "/tmp" ^
    --network qrcode-network_rla ^
    --name qrcode-service_rla ^
    --hostname qrcode-server ^
    qrcode-server bash -l -c "source qrcode-server.sh"
timeout /t 2
docker logs qrcode-service_rla
docker exec -ti qrcode-service_rla bash -l -c "su qruser"
docker run -ti --rm ^
    -v %cd%\src:/tmp ^
    -w "/tmp" ^
    --network qrcode-network_rla ^
    --name qrcode-client_rla ^
    --hostname qrcode-client ^
    qrcode-client bash -l -c "source qrcode-client.sh"
docker rm -f qrcode-service_rla
docker network remove qrcode-network_rla

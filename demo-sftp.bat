docker build -t sftp-server .\conf\docker\sftp-server
docker build -t sftp-client .\conf\docker\sftp-client
docker network create sftp-network_rla
docker rm -f sftp-service_rla
docker rm -f sftp-client_rla
docker run -d --rm ^
    -v %cd%\src:/tmp ^
    -w "/tmp" ^
    --network sftp-network_rla ^
    --name sftp-service_rla ^
    --hostname sftp-server ^
    sftp-server bash -l -c "source sftp-server.sh"
docker logs sftp-service_rla
docker run -ti --rm ^
    -v %cd%\src:/tmp ^
    -w "/tmp" ^
    --network sftp-network_rla ^
    --name sftp-client_rla ^
    --hostname sftp-client ^
    sftp-client bash -l -c "source sftp-client.sh"
docker rm -f sftp-service_rla
docker network remove sftp-network_rla

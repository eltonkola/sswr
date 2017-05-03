# sswr
Simple Stupid Web Radio. UI needed a simple docker image, to create a webradio, publish the stream on a free icecast server provided by listen2myradio.com, you can also use another docker icecast container

#locally build docker image
docker build -t eltonkola/sswr:latest .
docker build -t eltonkola/sswr


#run it

docker run -d \
    -v /home/elton/Desktop/doker/sswr/radio_media:/radio_media \
    -e config_mount_name="stream" \
    -e config_icecast_host="172.0.0.1" \
    -e config_icecast_port=8000 \
    -e config_icecast_password="hackme" \
    -e config_error_msg="Working on it, please come back later!" \
    -e config_telnet_enable=false \
    -e config_telnet_port=1361 \
    -e config_rotate_jingle=1 \
    -e config_rotate_song=3 \
    -e config_default_meta="Simple Stupid Web Radio" \
    eltonkola/sswr

#docker terminal
docker exec -it da1e69a908ed /bin/bash

#push the image
docker push eltonkola/sswr
docker push eltonkola/sswr:latest

# read logs from docker terminal
tail -f /tmp/radio_log.log


#test stream with vlc
http://172.0.0.1:8000/stream


#docker-compose - wip
docker-compose up -d

#volumes and other stuff
docker volume rm $(docker volume ls |awk '{print $2}')

docker images -q |xargs docker rmi
docker ps -q |xargs docker rm

 docker exec -it 03aa68f171d3a13afb06a175a77d607fbcb4874013a77823e2db8019e0718a42 /bin/bash

docker run --rm -it eltonkola/sswr bash -il

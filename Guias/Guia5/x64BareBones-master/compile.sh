docker start dockerGuia5
docker exec -it dockerGuia5 make clean -C /root/x64BareBones-master/Toolchain
docker exec -it dockerGuia5 make clean -C /root/x64BareBones-master
docker exec -it dockerGuia5 make -C /root/x64BareBones-master/Toolchain
docker exec -it dockerGuia5 make -C /root/x64BareBones-master
docker stop dockerGuia5
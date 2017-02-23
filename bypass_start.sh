sudo mkdir -p /dorry_data/bypass
sudo cp `pwd`/white/* /dorry_data/bypass/
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host -v /dorry_data/bypass:/bypass -e LAN=eth0 -e PORT_1=1080 -e PORT_2=1090 --name router_bypass dorrypizza/bypass:test

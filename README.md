# bypass
It uses iptables to redirect packets input from a interface to local port.

## Usage

* Fetch the code
```
git clone git@github.com:dorrywhale/bypass.git
```

* Modify config by adding vps in `02-vps`
```
cd bypass
vim white/02-vps
```

* Run bypass
```
sudo mkdir -p /dorry_data/bypass
sudo cp white/* /dorry_data/bypass/
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host -v /dorry_data/bypass:/bypass -e LAN=eth1 -e PORT_1=1080 -e PORT_2=1090 --name router_bypass bypass:test
```

* clean rule
```
docker exec -it router_bypass ./clean-rule eth1
```

* clean ipset
```
docker exec -it router_bypass ./clean-ipset
```

# bypass
It uses iptables to redirect packets input from a interface to local port.

## Rule
It checks destination address of packets input from `eth1`, and pass them to different destination, with rules follow:
* white list:
    ignore packets whose destination address in files name like `myips` in directory `/dorry_data/bypass/` and local network ips.
* redirect to port:
    redirect packets whose destination address in files name like `myips--1090` in directory `/dorry_data/bypass/` to local port 1090 etc.
* redirect to default port:
	redirect packets whose destination address not in above, to default port `1080`.

## Usage
* generate rule
```
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host -v /dorry_data/bypass/:/home/whiteip/custom -e LAN=eth1 -e DEFAULT_PORT=1080 --name router_bypass dorrypizza/bypass
```

* clean rule
```
docker exec -it router_bypass ./clean-rule eth1
```
# bypass-0.1.1
use iptables to redirect packets from your LAN interface who's destination address not in list to local ports.

- default rule
	whitelist: from your LAN interface to 192.168.0.0/16 or ips in file '/home/whiteip/chinaips'
	redirect rule: redirect other packets from your LAN interface to your default port
- append custom rule
	whitelist: from your LAN interface to ips in  '/home/whiteip/[ your file ]'
	redirect rule: redirect packets from your LAN interface to ips in '/home/whiteip/[ your port ]/[ your file ]' to your local port

## How to use?
```
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host --volumes-from router_chinadns_1 -v [ your custom ips path ]:/home/whiteip/custom -e WAN=[ your WAN interface name ] -e LAN=[ your LAN interface name ] -e DEFAULT_PORT=[ your default port ] --name router_bypass_1 dorrypizza/bypass
```
## How to clean rules?
```
docker exec -it [ bypass container name ] ./clean-rule [ your WAN interface name ] [ your LAN interface name ]
```
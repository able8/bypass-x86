# bypass
使用 iptables 制定在x86上的双网卡的包转发规则 (请确保打开了系统的 ipv4_forward ) .

## 规则介绍
将网卡 eth0 和 eth1 分别作为 WAN口 和 LAN口, 通过筛选包的目标地址来控制所有从 LAN口 输入的包.
规则如下:
* 白名单
  在挂载路径 `/dorry_data/bypass/` 下添加IP列表文件 (如: whiteips, coustomips) 后重启容器.
  则所有目标地址在IP列表文件中的包,直接转发到 WAN口 .
* 指定转发
  在挂载路径 `/dorry_data/bypass/` 下添加一个以 port 命名的子文件夹,并在子文件夹中添加IP列表文件 (如: 1090/myips) 后重启容器.
  则目标地址属于 myips 列表的包,转发到 1090 端口.
* 默认转发
  其它所有的包,转发到本地 1080 端口.

## 用法
* 生成规则
```
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host -v /dorry_data/bypass/:/home/whiteip/custom -e WAN=eth0 -e LAN=eth1 -e DEFAULT_PORT=1080 --name router_bypass dorrypizza/bypass
```
* 清空规则
```
docker exec -it router_bypass ./clean-rule eth0 eth1
```

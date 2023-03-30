@echo off

wsl -d Ubuntu-20.04 --shutdown

REM 把这里理解为一个开机启动脚本就行
REM ssh若是需要的话；包括数据库等等
wsl -d Ubuntu-20.04 -u root service ssh start

wsl -d Ubuntu-20.04 -u root ip addr del $(ip addr show eth0 ^| grep 'inet\b' ^| awk '{print $2}' ^| head -n 1) dev eth0
wsl -d Ubuntu-20.04 -u root ip addr add 192.168.50.2/24 broadcast 192.168.50.255 dev eth0
wsl -d Ubuntu-20.04 -u root ip route add 0.0.0.0/0 via 192.168.50.1 dev eth0

powershell -c "Get-NetAdapter 'vEthernet (WSL)' | Get-NetIPAddress | Remove-NetIPAddress -Confirm:$False; New-NetIPAddress -IPAddress 192.168.50.1 -PrefixLength 24 -InterfaceAlias 'vEthernet (WSL)'; Get-NetNat | ? Name -Eq WSLNat | Remove-NetNat -Confirm:$False; New-NetNat -Name WSLNat -InternalIPInterfaceAddressPrefix 192.168.50.0/24;"

REM 启动对应Linux系统，我这里是使用windows terminal，可自行替换为自己的，或者删除以其它方式启动
wt -p Ubuntu-20.04
wsl -d Ubuntu-20.04 -u root echo "nameserver 114.114.114.114" > /etc/resolv.conf
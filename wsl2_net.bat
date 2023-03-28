wsl -d Ubuntu -u root ip addr del $(ip addr show eth0 ^| grep 'inet\b' ^| awk '{print $2}' ^| head -n 1) dev eth0
wsl -d Ubuntu -u root ip addr add 192.168.50.2/24 broadcast 192.168.50.255 dev eth0
wsl -d Ubuntu -u root ip route add 0.0.0.0/0 via 192.168.50.1 dev eth0
wsl -d Ubuntu -u root echo nameserver 192.168.50.1 ^> /etc/resolv.conf
powershell -c "Get-NetAdapter 'vEthernet (WSL)' | Get-NetIPAddress | Remove-NetIPAddress -Confirm:$False; New-NetIPAddress -IPAddress 192.168.50.1 -PrefixLength 24 -InterfaceAlias 'vEthernet (WSL)'; Get-NetNat | ? Name -Eq WSLNat | Remove-NetNat -Confirm:$False; New-NetNat -Name WSLNat -InternalIPInterfaceAddressPrefix 192.168.50.0/24;"
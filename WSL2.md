## WSL2 设置

### 镜像路径修改
 说明：Docker Desktop也使用了WSL，而且有专门的名字, docker-desktop-data和docker-desktop
```shell
wsl --export docker-desktop-data F:\\wsl\docker-desktop-data.tar
wsl --export docker-desktop F:\\wsl\docker-desktop.tar
wsl --unregister docker-desktop-data
wsl --unregister docker-desktop
wsl --import docker-desktop-data F:\\docker\wsl\docker-desktop-data  F:\\wsl\docker-desktop-data.tar --version 2
wsl --import docker-desktop F:\\docker\wsl\docker-desktop  F:\\wsl\docker-desktop.tar --version 2
```

#### 固定IP
+ [《WSL2固定IP解决方案》](https://www.loyating.com/articles/23)


#### 命令行代理设置
```shell
# 设置代理命令
proxy_ip="172.19.99.136"
proxy_port="7890"
alias proxy='export http_proxy=${proxy_ip}:${proxy_port}; export https_proxy=${http_proxy}'
alias proxyOff='unset http_proxy;unset https_proxy'
alias gitproxy='git config --global http.proxy socks5://${proxy_ip}:${proxy_port};git config --global https.proxy socks5://${proxy_ip}:${proxy_port}'
alias gitproxyOff='git config --global --unset http.proxy;git config --global --unset https.proxy'
```

#### 修改WSL2的路径
```shell
wsl -l -v 
wsl --export Ubuntu-22.04 F:\\wsl\Ubuntu-22.04.tar
wsl --unregister Ubuntu-22.04
wsl --import Ubuntu-22.04 F:\\docker\wsl\Ubuntu-22.04  F:\\wsl\Ubuntu-22.04.tar --version 2

Ubuntu2204 config --default-user username
```


### 参考资料
+ [《WSL2固定IP解决方案》](https://www.loyating.com/articles/23)
+ [《Windows10子系统WSL修改默认安装目录到其他盘》](https://blog.csdn.net/weixin_40837318/article/details/108233688)


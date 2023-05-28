## WSL2 设置固定IP


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

### 参考资料
+ [《WSL2固定IP解决方案》](https://www.loyating.com/articles/23)
+ [《Windows10子系统WSL修改默认安装目录到其他盘》](https://blog.csdn.net/weixin_40837318/article/details/108233688)


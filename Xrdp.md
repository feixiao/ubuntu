## Ubuntu安装Xrdp

#### Ubuntu 20.04
```shell
sudo apt update
sudo apt install ubuntu-desktop
sudo apt install xubuntu-desktop

# 安装xrdp
sudo apt install xrdp

# 查看启动状态
sudo systemctl status xrdp


# 
sudo adduser xrdp ssl-cert
sudo systemctl restart xrdp
```


#### 客户端
+ Windows
使用自带的Remote Desktop Connection
+ OSX 
使用Microsoft Remote Desktop


#### 参考资料
+ [《Ubuntu 20.04系统中安装Xrdp》](https://www.yangbolin.com/?id=291)
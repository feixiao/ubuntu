#### Ubuntu上面代理设置

#### Shadowsocks

+ 安装shadowsocks

  ```
  sudo apt-get install python-pip
  sudo pip install shadowsocks
  ```

+ 配置文件(自己创建文件/etc/shadowsocks.json)

  ```json
  {
      "server":"your_server_ip",      # ss服务器IP
      "server_port":your_server_port, # 端口
      "local_address": "127.0.0.1",   # 本地ip
      "local_port":1080,              # 本地端口
      "password":"your password",
      "timeout":300,
      "method":"aes-256-cfb"
  }
  ```

+ 启动

  ```
  nohup sslocal -c /etc/shadowsocks.json /dev/null 2>&1 &
  ```

#### HTTP代理

+ 安装privoxy

  ```shell
  sudo apt-get install privoxy 
  ```

+ 配置

  ```shell
  sudo vi /etc/privoxy/config

  # 添加如下内容
  forward-socks5 	 / 				 127.0.0.1:1080 .
  ```

+ 启动服务设置全局代理

  ```shell
  # 开启privoxy 服务就行
  sudo  service  privoxy start 
  # 设置http 和 https 全局代理
  export http_proxy='http://localhost:8118'
  export https_proxy='http://localhost:8118'
  ```

#### Git代理

+ 设置代理

  ```shell
  git config --global http.proxy 'socks5://127.0.0.1:1080' 
  git config --global https.proxy 'socks5://127.0.0.1:1080'
  ```

+ 取消代理

  ```shell
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  ```

#### 参考资料

+ [使用Privoxy将socks5代理转为http代理](http://blog.csdn.net/li740207611/article/details/52045471)
+ [Ubuntu14.04 Shadowsocks服务器安装](http://blog.csdn.net/cl123cpzaihu/article/details/52148781)
+ [CentOS命令行使用shadowsocks代理的方法](http://blog.csdn.net/yanzi1225627/article/details/51121507)
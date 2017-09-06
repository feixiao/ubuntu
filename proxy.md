#### ubuntu上面代理设置

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
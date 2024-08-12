### Ubuntu 开发环境部署

#### 1. 安装基本工具

```bash
sudo apt install -y  openssh-server
sudo apt install -y  git lrzsz  curl wget

sudo apt install  -y gcc g++  cmake build-essential  ninja-build
```

#### 2. oh-my-zsh

```bash
sudo apt install -y zsh
sh -c "$(wget -O- https://gitee.com/pocmon/ohmyzsh/raw/master/tools/install.sh)"

# 插件
git clone https://gitee.com/asddfdf/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://gitee.com/chenweizhen/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


sudo apt-get install fonts-powerline

source ~/.zshrc
```

##### 2.1  支持正则表达式
```bash
echo "setopt no_nomatch" >> ~/.zshrc
```
#### 3. 代理配置

```bash
# 代理配置
# 下面内容添加到~/.zshrc文件中

proxy_ip="10.10.107.123"
proxy_port="7890"
alias proxy='export http_proxy=${proxy_ip}:${proxy_port}; export https_proxy=${http_proxy}'
alias proxyOff='unset http_proxy;unset https_proxy'
alias gitproxy='git config --global http.proxy socks5://${proxy_ip}:${proxy_port};git config --global https.proxy socks5://${proxy_ip}:${proxy_port}'
alias gitproxyOff='git config --global --unset http.proxy;git config --global --unset https.proxy'
```

#### 4. miniforge

```bash
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh
```

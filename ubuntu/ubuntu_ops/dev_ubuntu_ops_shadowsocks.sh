# ubuntu shadowsocks
sudo apt-get install -y python-pip python-setuptools m2crypto
sudo apt-get install -y shadowsocks

# ubuntu shadowsocks 配置
tee $HOME/shadowsocks.json <<-'EOF'
{
"server":"47.90.39.190",
"server_port": 10010,
"local_port":1080,
"password":"dSyHGFfGFFvB",
"timeout":600,
"method":"aes-256-cfb"
}
EOF

# ubuntu shadowsocks 启动
tee $HOME/my_sh/shadowsocks_start.sh <<-'EOF'
sudo nohup sslocal -c $HOME/shadowsocks.json > /dev/null 2>1 &
ps -ef |grep sslocal
sudo service privoxy restart
EOF

chmod +x $HOME/*/*.sh

# genpac 代理
sudo pip install genpac
sudo pip install --upgrade genpac

#genpac --format=pac --pac-proxy="SOCKS5 127.0.0.1:1080" --gfwlist-local=~/gfwlist.txt --gfwlist-update-local -o autoproxy.pac
genpac --proxy="SOCKS5 127.0.0.1:1080" -o autoproxy.pac --gfwlist-url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"

# ubuntu 代理设置
<<COMMENT
    系统设置 --> 网络 --> 网络代理 
    自动
    file:///home/dev/autoproxy.pac
COMMENT

# ubuntu 配置
export http_proxy="http://127.0.0.1:1080/"
export https_proxy="http://127.0.0.1:1080/"


# docker 安装
sudo apt-get remove docker docker-engine docker.io
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce
sudo docker version

sudo groupadd docker
sudo usermod -aG docker $USER

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "/home/$USER/.docker" -R

sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker.service

# 加速 docker image
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
"registry-mirrors": ["https://kag0brah.mirror.aliyuncs.com"]
}
EOF
sudo cat /etc/docker/daemon.json

sudo systemctl daemon-reload
sudo systemctl restart docker

# docker 更新升级
sudo apt-cache madison docker-ce
sudo apt-get install -y docker-ce=<VERSION>

sudo ps aux |grep dockerd

env | grep DOCKER_HOST

# docker-compose 安装
sudo apt-get install -y python-pip 

sudo pip uninstall docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version

## docker kitematic 安装
#   https://github.com/docker/kitematic/releases
#   https://kitematic.com/docs/


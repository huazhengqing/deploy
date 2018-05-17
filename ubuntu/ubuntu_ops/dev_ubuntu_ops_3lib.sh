# swagger
tee $HOME/my_sh/swagger_up.sh <<-'EOF'
docker pull swaggerapi/swagger-editor
docker images | grep "swaggerapi"
docker run -d -p 80:8080 swaggerapi/swagger-editor
docker ps -a
sudo netstat -npl | grep 80
EOF

tee $HOME/my_sh/swagger_down.sh <<-'EOF'
docker ps -a
docker rm -f    $(docker ps -a | grep "swaggerapi" | awk '{print $1}')
docker ps -a
EOF

chmod +x $HOME/*/*.sh

# Web Assembly
git clone https://github.com/juj/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest

./emsdk install --build=Release sdk-incoming-64bit binaryen-master-64bit
./emsdk activate --build=Release sdk-incoming-64bit binaryen-master-64bit

source ./emsdk_env.sh --build=Release



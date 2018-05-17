# go
sudo apt-get --purge remove golang
sudo rm -rf /usr/local/go

wget https://dl.google.com/go/go1.10.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.10.1.linux-amd64.tar.gz

tee -a /etc/profile <<-'EOF'
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
EOF

source /etc/profile

## go / 3lib
mkdir -p $GOPATH/src/github.com/looplab/
cd $GOPATH/src/github.com/looplab/
git clone  https://github.com/looplab/fsm.git

mkdir -p $GOPATH/src/github.com/cloudflare/
cd $GOPATH/src/github.com/cloudflare/
https://github.com/cloudflare/cfssl.git

mkdir -p $GOPATH/src/github.com/
cd $GOPATH/src/github.com/
git clone  https://github.com/shijuvar/go-recipes.git

go get -v github.com/ramya-rao-a/go-outline
go get -v github.com/rogpeppe/godef
go get -v github.com/nsf/gocode 
go get -v github.com/ramya-rao-a/go-outline
go get -v github.com/acroca/go-symbols
go get -v golang.org/x/tools/cmd/guru
go get -v golang.org/x/tools/cmd/gorename 
go get -v github.com/golang/lint/golint
go get -v sourcegraph.com/sqs/goreturns
go get -v github.com/derekparker/delve
go get -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u github.com/cloudflare/cfssl

go install github.com/nsf/gocode
go install github.com/rogpeppe/godef
go install github.com/zmb3/gogetdoc
go install github.com/golang/lint/golint
go install github.com/lukehoban/go-outline
go install sourcegraph.com/sqs/goreturns
go install golang.org/x/tools/cmd/gorename
go install github.com/tpng/gopkgs
go install github.com/newhook/go-symbols
go install github.com/cweill/gotests/...
go install golang.org/x/tools/cmd/guru
go install github.com/derekparker/delve/cmd/dlv

# protobuf 
sudo apt-get remove libprotobuf-dev 

mkdir -p $GOPATH/src/github.com/google/
cd $GOPATH/src/github.com/google/
git clone  https://github.com/google/protobuf.git

cd protobuf/
./autogen.sh
./configure
make
make check 
sudo make install
sudo ldconfig


# grpc
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}
go get -u github.com/golang/lint/golint
go get -u golang.org/x/lint/
go get -u golang.org/x/lint/golint
go get -u golang.org/x/text/secure/bidirule
go get -u golang.org/x/text/unicode/bidi
go get -u golang.org/x/text/unicode/norm
go get -u google.golang.org/genproto/googleapis/rpc/status
go get -u google.golang.org/grpc

npm install grpc
pip install grpcio
pecl install grpc
gem install grpc

mkdir -p $GOPATH/src/github.com/grpc/
cd $GOPATH/src/github.com/grpc/
git clone   https://github.com/grpc/grpc-go.git

cd grpc-go
git submodule update --init
make

# grpc example
mkdir -p $GOPATH/src/github.com/
cd $GOPATH/src/github.com/

git clone       https://github.com/jergoo/go-grpc-example.git
git clone       https://github.com/smallnest/grpc-examples.git
git clone       https://github.com/philips/grpc-gateway-example.git

git clone       https://github.com/grpc-ecosystem/grpc-gateway.git
git clone       https://github.com/grpc-ecosystem/go-grpc-middleware.git




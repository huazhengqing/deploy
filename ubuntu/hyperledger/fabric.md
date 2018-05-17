# hyperledger / 超级账本

## fabric

```
mkdir -p $GOPATH/src/github.com/hyperledger
cd $GOPATH/src/github.com/hyperledger
git clone     https://github.com/hyperledger/fabric.git
git clone     https://github.com/yeasy/docker-compose-files.git    
cd $GOPATH/src/github.com/hyperledger/fabric
```
```
git remote -v
git branch -a
git tag
git status
git checkout release-1.1
```
```
make release
```
```
sudo mkdir -p  /etc/hyperledger/fabric/
sudo chown -R dev.dev /etc/hyperledger
cd $GOPATH/src/github.com/hyperledger/fabric/sampleconfig/
cp *.yaml   /etc/hyperledger/fabric/
```

## fabric-ca 
```
cd $GOPATH/src/github.com/hyperledger
git clone     https://github.com/hyperledger/fabric-ca.git
cd $GOPATH/src/github.com/hyperledger/fabric-ca/
make release
make dist
```

## fabric/examples/e2e_cli
```
cd $GOPATH/src/github.com/hyperledger/fabric/
git checkout v1.0.0-beta

cd $GOPATH/src/github.com/hyperledger/fabric/
cd ./examples/e2e_cli
source download-dockerimages.sh
```
```
rm -rf ./var

mkdir -p ./var/ordererOrganizations/example.com/orderers/orderer.example.com/
mkdir -p ./var/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/
mkdir -p ./var/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/
mkdir -p ./var/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/
mkdir -p ./var/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/
```
```
./network_setup.sh up

./network_setup.sh down
```
```
docker exec -it cli bash 
cd /opt/gopath/src/github.com/hyperledger/fabric/
ls -lR
```
```
peer channel create|fetch|update|join|list
peer channel fetch config -b mychannel.block   outfile
peer channel fetch newest -b mychannel.block   outfile
peer channel list 
```
```
docker exec -it peer0.org1.example.com bash 
docker exec -it peer1.org1.example.com bash 
docker exec -it peer0.org2.example.com bash 
docker exec -it peer1.org2.example.com bash 
cd /opt/gopath/src/github.com/hyperledger/fabric/peer/
ls -lR
cd /var/hyperledger/
ls -lR
cd /etc/hyperledger/fabric/
ls -lR
```
```
docker exec -it orderer.example.com bash 
cd /opt/gopath/src/github.com/hyperledger/fabric/peer/
ls -lR
cd /var/hyperledger/
ls -lR
cd /etc/hyperledger/fabric/
ls -lR
```

## fabric  configtxlator
```
./configtxlator start &
```
```
cd $GOPATH/src/github.com/hyperledger/fabric/
cd ./examples/e2e_cli
cd ./channel-artifacts/
curl -X POST --data-binary @genesis.block http://127.0.0.1:7059/protolator/decode/common.Block > genesis.json
curl -X POST --data-binary @channel.tx http://127.0.0.1:7059/protolator/decode/common.Envelope > channel.json
curl -X POST --data-binary @Org1MSPanchors.tx http://127.0.0.1:7059/protolator/decode/common.Envelope > Org1MSPanchors.json
curl -X POST --data-binary @Org2MSPanchors.tx http://127.0.0.1:7059/protolator/decode/common.Envelope > Org2MSPanchors.json
```
```
curl -X POST --data-binary @blockfile_000000 http://127.0.0.1:7059/protolator/decode/common.Block > blockfile_000000.json
curl -X POST --data-binary @channel.json http://127.0.0.1:7059/protolator/encode/common.ConfigUpdate > channel2.tx
```


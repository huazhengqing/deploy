# hyperledger composer
## composer 安装
```
cd $GOPATH/src/github.com/hyperledger/
git clone   https://github.com/hyperledger/composer.git
```
```
npm uninstall -g composer-cli
npm uninstall -g composer-rest-server
npm uninstall -g generator-hyperledger-composer

npm install -g composer-cli
npm install -g composer-rest-server
npm install -g generator-hyperledger-composer
npm install -g yo
npm install -g composer-playground
```
## composer
```
composer participant add -c admin@network -d '{"$class":"net.biz.digitalPropertyNetwork.Person","personId":"mae@biznet.org","firstName":"Mae","lastName":"Smith"}'
```
```
composer identity issue -c admin@network -f maeid1.card -u maeid1 -a "resource:net.biz.digitalPropertyNetwork.Person#mae@biznet.org"
composer card import -f maeid1@network.card
composer network ping -c maeid1@network
```
```
composer identity bind -c admin@digitalPropertyNetwork -a "resource:net.biz.digitalPropertyNetwork.Person#mae@biznet.org"
composer network ping -c admin@digitalPropertyNetwork
```
## business network
```
yo hyperledger-composer:businessnetwork
```
```
composer network install -c PeerAdmin@hlfv1 -a dist/iot-perishable-network-advanced.bna 
composer network start -c PeerAdmin@hlfv1 -A admin -S adminpw -n iot-perishable-network-advanced -V 0.1.13 -f networkadmin.card
composer network upgrade -c admin@iot-perishable-network-advanced -n iot-perishable-network-advanced -V 0.1.13
composer card import -f networkadmin.card
composer network list -c admin@iot-perishable-network-advanced
composer network ping -c admin@iot-perishable-network-advanced
composer-rest-server -c admin@iot-perishable-network-advanced
composer card list
composer transaction submit -c admin@iot-perishable-network-advanced -d '{"$class": "org.acme.shipping.perishable.SetupDemo"}'
composer network list -c admin@iot-perishable-network-advanced
```
```
composer identity list -c admin@iot-perishable-network-advanced
composer identity issue -c admin@iot-perishable-network-advanced -f grower1.card -u grower1 -a 'resource:org.acme.shipping.perishable.Grower#farmer@email.com'
composer card import -f grower1.card
composer identity issue -c admin@iot-perishable-network-advanced -f shipper1.card -u shipper1 -a 'resource:org.acme.shipping.perishable.Shipper#shipper@email.com'
composer card import -f shipper1.card
composer identity issue -c admin@iot-perishable-network-advanced --file importer1.card --newUserId importer1 --participantId 'resource:org.acme.shipping.perishable.Importer#supermarket@email.com'
composer card import -f importer1.card
composer identity issue -c admin@iot-perishable-network-advanced --file sensor_temp1.card --newUserId sensor_temp1 --participantId 'resource:org.acme.shipping.perishable.TemperatureSensor#SENSOR_TEMP001'
composer card import -f sensor_temp1.card
composer identity issue -c admin@iot-perishable-network-advanced --file sensor_gps1.card --newUserId sensor_gps1 --participantId 'resource:org.acme.shipping.perishable.GpsSensor#SENSOR_GPS001'
composer card import -f sensor_gps1.card
```
```
composer transaction submit -c grower1@iot-perishable-network-advanced -d  '{"$class": "org.acme.shipping.perishable.ShipmentPacked", "shipment": "resource:org.acme.shipping.perishable.Shipment#SHIP_001"}'
```
```
composer transaction submit -c shipper1@iot-perishable-network-advanced -d '{"$class": "org.acme.shipping.perishable.ShipmentPickup", "shipment": "resource:org.acme.shipping.perishable.Shipment#SHIP_001"}'
composer transaction submit -c shipper1@iot-perishable-network-advanced -d '{"$class": "org.acme.shipping.perishable.ShipmentLoaded", "shipment": "resource:org.acme.shipping.perishable.Shipment#SHIP_001"}'
```
```
composer transaction submit -c sensor_temp1@iot-perishable-network-advanced -d '{ "$class": "org.acme.shipping.perishable.TemperatureReading", "centigrade": 2, "shipment": "resource:org.acme.shipping.perishable.Shipment#SHIP_001"}'
composer transaction submit -c sensor_temp1@iot-perishable-network-advanced -d '{ "$class": "org.acme.shipping.perishable.TemperatureReading", "centigrade": 3, "shipment": "resource:org.acme.shipping.perishable.Shipment#SHIP_001"}'
composer transaction submit -c sensor_temp1@iot-perishable-network-advanced -d '{ "$class": "org.acme.shipping.perishable.TemperatureReading", "centigrade": 11, "shipment": "resource:org.acme.shipping.perishable.Shipment#SHIP_001"}'
```
```
composer transaction submit -c sensor_gps1@iot-perishable-network-advanced -d '{"$class": "org.acme.shipping.perishable.GpsReading", "readingTime": "2200", "readingDate": "20180412", "latitude": "40.6840", "latitudeDir": "N", "longitude": "74.0062", "longitudeDir": "W", "shipment": "resource:org.acme.shipping.perishable.Shipment#SHIP_001"}' 
```
```
composer transaction submit -c importer1@iot-perishable-network-advanced -d '{"$class": "org.acme.shipping.perishable.ShipmentReceived", "shipment": "resource:org.acme.shipping.perishable.Shipment#SHIP_001"}'
```
```
/home/dev/test/test/dist/test.bna

composer network install --card PeerAdmin@byfn-network-org1 --archiveFile test.bna
composer network start -c PeerAdmin@byfn-network-org1 -A admin -S adminpw -n test -V 0.0.1 -f networkadmin@byfn-network-org1.card
```
## hyperledger composer-playground
```
composer-playground
```
```
docker run --name composer-playground --publish 8080:8080 hyperledger/composer-playground
http://localhost:8080
```
## hyperledger composer angular
```
yo hyperledger-composer:angular

npm start
```
## composer-rest-server
```
cnpm install -g wscat
$ wscat -c ws://localhost:3000
connected (press CTRL+C to quit)
< {"$class":"org.acme.sample.SampleEvent","asset":"resource:org.acme.sample.SampleAsset#assetId:1","oldValue":"","newValue":"hello world","eventId":"a80d220b-09db-4812-b04b-d5d03b663671#0","timestamp":"2017-08-23T12:47:17.685Z"}
>
```
```
cnpm install -g passport-github
export COMPOSER_PROVIDERS='{
"github": {
    "provider": "github",
    "module": "passport-github",
    "clientID": "b2fd26644a3541f52709",
    "clientSecret": "4c2d455f401ef2869016c3a35c7e99240b134149",
    "authPath": "/auth/github",
    "callbackURL": "/auth/github/callback",
    "successRedirect": "/",
    "failureRedirect": "/"
}
}'
composer-rest-server -c admin@my-network -a true
curl -v http://localhost:3000/api/system/ping?access_token=xxxxx
curl -v -H 'X-Access-Token: xxxxx' http://localhost:3000/api/system/ping
```
```
composer-rest-server -c alice1@my-network -t -e /tmp/cert.pem -k /tmp/key.pem
```
```
npm install -g loopback-connector-mongodb

FROM hyperledger/composer-rest-server
RUN npm install --production loopback-connector-mongodb passport-github && \
    npm cache clean --force && \
    ln -s node_modules .node_modules
docker build -t myorg/my-composer-rest-server .

docker run -d --name mongo --network composer_default -p 27017:27017 mongo

COMPOSER_CARD=admin@my-network
COMPOSER_NAMESPACES=never
COMPOSER_AUTHENTICATION=true
COMPOSER_MULTIUSER=true
COMPOSER_PROVIDERS='{
    "github": {
        "provider": "github",
        "module": "passport-github",
        "clientID": "REPLACE_WITH_CLIENT_ID",
        "clientSecret": "REPLACE_WITH_CLIENT_SECRET",
        "authPath": "/auth/github",
        "callbackURL": "/auth/github/callback",
        "successRedirect": "/",
        "failureRedirect": "/"
    }
}'
COMPOSER_DATASOURCES='{
    "db": {
        "name": "db",
        "connector": "mongodb",
        "host": "mongo"
    }
}'
docker run \
    -d \
    -e COMPOSER_CARD=${COMPOSER_CARD} \
    -e COMPOSER_NAMESPACES=${COMPOSER_NAMESPACES} \
    -e COMPOSER_AUTHENTICATION=${COMPOSER_AUTHENTICATION} \
    -e COMPOSER_MULTIUSER=${COMPOSER_MULTIUSER} \
    -e COMPOSER_PROVIDERS="${COMPOSER_PROVIDERS}" \
    -e COMPOSER_DATASOURCES="${COMPOSER_DATASOURCES}" \
    -v ~/.composer:/home/composer/.composer \
    --name rest \
    --network composer_default \
    -p 3000:3000 \
    myorg/my-composer-rest-server
docker logs -f rest
```

## fabric  chaintool
```
git clone  https://github.com/hyperledger/fabric-chaintool.git
git clone  https://github.com/hyperledger/fabric-chaincode-java.git
git clone  https://github.com/hyperledger/fabric-chaincode-node.git
```
```
chaintool [general-options] action [action-options]
package -> Package the chaincode into a CAR file for deployment
ls -> List the contents of a CAR file
buildcar -> Build the chaincode project from a CAR file
inspect -> Retrieves metadata from a running instance
build -> Build the chaincode project
deps -> Download any missing dependencies for the project
env -> Display variables used in the build environment
proto -> Compiles a CCI file to a .proto
clean -> Clean the chaincode project
unpack -> Unpackage a CAR file
```

## fabric sdk 
```
cd $GOPATH/src/github.com/hyperledger

git clone   https://github.com/hyperledger/fabric-sdk-node.git
git clone   https://github.com/hyperledger/fabric-sdk-py.git
git clone   https://github.com/hyperledger/fabric-sdk-go.git
git clone   https://github.com/hyperledger/fabric-sdk-java.git
```
## fabric  samples
```
cd $GOPATH/src/github.com/hyperledger
git clone  https://github.com/hyperledger/fabric-samples.git
git clone  https://github.com/AliyunContainerService/solution-blockchain-demo.git

git clone  https://github.com/hyperledger/fabric-baseimage.git
git clone  https://github.com/hyperledger/fabric-test.git
git clone  https://github.com/hyperledger/fabric-test-resources.git


git clone  https://github.com/IBM-Blockchain/marbles.git
git clone  https://github.com/binhn/marbles-chaincode.git
git clone  https://github.com/IBM-Blockchain-Archive/cp-web.git
```



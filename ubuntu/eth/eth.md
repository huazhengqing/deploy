# eth
## eth 安装
```
mkdir -p $GOPATH/src/github.com/ethereum/
cd $GOPATH/src/github.com/ethereum/

git clone   https://github.com/ethereum/go-ethereum.git

sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install -y ethereum
```
## Remix
```
https://remix.ethereum.org/
```
```
sudo apt-get install -y solc
cnpm install -g solc
```
```
docker run ethereum/solc:stable solc --version
```
## OpenZeppelin
```
mkdir -p $HOME/dev/eth/src/github.com/OpenZeppelin/
cd $HOME/dev/eth/src/github.com/OpenZeppelin/

git clone      https://github.com/OpenZeppelin/zeppelin-solidity.git
git clone      https://github.com/OpenZeppelin/sample-crowdsale-starter.git
git clone      https://github.com/OpenZeppelin/ethernaut.git
git clone      https://github.com/OpenZeppelin/openzeppelin-website.git
git clone      https://github.com/OpenZeppelin/token-vesting-ui.git
git clone      https://github.com/OpenZeppelin/token-marketplace.git
```
## truffle
```
cnpm install -g ethereumjs-testrpc truffle embark zeppelin-solidity create-react-app ganache-cli
```
```
truffle init
truffle unbox tutorialtoken
truffle unbox pet-shop
npm install   zeppelin-solidity
truffle compile
truffle migrate
truffle test
npm run dev
```
## embark
```
embark demo
embark new AppName
embark blockchain
embark simulator
embark run
```
```
embark upload ipfs
```
## eg
```
mkdir -p $HOME/dev/eth/src/github.com/
cd $HOME/dev/eth/src/github.com/
git clone      https://github.com/fivedogit/solidity-baby-steps.git
git clone      https://github.com/dapperlabs/cryptokitties-bounty.git
git clone      https://github.com/Lunyr/crowdsale-contracts.git
```
```
mkdir -p $HOME/dev/eth/src/github.com/TokenMarketNet/
cd $HOME/dev/eth/src/github.com/TokenMarketNet/
git clone      https://github.com/TokenMarketNet/ico.git
```
```
mkdir -p $HOME/dev/eth/src/github.com/cryptomingbi/
cd $HOME/dev/eth/src/github.com/cryptomingbi/
git clone      https://github.com/cryptomingbi/cryptomingbi-website.git
git clone      https://github.com/cryptomingbi/cryptomingbi-poster.git
git clone      https://github.com/cryptomingbi/cryptomingbi-contract.git
```

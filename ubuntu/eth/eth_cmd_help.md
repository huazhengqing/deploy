# truffle
```
truffle <command> [options]
  init      Initialize new and empty Ethereum project
  compile   Compile contract source files
  migrate   Run migrations to deploy contracts
  deploy    (alias for migrate)
  build     Execute build pipeline (if configuration present)
  test      Run JavaScript and Solidity tests
  debug     Interactively debug any transaction on the blockchain (experimental)
  opcode    Print the compiled opcodes for a given contract
  console   Run a console with contract abstractions and commands available
  develop   Open a console with a local development blockchain
  create    Helper to create new contracts, migrations and tests
  install   Install a package from the Ethereum Package Registry
  publish   Publish a package to the Ethereum Package Registry
  networks  Show addresses for deployed contracts on each network
  watch     Watch filesystem for changes and rebuild the project automatically
  serve     Serve the build directory on localhost and watch for changes
  exec      Execute a JS module within this Truffle environment
  unbox     Download a Truffle Box, a pre-built Truffle project
  version   Show version number and exit
```
# embark
```
new [name]                          new application
demo                                create a working dapp with a SimpleStorage contract
build [environment]                 deploy and build dapp at dist/ (default: development)
run [options] [environment]         run dapp (default: development)
blockchain [options] [environment]  run blockchain server (default: development)
simulator [options] [environment]   run a fast ethereum rpc simulator
test [file]                         run tests
upload [platform] [environment]     upload your dapp to a decentralized storage. possible options: ipfs, swarm (e.g embark upload swarm)
```


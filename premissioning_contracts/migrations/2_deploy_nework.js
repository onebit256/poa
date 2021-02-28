const Network = artifacts.require('Network.sol');

mudule.exports = function(deployer) {
  deployer.deploy(Network);
}
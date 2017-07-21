var NeurealToken = artifacts.require("./NeurealToken.sol");

module.exports = function(deployer) {
  deployer.deploy(NeurealToken);
};

const smartContract = artifacts.require("./Transaction");

module.exports = function(deployer) {
  deployer.deploy(smartContract);
};

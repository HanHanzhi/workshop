const CaptureTheFlag = artifacts.require("CaptureTheFlag");

const WhitelistPaymaster = artifacts.require("WhitelistPaymaster");
const Relayhub = artifacts.require("RelayHub");

module.exports = async function (deployer) {
  const forwarder = require("../build/gsn/Forwarder").address;
  await deployer.deploy(CaptureTheFlag, forwarder);

  await deployer.deploy(WhitelistPaymaster);

  const pm = await WhitelistPaymaster.deployed();

  pm.setTrustedForwarder(forwarder);
  //tell the paymaster what is the while list address
  await pm.whitelistSender("0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1");
  //
  const relayHubAddress = require("../build/gsn/RelayHub.json").address;
  await pm.setRelayHub(relayHubAddress);

  const relayHub = await Relayhub.at(relayHubAddress);
  await relayHub.depositFor(pm.address, { value: 1 * 10 ** 18 });
};

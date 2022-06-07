/**
 * SPDX-License-Identifier:MIT
 */

 //gsnv2 guide fork

pragma solidity ^0.7.6;

import "@opengsn/contracts/src/BaseRelayRecipient.sol";

contract CaptureTheFlag is BaseRelayRecipient{
    
    event FlagCaptured(address previousHolder, address currentHolder);
    //now we need some boiler plate code to connect it to the gsn network
    constructor(address forwarder) {
        //trustedForwarder = forwarder;
        _setTrustedForwarder(forwarder);
    }
    string public override versionRecipient = "2.2.0";
    
    address public currentHolder = address(0);

    function captureTheFlag() external {
        address previousHolder = currentHolder;

        currentHolder = _msgSender();

        emit FlagCaptured(previousHolder, currentHolder);
    }
}

/**
 * SPDX-License-Identifier:MIT
 */

 //gsnv2 guide fork

pragma solidity ^0.7.6;

contract CaptureTheFlag is b{

    event FlagCaptured(address previousHolder, address currentHolder);

    address public currentHolder = address(0);

    function captureTheFlag() external {
        address previousHolder = currentHolder;

        currentHolder = msg.sender;

        emit FlagCaptured(previousHolder, currentHolder);
    }
}

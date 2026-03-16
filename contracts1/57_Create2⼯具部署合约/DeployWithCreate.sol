// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
contract DeployWithCreate{
    address public immutable owner;
    constructor(address _owner){
        owner=msg.sender;
    }
}
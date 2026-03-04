
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract GlobalVariables {
    function globleVars() external  view returns(address,uint,uint) {
     address sender=msg.sender;
     uint timestamp = block.timestamp;
     uint blockNum = block.number;
     return  (sender,timestamp,blockNum);
    }


}
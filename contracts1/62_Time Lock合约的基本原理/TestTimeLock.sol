// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract TestTimeLock{
    address public timelock;

    constructor(address _timelock){
        timelock=_timelock;
    }


    function getTimestamp() external  view returns(uint){
        return block.timestamp+100;
    }

    // function test() external {
    //     require(msg.sender==timelock,"caller is not timelock");
 // more code such as
 // - 升级合约
 // - 转移资产
 // - 修改预⾔机

    // }
}


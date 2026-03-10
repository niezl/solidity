// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TestA {
    uint256 public num;
    address public sender;
    uint256 public value;
    address public  owner;

    function setValue(uint _num) external payable {
        num=2*_num;
        sender=msg.sender;
        value=msg.value;  
    } 
}
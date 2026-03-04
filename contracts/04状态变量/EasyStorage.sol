
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EasyStorage {
    uint public  easyData = 100;
    function setEasyData(uint x) public {
        easyData=x;
    }
    
    function getEasyData() public view returns(uint){
        return easyData;
    }
}
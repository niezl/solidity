// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract CounterV2{
    uint public  count;

    function increment() public {
        count += 1;
    }

    function  dec() public {
        count-=1;
    }
    
}
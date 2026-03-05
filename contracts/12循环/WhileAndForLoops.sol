// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract WhileAndForLoops{

    function testWhile () public pure returns (uint) {
        uint i = 0; // initialize
        while (i < 10) { // condition
            i += 1; // increment
        }
        return i;
    }

    function testFor() public pure returns (uint) { 
     uint n=0;
     for(uint i=0;i<15;i++){
        n+=1;
     }

     return n;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

library ArrayUtils{
    // storage arr存储位置在链上
    function sum(uint[] storage arr) internal  view   returns(uint)  {
        uint total = 0;

        for(uint i=0; i<arr.length; i++){
         total+=arr[i];
        }

        return total;

    }
}
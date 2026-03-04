// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract Calculator{
    function multiply(uint x,uint y) external pure returns (uint) {
     return x*y;
    }

    function divide(uint x,uint y) external pure returns (uint) {
     return x/y;
    }
}
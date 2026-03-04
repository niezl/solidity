// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract Calculator{
    // • external:指该函数可以在部署合约后从外部被调⽤。
    // • pure:指该函数不会对区块链的状态进⾏写操作，仅⽤于执⾏读取计算。
    function multiply(uint x,uint y) external pure returns (uint) {
     return x*y;
    }

    function divide(uint x,uint y) external pure returns (uint) {
     return x/y;
    }
}
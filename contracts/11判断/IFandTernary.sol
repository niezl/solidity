// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract IFandTernary{

    // if eles 判断
    function ifElse(uint256 _x) external  pure returns (uint256) {
        if(_x < 10){
        return 1;
        }else if(_x < 20){
         return 2;   
        }else{
         return 5;
        }

    }

// 三元表达式
    function ternary(uint _x) external  pure returns(uint){
        return  _x < 10?1:5;
    } 
}
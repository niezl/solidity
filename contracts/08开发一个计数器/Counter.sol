// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter{

    uint public  count;
//自增
    function inc()  external returns(uint){
      return count+=1;
    }
//自减
    function dec() external  returns(uint) {
        return count-=1;
    } 
}
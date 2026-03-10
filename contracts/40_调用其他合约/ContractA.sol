// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract ContractA{
  uint public x ;
  uint public  value ;

  function setX(uint _x) external {
    x=_x;
  }

  function getX() external view returns(uint){
    return x;
  }

  function setXandReciveEther(uint _x) external payable{
     x=_x;
     value=msg.value;
  }

  function getXandReciveEther() external view returns(uint,uint){
   return (x,value);
  }


}
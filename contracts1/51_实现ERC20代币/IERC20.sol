// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
interface IERC20 {
  function totalSupply() external view  returns(uint);
  function balanceOf(address sender) external view returns(uint);
  function  transfer(address recipient,uint amount) external returns(bool);
  function  allowance(address owner,address sender) external view returns (uint);
  function  approve(address spender,uint amount) external returns(bool);
  function  transferFrom(address sender,address recipient,uint amount) external returns(bool);  
}
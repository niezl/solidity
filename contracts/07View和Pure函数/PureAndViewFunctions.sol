// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract PureAndViewFunctions{
    uint public  num;
//访问了状态变量
    function viewFunc() public view returns(uint){
        return  num;
    }
//对状态变量不可读并不可写
    function pureFunc() public  pure returns(uint){
        return  1;
    } 
// 访问了状态变量有参
   function addTonum(uint x) public  view returns(uint){
       return num+x;
   }
// 访问了状态变量有参
  function add(uint x,uint y) public  pure returns(uint){
   return  x+y;
  } 

}
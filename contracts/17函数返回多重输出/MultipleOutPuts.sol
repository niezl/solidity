// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultipleOutPuts{
   uint  public number ;   //public 不是以后才可以外表调用
   bool public flag;
   string public text;
//返回三个输出，分别是⼀个整数、⼀个布尔值和⼀个字符串
   function returnMultiple() public pure returns(uint,bool,string memory){
    return (256,true,"hello");
   } 
// 使⽤解构赋值从 returnMultiple() 捕获这三个输出并存储到合约的状态变量中。
   function captureOutputs() public {
    (number,flag,text)=returnMultiple();
   }
// 读取这些状态变量，并返回它们的值
   function showOutPuts() external  view returns (uint,bool,string memory){
     return (number,flag,text);
   }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract OwnableTest{
    address public  owner;
    constructor(){
        owner=msg.sender;
    }
// 用修饰符函数
    modifier onlyOwner(){
        require(msg.sender == owner,"not owner");
        _;
    }
// 合约所有者才能调用成功
    function updateOwner(address _newOwner) public onlyOwner{
        owner=_newOwner;
    }
// 需要访问状态变量所以用view，合约所有者才能调用成功
   function onlyOwnerCanCallThisFunc() external view onlyOwner returns(uint){
// code
    return 10;
   }
//没有访问权限    
   function anyOneCanCall() external pure  returns(uint) {
    return 100;
// code
   }

}
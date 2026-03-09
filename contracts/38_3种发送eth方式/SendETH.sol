// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SendETH{

    
    event Log(uint amount,uint gas);
//    通过此方法才能够向合约转发eth
    function disposit() external payable {

    }
    
    receive() external payable { }

    function sendByTansfer(address  payable to,uint amount) public  {
        to.transfer(amount);
    }
    
    function sendBySend(address payable to,uint amount) public returns (bool){
        bool success = to.send(amount);
        require(success,"send fail");
        return success;

    }


    function sendByCall(address payable to,uint amount) public returns (bool){
        (bool success,) = to.call{value:amount}("");
         require(success,"send fail");
        return success;
    }




}
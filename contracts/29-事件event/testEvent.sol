// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract testEvent{
    event LogMsg(address indexed  _from ,address indexed  _to,string text);
    event Log(string log,uint dex);
    event IndexedLog(address indexed  sender,uint val);


// 触发事件
    function senLogMsg(address to,string calldata text) external {
        emit LogMsg(msg.sender, to, text);
    }
// 不能写成  0309
    function example() external {
     emit Log("zhangsan", 309);
     emit IndexedLog(msg.sender, 2026);
    }



}
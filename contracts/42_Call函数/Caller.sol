// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Caller{
bytes public  data;

// 用call函数调用TestCall的foo方法

function callFoo(address taddr) external    payable {
   (bool success,bytes memory _data)= taddr.call{value:msg.value}(abi.encodeWithSignature("foo(string,uint256)", "call foo",123));
    require(success,"call failed");
    data=_data; 
}

// 用call函数调用TestCall的不存在方法

function callNotExist(address taddr) external payable {
    (bool success,bytes memory _data)= taddr.call{value:msg.value}(abi.encodeWithSignature("callNotExist()"));
    require(success,"call failed");
}
}

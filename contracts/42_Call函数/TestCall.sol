// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TestCall{
    string public message;
    uint public x;

    event Log(address indexed caller, string message, uint256 amount);

    receive() external payable { }

    // fallback() external payable { 
    //     emit Log(msg.sender, "Fallback was called", msg.value);
    // }
    
    function foo(string memory _message, uint256 _x) public payable  returns (bool,uint) {
        message = _message;
        x = _x;
        // emit Log(msg.sender, message, x);

        return (true,10000);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TestImmutable {
    address public  immutable owner;
    constructor(){
        owner=msg.sender;
    }

    function set(address _owner) public{
        // owner=_owner;   报错，是不可以再次修改，常量相比多了一个初始化。
    }

    function foo() public view  returns(string memory){
        require(msg.sender==owner,"not owner");
        return "success";
    }

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SimpleConstructor{
    uint public  x;
    address public  owner;
    constructor (uint _x){
        x=_x;
        owner=msg.sender;
    } 
}
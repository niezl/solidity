// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Account{
    address public  owner;
    constructor(address _owner) payable {
        owner=_owner;
    }
}
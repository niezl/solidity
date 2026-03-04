
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract State_Variables{
    uint public state_var=123;
    function foo()  external {
        uint notstatevar=345;
    }
}
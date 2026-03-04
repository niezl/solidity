
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract LocalVariablesExample{
    uint public i=0;
    bool public b=false;
    address public  addr= address(0);
    function updatevariables() public {
        //申明局部变量
        uint x=123;
        bool f=false;
        //更新局部变量
        x += 456;
        f = true;
        //更新状态变量
        i=123;
        b=true;
        addr=address(1);
        // 局部变量在函数执⾏完毕后不会保留修改
    }
}
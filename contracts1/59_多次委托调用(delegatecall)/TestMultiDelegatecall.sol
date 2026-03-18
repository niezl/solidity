// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "./MultiDelegatecall.sol";

 // Why use multi delegatecall? Why not multi call?
 // alice -> multi call --- call ---> test (msg.sender = multi call)
 // alice -> test --- delegatecall ---> test (msg.sender = alice)
contract TestMultiDelegatecall is MultiDelegatecall{
    event Log(address caller,string func_name,uint256 i);

    mapping(address=>uint256) public  balanceOf; 

    function func1(uint256 x, uint256 y) external  {
        // msg.sender = alice
        emit Log(msg.sender ,"func1",x+y);
    }

    function func2() external  returns(uint256)  {
     emit Log(msg.sender, "func2", 2);
     // msg.sender = alice
     return 222;
    }

    function mint() external payable  {

        balanceOf[msg.sender] = msg.value;

    }

}
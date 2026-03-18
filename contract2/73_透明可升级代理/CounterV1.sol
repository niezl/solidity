// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract CounterV1{
    uint256 public  count;
    function increment() public {
        count += 1;
    }

    function admin() public pure  returns(address){
    return address(1);
    }

    function implementation() public  pure returns (address){
        return  address(2);
    }

}

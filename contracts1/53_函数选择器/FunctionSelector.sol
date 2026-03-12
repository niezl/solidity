// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// 参数："transfer(address,uint256)"
//结果   0xa9059cbb
contract FunctionSelector{
    function functionSelector(string calldata _func) external pure returns(bytes4){
    return bytes4(keccak256(bytes(_func))); 
    }

}
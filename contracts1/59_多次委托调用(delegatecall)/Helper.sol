// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "./TestMultiDelegatecall.sol";
contract Helper{
// 获取func1函数的二进制字节码
    function getFuncData(uint256 x,uint256 y) external pure returns(bytes memory) {
        return abi.encodeWithSelector(TestMultiDelegatecall.func1.selector,x,y);
    }
// 获取func2函数的二进制字节码
    function getFuncData2() external  pure returns (bytes memory) {
        return abi.encodeWithSelector(TestMultiDelegatecall.func2.selector);
    }
// 获取mint函数的二进制字节码
    function getMintData() external pure  returns(bytes memory){
        return  abi.encodeWithSelector(TestMultiDelegatecall.mint.selector);
    }
}
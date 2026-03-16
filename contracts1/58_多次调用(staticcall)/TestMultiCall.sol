// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract TestMultiCall{
    function func1() external view  returns(uint,uint){
        return (1,block.timestamp);
    }
    function func2() external view  returns(uint,uint){
        return (1,block.timestamp);
    }
// 
    function getFuncData1() external pure returns (bytes memory){
        return abi.encodeWithSelector(this.func1.selector);
    }
// 
    function getFuncData2() external pure returns (bytes memory){
        return  abi.encodeWithSelector(this.func2.selector);
    }

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SimpleCalldata{
    string public text;

    function set(string calldata _text) external  {
    //    _text="dfsadf"; calldata 不能修改
        text=_text;
    }


    function get() public view returns(string memory){
        return text;
    }
}
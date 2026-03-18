// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface  IERC20 {

    function totalSupply() external view returns (uint256);
    function approve(address to ,uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    // 查询spender是否为批准
    function allowance(address owner, address spender) external view returns (uint256);
    function transferFrom(address spender,address recipient,uint256 amount) external    returns (bool);   
}

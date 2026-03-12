// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
interface IERC20 {
/**
* @dev 释放条件：当 value 单位的货币从账⼾ (from) 转账到另⼀账⼾ (to)时.
*/
event Transfer(address indexed from, address indexed to, uint256 value);
/**
* @dev 释放条件：当 value 单位的货币从账⼾ (owner) 授权给另⼀账⼾ (spender)时.
*/
event Approval(address indexed owner, address indexed spender, uint256
value);


/**
* @dev 返回代币总供给.
*/
function totalSupply() external view returns (uint256);

 /**
* @dev 返回账⼾account所持有的代币数.
*/
function balanceOf(address account) external view returns (uint256);
/**
* @dev 转账 amount 单位代币，从调⽤者账⼾到另⼀账⼾ to.
*
* 如果成功，返回 true.
*
* 释放 {Transfer} 事件.
*/
function transfer(address to, uint256 amount) external returns (bool);

/**
* @dev 返回owner账⼾授权给spender账⼾的额度，默认为0。
*
* 当{approve} 或 {transferFrom} 被调⽤时，allowance会改变.
*/
function allowance(address owner, address spender) external view returns
(uint256);
/**
* @dev 调⽤者账⼾给spender账⼾授权 amount数量代币。
*
* 如果成功，返回 true.
*
* 释放 {Approval} 事件.
*/
function approve(address spender, uint256 amount) external returns (bool);

/**
* @dev 通过授权机制，从from账⼾向to账⼾转账amount数量代币。转账的部分会从调⽤者的
allowance中扣除。
*
* 如果成功，返回 true.
*
* 释放 {Transfer} 事件.
*/
function transferFrom(
address from,
address to,
uint256 amount
) external returns (bool);

}
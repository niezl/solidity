// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./Account.sol";
contract AccountFactory{
    // 账号列表
    Account[] public accounts;

    function newAccount(address owner) external payable  {
    require(msg.value>=1000,"Not enough ether sent");
    Account  account = new Account{value: 1000}(owner);
    accounts.push(account);
    

    }

}
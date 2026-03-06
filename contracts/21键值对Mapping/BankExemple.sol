// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankExemple{
// 记录每个调用者转入的 eth 的账本
mapping(address=>uint) public  balances;

//王合约中存放eth
//deposit  存入
function deposit() public  payable {
    balances[msg.sender]+=msg.value;
}

//从合约中提取eth
// withdraw提取
function withdraw(uint amount) public {
    require(balances[msg.sender]>=amount,"Insufficient balance");
    payable(msg.sender).transfer(amount);
    // 减去提取的金额
    balances[msg.sender]-=amount;

}
// 检查调用者转入的eth
function  chechAmount() public  view returns(uint){
    return balances[msg.sender];
}

}
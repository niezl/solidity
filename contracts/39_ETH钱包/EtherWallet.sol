// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;
contract EtherWallet{

    address payable  public  owner;

    constructor() {
        owner=payable(msg.sender); 
    }

    receive() external payable { }

    function withdraw(uint amount) external {
    require(msg.sender==owner,"caller is not owner");
    require(address(this).balance>=amount,"balance  < amount ");
    payable(msg.sender).transfer(amount);
    // (bool success,) = payable(msg.sender).call{value:amount}("");
    }


    function getBanlance() external view returns (uint balance) {
        return address(this).balance;
    }
}
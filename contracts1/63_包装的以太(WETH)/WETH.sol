// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract WETH is ERC20{
    // 充值事件
   event Deposit(address indexed  acoount,uint amount);
    // 
    event Withdraw(address indexed acoount,uint amount);
// name is Wrapped Ether  symbol is WETH
    constructor() ERC20("Wrapped Ether", "WETH") { }    
  



fallback() external  payable { 
    deposit();
}

    function deposit() public payable {
        _mint(msg.sender, msg.value);
        emit  Deposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) public payable {
        _burn(msg.sender, amount); // burn the tokens
        payable(msg.sender).transfer(msg.value); // transfer the ETH
        emit Withdraw(msg.sender, msg.value);
    }
    

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "./IERC20.sol";
contract ERC20 is IERC20 {
// 注意：⽤ override 修饰 public 变量，会重写继承⾃⽗合约的与变量同名的 getter 函数，⽐
// 如 IERC20 中的 balanceOf() 函数。0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
mapping(address => uint256) public override balanceOf; 
mapping(address => mapping(address => uint256)) public override allowance;  //授权额度
uint256 public override totalSupply; // 代币总供给
string public name; // 名称
string public symbol; // 代号
uint8 public decimals = 18; // ⼩数位数

constructor(string memory name_, string memory symbol_){
    name = name_;
    symbol = symbol_;
}

// • transfer() 函数：实现 IERC20 中的 transfer 函数，代币转账逻辑。调⽤⽅扣除
// amount 数量代币，接收⽅增加相应代币。⼟狗币会魔改这个函数，加⼊税收、分红、抽奖等逻辑。
function transfer(address recipient, uint amount) external override returns
(bool) {
balanceOf[msg.sender] -= amount;
balanceOf[recipient] += amount;
emit Transfer(msg.sender, recipient, amount);
return true;
}


// • approve() 函数：实现 IERC20 中的 approve 函数，代币授权逻辑。被授权⽅ spender 可
// 以⽀配授权⽅的 amount 数量的代币。 spender 可以是EOA账⼾，也可以是合约账⼾：当你⽤
// uniswap 交易代币时，你需要将代币授权给 uniswap 合约。
function approve(address spender, uint amount) external override returns
(bool) {
allowance[msg.sender][spender] = amount;
emit Approval(msg.sender, spender, amount);
return true;
}

// transferFrom() 函数：实现 IERC20 中的 transferFrom 函数，授权转账逻辑。被授权⽅
// 将授权⽅ sender 的 amount 数量的代币转账给接收⽅ recipient 。
function transferFrom(
address sender,
address recipient,
uint amount
) external override returns (bool) {
//授权允许额度需要减少 
allowance[sender][msg.sender] -= amount;
//总额度需要减少
balanceOf[sender] -= amount;
// 接收者需要增加
balanceOf[recipient] += amount;
emit Transfer(sender, recipient, amount);
return true;
}

// mint() 函数：铸造代币函数，不在 IERC20 标准中。这⾥为了教程⽅便，任何⼈可以铸造任意
// 数量的代币，实际应⽤中会加权限管理，只有 owner 可以铸造代币：
function mint(uint amount) external {
balanceOf[msg.sender] += amount;
totalSupply += amount;
emit Transfer(address(0), msg.sender, amount);
}

// burn() 函数：销毁代币函数，不在 IERC20 标准中。
function burn(uint amount) external {
balanceOf[msg.sender] -= amount;
totalSupply -= amount;
emit Transfer(msg.sender, address(0), amount);
}



} 
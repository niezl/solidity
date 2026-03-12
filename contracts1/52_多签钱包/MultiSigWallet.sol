// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
contract MultiSigWallet{
    event Deposit(address indexed  sender,uint amount);
    event Submit(uint indexed  txId);
    event Approve(address indexed owner,uint indexed txId);
    event Revoke(address indexed owner,uint indexed  txId);
    event Execute(uint indexed  tXId);

    struct Transaction{
        address to;
        uint value;
        bytes data;
        bool executed; 
    }


    // 申请状态变量
    address[] public  owners;
    mapping (address=>bool) public isOwner;
    // 必须的最少批准数
    uint public required;

    Transaction[]  public  transactions;

    mapping(uint=>mapping(address=>bool) ) public approved;

    // 拦截ower以外的用户
    modifier  onlyOwner(){
        require(isOwner[msg.sender],"current caller is not oner");
        _;
    }

    // 拦截大于交易长度的txId
    modifier  txExists(uint txId){
        require(txId<transactions.length,"tx not exist");
        _;
    }
   //拦已经授权的交易
   modifier notApproved(uint txId){
    require(!approved[txId][msg.sender],"tx already approved");
    _;
   }

   //拦截已经执行的交易
   modifier  notExecuted(uint txId){
   require(!transactions[txId].executed==false,"tx already executed");
   _;
   }

// 初始化owner列表
   constructor(address[] memory _owners,uint _required){
    require(_owners.length>0,"owners require");
    require(_required>0&&_required<_owners.length, "invalied required number");
    for(uint i=0;i<owners.length;i++){
        address owner=owners[i];
        // 验证地址是否合法
        require(owner!=address(0),"invalid owner");
        // 验证是否已经是owner
        require(!isOwner[owner],"owner not unique");
        isOwner[owner]=true;
        // 放入owner列表中
        owners.push(owner);    
    }

     required=_required;
   }

// 向钱包转eth
receive() external payable { 
    emit Deposit(msg.sender, msg.value);
}

// 提交交易
function submit(address _to,uint _value,bytes calldata _data) external onlyOwner{

    transactions.push(Transaction(
        _to,
        _value,
        _data,
        false
    ));

    emit Submit(transactions.length-1);

}
// 交易授权
// 检查调用者是否为onwner、交易id是否存在、检查是否已经受过权、检查是否已经执行
function approve(uint _txId) external onlyOwner notApproved(_txId) txExists(_txId) notExecuted(_txId) {
    approved[_txId][msg.sender]=true;
    emit Approve(msg.sender, _txId);
}

// 查询当前交易id授权数量

function _getApprovalCount(uint txId) private  view  returns (uint){
    uint count=0;
    for(uint i=0;i<owners.length; i++){
        if(approved[txId][owners[i]]){
          count+=1;
        }
    }

    return count;
}


// 执行交易
// 检查调用者是否为owner、交易id是否存在、检查是否已经执行
function execute(uint _txId) external onlyOwner txExists(_txId) notExecuted(_txId)  {
// require(!approved[_txId][msg.sender],"already approved")
//判断交易对应的授权数大于最小批准授权数 required
require(_getApprovalCount(_txId) >= required, "approvals < required");
Transaction storage transaction=transactions[_txId];
transaction.executed=true;
(bool success,)=transaction.to.call{value:transaction.value}(transaction.data);
require(success,"tx fail");
emit Execute(_txId);

}
//取消授权

function revoke(uint _txId) external onlyOwner txExists(_txId){
require(approved[_txId][msg.sender],"already approved");
approved[_txId][msg.sender]=false;
emit Revoke(msg.sender,_txId);
}
}
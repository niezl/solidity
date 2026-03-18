// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
contract TimeLock{
    error NotOwnerError();
    error AlreadyQueuedError();
    error TimestampNotInPassedError(uint blockTimestamp,uint timestamp);
    error NotQueuedError(bytes32 txId);
    error TimestampNotPassedError(uint blockTimestamp,uint timestamp);
    error TimestampExpiredError(uint blokTimestamp,uint expiredAt);
    error TxFailedError();

    event Queue(bytes32 txId,address indexed  target,uint value,string func,bytes data,uint timestamp);
    event Execute(bytes32 txId,address indexed  target,uint value,string func,bytes data,uint timestamp);
    event Cancel(bytes32 txId);


    mapping (bytes32=>bool) public queued;
    address public owner;
    uint public  constant MIN_DAILY=10;
    uint public  constant MAX_DAILY=1000;
    uint public  constant GRACE_PERIVOD=1000;
// 接受以太
    receive() external payable { }
// 初始化onwer
    constructor(){
        owner=msg.sender;
    }

    // 连接非拥有者
    modifier  onlyOwner(){
        // require(msg.sender==owner,"not owner");
        // _;
        if(msg.sender!=owner){
            revert NotOwnerError();
        }
        _;
    }
    // 计算txId都
    function getTxId(address _target , uint _value,string calldata _func,bytes calldata _data, uint _timestamp)
    public  pure returns(bytes32){
    return keccak256(abi.encode(_target,_value,_func,_data,_timestamp));
    }
    // 事务提交,onwer才能调用此方法
    // ---|------------|---------------|-------
    // block block + min block + max
    function queue(address _target,uint _value,string calldata _func,bytes calldata _data,uint _timestamp) external  onlyOwner{
    bytes32 txId=getTxId(_target,_value,_func,_data,_timestamp);
    // 判断txId是否添加到queue
      if(queued[txId]){
        revert AlreadyQueuedError();
      }
    // 时间小于最小设定上时间或大于最大设定时间抛出错误
    if(_timestamp < block.timestamp + MIN_DAILY || _timestamp > block.timestamp + MAX_DAILY){
        revert TimestampNotInPassedError(block.timestamp,_timestamp);
    }
// 事务加入到队列
     queued[txId] = true;
     emit Queue(txId, _target, _value, _func, _data, _timestamp);
    }

// 事务执行

 function execute(address _target, uint _value, string calldata _func, bytes calldata _data, uint _timestamp) 
 external  payable onlyOwner returns (bytes memory){
    //获取事务id
     bytes32 txId=getTxId(_target,_value,_func,_data,_timestamp);
    //  如果不在queued中抛出异常
     if(!queued[txId]){
        revert NotQueuedError(txId);
     }
// 执行时间还没到
     if(block.timestamp<_timestamp){
        revert TimestampNotPassedError(block.timestamp,_timestamp);
     }
 // ----|-------------------|-------
 // timestamp timestamp + grace period
//  当前时间大于失效时间 抛出异常 TimestampExpiredError
    if(block.timestamp > _timestamp+GRACE_PERIVOD){
     revert TimestampExpiredError(block.timestamp,_timestamp+GRACE_PERIVOD);
    }
   queued[txId]=false;
// 获取数据
   bytes memory data;
   if(bytes(_func).length>0){
   data=abi.encodePacked(bytes4(keccak256(bytes(_func))),_data);
   }else{
    data=_data;
   }
// 任务执行
   (bool ok, bytes memory res) = _target.call{value:_value}(data);

   if(!ok){
    revert TxFailedError();
   }
  
   emit Execute(txId, _target, _value, _func, _data, _timestamp);

   return  res;

 }


//  取消交易

function cancel(bytes32 _txId) public onlyOwner returns (bool) {
    if(!queued[_txId]){
      revert  NotQueuedError(_txId);
    }
    queued[_txId]=false;

    emit Cancel(_txId);

    return  true;


}






}
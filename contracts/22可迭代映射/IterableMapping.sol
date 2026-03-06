// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract IterableMapping{
    //记录每个地址的余额
    mapping(address=>uint) public balances;
    //记录地址是否已存在
    mapping(address=>bool) public inserted;
    //记录所有地址
    address[] public addresses;
    // uint public length;
   //为地址添加额度
    function set(address addr,uint amount) public {
        balances[addr] = amount;
        if(!inserted[addr]){
            //数组中添加地址
            addresses.push(addr);
            //插入地址是否已存在
            inserted[addr] = true;
        }

    }
// 获取地址长度
    function getSize() external view  returns(uint){
        return addresses.length;
    }
// 获取首个地址的金额
    function first() public view returns(uint){

        return  balances[addresses[0]];

    }
// 获取最后一个地址的金额
    function last() public view returns(uint){
        return balances[addresses[addresses.length-1]];
    }
// 通过地址信息获取地址对应的余额
    function get(address addr) public view returns(uint){
        if(inserted[addr]){
            return balances[addr];
        }else{
            return 0;
        }
    }
// 通过索引获取地址对应的余额
    function getByIndex(uint index) public view returns(uint){
     require(index<addresses.length,"index is out of bound");
      address addr =addresses[index];
      if(inserted[addr]){
        return balances[addr];
      }else{
        return 0;
      }
    }
    



    
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EnumSimple {
 // 枚举创建 0、代表None，1代表Pending，2,Shipped 一次类推
   enum Status{
    None,Pending,Shipped,Completed,Reject,Canceled
   }

   Status public  status;
// 创建⼀个结构体 Order ，包含买家地址和订单状态
   struct Order{
    address buyer;
    Status status;
   }

   
// 添加新订单到数组
   Order[] public  orders;
// 获取枚举
 function get() external  view  returns(Status){
    return status;
 }   
//设置枚举
function set(Status _status) external   {
    status=_status;
}
// 将ship设置为2
function setShip() external {

    status=Status.Shipped;

}
// 0
function reset() external {
    delete status;
}


 
}
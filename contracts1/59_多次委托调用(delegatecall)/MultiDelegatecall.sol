// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract MultiDelegatecall{
    error MultiDelegatecallFail();
    // 多重委托调⽤函数
    // ["0x3cb8008500000000000000000000000000000000000000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000006","0xb1ade4db","0x1249c58b"]
    function  multiDelegatecall(bytes[] calldata data) external  payable returns (bytes[] memory  result){
        // 初始化结果数组
        result=new bytes[](data.length);
        // 依次执⾏每个函数调⽤
        for(uint i=0;i<data.length;i++){
           (bool success,bytes memory ret)=address(this).delegatecall(data[i]);
           // 检查函数调⽤是否成功
            if(!success){
                revert MultiDelegatecallFail();
            }
            // 存储函数调⽤结果
            result[i]=ret;
        }
        return  result;
    }


    // 



    
}
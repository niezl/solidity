// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DataLocations{
    struct MyStruct{
    uint x;
    string txt;
    }
    mapping(address=>MyStruct) mystructs;

    function _internal(uint[] calldata y) private pure  {
     uint x=y[0];
    }
    
    function examples(uint[] calldata y,uint [] calldata s) external returns ( uint[] memory)  {
         mystructs[msg.sender]=MyStruct(124,"aaa");
        //修改链上的数据
         MyStruct storage myStruct=mystructs[msg.sender];
         myStruct.x=345;
         //只是读取链上的数据
         MyStruct memory readOnlymyStruct=mystructs[msg.sender];
         readOnlymyStruct.x=789;

         _internal(y);

         uint[] memory memArr= new uint[](3);

         memArr[0]=4;

         return memArr;



    }


}
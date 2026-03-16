// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract MultiCall{
    // ["0x950B0e278696d7140F22aCaF476abD2080bbE37f","0x950B0e278696d7140F22aCaF476abD2080bbE37f"]
    // ["0x74135154","0xb1ade4db"]

    function multiCall(address[] calldata addrs,bytes[] calldata datas) external  view returns(bytes[] memory){
     require(addrs.length == datas.length,"addrs.length !=datas.length");
     bytes[] memory res= new bytes[](datas.length);

     for(uint i=0; i<datas.length; i++){
        // staticcall
        (bool success,bytes memory result)=addrs[i].staticcall(datas[i]);
        require(success,"staticcall failed");
        res[i]=result;
        // res.push(result);
        return res;
     }


    }
}
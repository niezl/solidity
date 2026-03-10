// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import  "./ContractA.sol";

contract CallerContract {

    function setXContractA(address taddr,uint x)external  {
        ContractA contractA = ContractA(taddr);
        contractA.setX(x);
    }

    function getXContractA(address taddr) external view returns ( uint){
        ContractA contractA = ContractA(taddr);
        return contractA.getX();
        
    }
// 必须加payable
   function setXandETH(address taddr,uint x) external payable  {
      ContractA contractA = ContractA(taddr);
      contractA.setXandReciveEther{value: msg.value}(x);

   }

//    
  function  getXandValueFromA(address taddr) external view returns(uint,uint){
    ContractA contractA = ContractA(taddr);
    return contractA.getXandReciveEther();
  }



}
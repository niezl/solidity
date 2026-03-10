// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./ICounter.sol";
contract CallCounter{
  ICounter public  icounter;
  uint public  count;

  constructor(address _icounter){
    icounter=ICounter(_icounter);
  }


  function inc() external {
    icounter.inc();
  }

  function updateCount() external {
    count=icounter.count();
  }


}
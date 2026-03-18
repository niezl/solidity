// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./StorageSlot.sol";
contract TestSlot{
    bytes32 public  constant SLOT = keccak256("test.slot");

    function getSlot() external  view returns(address){
      return  StorageSlot.getAddressSolt(SLOT).value;
    }

    function writeSlot(address addr) external  {
        StorageSlot.getAddressSolt(SLOT).value = addr;
    }

}
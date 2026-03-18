// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library StorageSlot{
    struct AddressSolt{
        address value;
    }
// 
    function getAddressSolt(bytes32 _slot) external  pure returns (AddressSolt storage r) {
     assembly {
         r.slot := _slot
     }
    }

    }  
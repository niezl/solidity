// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Counter {
    uint public  count;

    // function count() external view returns (uint256){
    //     return  count;
    // }

    function inc() external {
        count+=1;

    }
    
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

library MathLib{
    // 能不能用 external
    function min(uint x,uint y) internal   pure returns (uint){
      return x<y?x:y;
    }
}



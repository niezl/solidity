// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 继承顺序： 最上层的最优先

 /*
 X
 / |
 Y |
 \ |
 Z

 // X , Y, Z

 X
 / \
 Y A
 | |
 | B
 \ /
 Z

 // X, Y, A, B, Z
 */

contract ContractX {
function foo() public pure virtual  returns (string memory) {
    return "foo X";
}

function bar() public  pure  virtual  returns (string memory) {
  return "bar X";
}

function x() public  pure  returns (string memory) {

    return  "X";
}

}


contract ContractY is ContractX{

    function foo() public pure virtual  override  returns (string memory) {
    return  "foo Y";
    }

    function bar() public pure virtual  override  returns (string memory){
        return "bar Y";
    }

    function y() public  pure  returns (string memory) {
        return "y";
    }


}

contract  ContractZ is ContractX,ContractY{

    function foo() public pure override (ContractX,ContractY) returns (string memory){
    return "foo Z";
    }

   function bar() public pure override (ContractX,ContractY) returns (string memory){
    return "bar Z";
   }



}
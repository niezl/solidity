// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract  ContractA{
function foo() public pure virtual  returns (string memory) {
    return "A";
}

function bar() public  pure  virtual  returns ( string memory ) {
   return "A";
}


function baz() public  pure  returns ( string memory ) {

    return "A";
}

}


contract ContratB is ContractA {

    function foo() public  pure  override returns ( string memory ) {
        return  "B";
    }

    function bar() public  pure override returns ( string memory ) {
        return "B";
    }

}


contract ContratC is ContractA{

    function foo() public override pure returns ( string memory ) {
        return "C";
    }

}


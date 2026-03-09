// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
 /* Inheritance tree

 - direct
 - super
TestBase
 / \
 F G
 \ /
 H
 */
contract TestBase {
event Log(string msg);
function foo() public  virtual {
   emit Log("foo TestBase");
}

function bar() public   virtual {
    emit Log("bar TestBase");
}

}
// ⼦合约 F 继承⾃ TestBase
contract  F is TestBase{
    function foo() public virtual  override {
        emit Log("foo F");
        TestBase.foo();
    }

    function bar() public virtual  override {
        emit Log("bar F");
        TestBase.bar();
    }
}


// ⼦合约 G 继承⾃ TestBase

contract G is TestBase{
    function foo() public virtual override {
        emit Log("foo G");
        super.foo();
    }
    function bar() public virtual  override {
        emit Log("bar G");
        super.bar();
    }

}

// 复合继承合约 H 继承⾃ F 和 G

contract H is F, G {
  function foo() public override(F,G) {
    emit Log("foo H");
    F.foo();
    G.foo();
  }

  function bar() public  override(F,G){
    emit Log("bar H");
    super.bar();
  }

}


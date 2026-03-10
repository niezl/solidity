// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./TestA.sol";

 /*

 DelegatecallToTestA calls TestA, sends 100 wei
 TestA calls C, sends 50 wei
 DelegatecallToTestA ---> TestA ---> C
 msg.sender = TestA
 msg.value = 50
 execute code on C's state variable
 use eth in C


 DelegatecallToTestA calls TestA, sends 100 wei
 TestA delegatecall C
 DelegatecallToTestA ---> TestA ---> C
 msg.sender = DelegatecallToTestA
 msg.value = 100
 execute code on TestA's state variable
 use eth in B

 */
contract DelegatecallToTestA{
    uint256 public  num;
    address public sender;
    uint256 public value;

    function setValue(address _contract,uint256 _num) external  payable {
    //   (bool success,bytes memory data) = _contract.delegatecall(abi.encodeWithSignature("setValue(uint256)", _num));
      (bool success,) = _contract.delegatecall(abi.encodeWithSelector(TestA.setValue.selector, _num));

      require(success,"delegatecall fail");


    }

}
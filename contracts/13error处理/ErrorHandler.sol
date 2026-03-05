// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract ErrorHandling{
    uint num=234;
    error TestError(address addr,uint age);
//require: ⽤于输⼊验证和访问控制。例如，确保输⼊值 i ⼩于或等于10，否则抛出错误信息“i is greater than 10”
    function testRequire(uint i) public pure {
        require(i <= 10, "i is greater than 10");
    }
// revert: 适⽤于多层if语句中的条件检查。例如，如果 i ⼤于10，则使⽤ revert 抛出“i is greater than 10”。
    function testRevert(uint i) public  pure{
        if(i>10){
            revert("i is greater than 10");
        }
    }

// assert: ⽤于检查始终应为真的条件。例如，断⾔某状态变量 num 始终等于123，否则表明合约存在bug。
    function testAssert() public view{
        assert(num == 234);
    }
//    ⾃定义错误⽤于节省gas。
    function testError(uint i) public view {
    if(i>10){
        revert TestError(msg.sender,i);
    }
    }

}
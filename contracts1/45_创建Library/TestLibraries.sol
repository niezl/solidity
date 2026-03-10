// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import "./MathLib.sol";
import "./ArrayUtils.sol";

contract TestLibraries{
  // 把函数绑定到数据类型上
    using ArrayUtils for uint[];
    using MathLib for uint;
    uint[] public  numbers;

    constructor(){
        numbers=[1,2,3,4,5,6,7,8,9,10];
    }


    function testSum() external view returns(uint) {
     return numbers.sum();
    }

    function testMin(uint x,uint y) external pure returns(uint){
    //  return MathLib.min(x,y);   
    return x.min(y);
    }



}
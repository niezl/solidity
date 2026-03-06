// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ArrayReplaceLast{
    uint[] public arr=[1,2,3,4,5];
    // 不能对外部穿进来的数据pop
    function efficientRemove(uint index) public   returns(uint[] memory){
        uint lastValue= arr[arr.length-1];
        arr[index]=lastValue;
        arr.pop();
        return arr;

    }
// [1, 2, 3, 4] -- remove(1) --> [1, 4, 3]
// [1, 4, 3] -- remove(2) --> [1 ,4]
    function remove(uint _index) public  {
        uint lastValue= arr[arr.length-1];
        arr[_index]=lastValue;
        arr.pop();   
    }

    function test() public {
        arr = [1,2,3,4];
       remove(1);
      // [1, 4, 3]
       assert(arr.length == 3);
       assert(arr[0] == 1);
       assert(arr[1] == 4);
       assert(arr[2] == 3);
       remove(2);
    // [1 ,4]
       assert(arr.length == 2);
       assert(arr[0] == 1);
       assert(arr[1] == 4);
    }



}
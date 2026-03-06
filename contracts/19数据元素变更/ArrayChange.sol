// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ArrayChange{

    uint[] public  arr;
  
  //高效删除数组元素
  function efficientRemove(uint[] memory _arr,uint _index) public pure  returns ( uint[] memory){
   require(_index < _arr.length,"index is out of bound");
   _arr[_index]=_arr[_arr.length-1];
   uint[] memory newArr=new uint[](_arr.length-1);
    for(uint i=0;i<newArr.length;i++){
      newArr[i]=_arr[i];
    }
    return newArr;
  }
// 删除数组中的一个元素
 function exmple() external   payable   returns (uint[] memory){
    arr=[1,2,3,4,5,6,7,8,9,10];
    delete arr[1];
    return arr;
 }

//将数组_index位元素更改为_index+1
// [1, 2, 3] -- remove(1) -- [1, 3, 3 ] --> [1 ,3]
// [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5,6]
// [1] -- remove(0) --> [1] --> []
function remove(uint _index) public  {
    require(_index<arr.length,"index is out of bound");
    for(uint i=_index ;i<arr.length-1;i++){
        arr[i] = arr[i + 1];
    }
    arr.pop();
}

function test() external returns (uint[] memory){

    arr=[1,2,3,4,5];
    remove(2);
    // [1,2,4,5]
    assert(arr[0]==1);
    assert(arr[0]==2);
    assert(arr[0]==3);
    assert(arr[0]==4);
    assert(arr[0]==5);
    assert(arr.length == 4);

    arr = [1];
    remove(0);
 // []
    assert(arr.length == 0);

    return arr;


}


}
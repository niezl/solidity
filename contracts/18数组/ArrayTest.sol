// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract ArrayTest{
    // 初始化两个数组，⼀个动态数组 nums 初始化为 [1, 2, 3] ，⼀个固定⼤⼩数组
   // fixedNums 初始化为 [4, 5, 6] 。
    uint[] public nums=[1,2,3];
    uint[3] public numsFixed=[4,5,6];

    function testAarry() public {
        // 提供⼀个函数插⼊元素到动态数组 nums 。
        nums[1]=10; // [1,10,3]
       // 提供⼀个函数返回动态数组 nums 中的指定索引的元素。
        uint x = nums[1];
        // 提供⼀个函数⽤于更新动态数组 nums 中的元素。
        nums.push(20);// [1,10,3,20]
        // 提供⼀个函数删除动态数组 nums 的指定索引的元素。
        delete nums[2]; // [1,10,0,20]
        nums.pop(); // [1,10,0]
     // 提供⼀个函数返回动态数组 nums 的⻓度。
        uint len = nums.length;
    // create array in memory
        uint[] memory a=new uint[](5);
        a[1]=1234;


    }
}

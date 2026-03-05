// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FunctionModifier {
    // 是否暂停
    bool public paused;
    // 计数变量
    uint public count;

    // 设置是否暂停
    function setPaused(bool _paused) external   {
        paused=_paused;
    }
   // Function modifier - 代码重⽤
    modifier whenNotPaused(){
     require(!paused,"paused");
     _;
    }
// 先判断paused是否true增加
    function inc() external whenNotPaused {
        count+=1;
    }
// 先判断paused是否true减少
   function dec() external  whenNotPaused {
      count-=1;
   }

//
  modifier  cap(uint _x){
    require(_x>100,"_x<=100");
    _;
  }
//   先执行 whenNotPaused，条件满在执行cap，最后执行count+=_y;
function incBy(uint _y) external whenNotPaused cap(_y) {
    count+=_y;
}

// 
modifier  sandwich(){
    count+=1;
    _;
    count*=2;
}
//先执行 sandwich中的  count+=1;  在执行 foo中 count+=1;  在执行sandwich中的count*=2;
function foo() external sandwich {
    count+=1;
}


}
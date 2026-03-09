// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract VisibilityBase{
// 状态变量可见性
uint private  privateVar=1;
uint internal internalVar=2;
uint public  publicVar=3;

// 可见性函数

//私有函数只有本合约的其他方法调用
function privateFunc() private pure  returns(string memory str){
    return "Private function";
}
// 本合约和子类可以调用
function internalFunc() internal  pure  returns(string memory str){
    return "internal function";
}
//外部调用函数，只能外部调用
function externalFunc() external  pure  returns (string memory str){
    return "external function";
}
//内部、外部、其他合约、都可调用
function publicFunc() public  pure returns (string memory str){
    return "public fuction";
}

function testVisibility()public  view returns (string memory str){
    //访问状态变量
    uint x = privateVar; //可访问
    uint v= internalVar; //可访问
    uint p= publicVar; //可访问
    // 访问函数

    string memory privatefunc=privateFunc();  //可调⽤
    string memory internalfunc=internalFunc();  //可调⽤
    // string memory externalfunc=externalFunc();  //不能内部调用，会报错
    string memory externalfunc=this.externalFunc();  //能调用，不建议这样用
    string memory publicfunc= publicFunc();  //可调⽤
    return "sibility Test Passed";
}

}


contract VisibilityDerived is VisibilityBase{
    function testInheritedVisibility() public  view returns (string memory str){
        // uint x = privateVar; //不可访问私有函数
        uint y= internalVar;  //可以函数
        uint z= publicVar; 

        // 调用函数

        // string memory a= privteFunc(); //私有函数子类无法调用
        string memory b= internalFunc(); // 子类可以调用
        // string memory c=externalFunc(); // 外部方法，调用会报错
        string memory d=publicFunc();  //能调用
        
        return "Inherited Visibility Test Passed";
            
        }


        
    }
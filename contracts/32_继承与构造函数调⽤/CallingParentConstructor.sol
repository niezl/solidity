// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// 父合约S
contract ContractS{

    string public name;

    constructor(string memory _name){
        name=_name;
    }
}

// 父合约 T
contract ContractT{
    string public  text;
    constructor(string memory _text){
      text=_text;
    }

}

 
contract ContractU is ContractT("T"),ContractS("S"){


}


contract ContractV is ContractS,ContractT{

    constructor(string memory _name,string memory _text) ContractS(_name) ContractT(_text){


    }


}


contract ContarctVV is ContractS("s"),ContractT{

    constructor(string memory _text) ContractT(_text){
    }

}


// 执⾏顺序
// 1. S
// 2. T
// 3. V0
contract ContractV0 is ContractS,ContractT{
 
 constructor(string memory _name,string memory _text) ContractS(_name) ContractT(_text){

 }


}

// 执⾏顺序
// 1. S
// 2. T
// 3. V1
contract ContractV1 is ContractS,ContractT {
 constructor(string memory _name,string memory _text) ContractT(_text)  ContractS(_name){

 }
}

// 执⾏顺序
// 1. S
// 2. T
// 3. V2
contract ContractV2 is ContractT,ContractS {
 constructor(string memory _name,string memory _text) ContractT(_text)  ContractS(_name){

 }
}

// 执⾏顺序
 // 1. T
 // 2. S
 // 3. V3
contract ContractV3 is ContractT,ContractS {
 constructor(string memory _name,string memory _text) ContractS(_text)  ContractT(_name){

 }

}
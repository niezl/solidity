// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
 /*
 Alice：
 计算消息的哈希值：hash(message) = H
 ⽤她的私钥对哈希值进⾏签名：signature = Sign(H, Alice's private key)
 发送消息和签名给 Bob
 Bob：

 接收到消息和签名
 ⽤ Alice 的公钥对签名进⾏验证，得到哈希值：H' = Verify(signature, Alice's public
key)
 计算接收到消息的哈希值：H'' = hash(message)
 ⽐较 H' 和 H''，如果相等，消息未被篡改且确实来⾃ Alice
 */
contract HashFunc{
// keccak256  加密后的返回值类型是 bytes32
//参数 “1233”,3,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 返回值bytes32：0x75f4d617c42e7a3b0396b3ac3c1e6cec030456af9b513b02b13deace31b5ca9c

    function hash(string memory text,uint num,address  addr ) external  pure returns (bytes32) {
        return  keccak256(abi.encodePacked(text,num,addr));
    }

  // abi编码为字节码
//   参数“123”，“456”
// 返回字节码：0x000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000015e2809c313233e2809defbc8ce2809c343536e2809d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    function encode(string memory text0,string memory text1) external pure returns (bytes memory){
        return  abi.encode(text0, text1);
    }

// abi编码为字节码并压缩数据
//   参数“123”，“456”
// 返回字节码:0xe2809c313233e2809defbc8ce2809c343536e2809d
    function encodePacked(string memory text0,string memory text1) external pure returns (bytes  memory ) {
        return abi.encodePacked(text0,text1);
    }
//    哈希碰撞
//   “123”,1,“456”
// 返回值bytes32:0xe480e09bea6267990f48c9860cb47a61e1d48916ff50ac8374cae0778e3cb129
   function collision(string memory text0,uint x,string memory text1) external pure  returns (bytes32){
       return keccak256(abi.encodePacked(text0,x,text1));
   }

}
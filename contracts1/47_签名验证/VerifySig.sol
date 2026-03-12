// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/*
 0. message
 1. hash(message)
 2. sign(hash(message), private key) | offchain
 3. ecrecover(hash(message), signature) == signer
 */
contract VerifySig{
// 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266,"hello",ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
// ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
     function verify(address _signer, string memory message,string memory _sig) public pure returns (bool) {
        // 获取消息hash
         bytes32 _messageHash= getMessageHash(message);
        //  获取以太坊消息签名hash
         bytes32  ethSignedMessageHash= getEthSignedMessageHash(_messageHash);
       // 返回验证结果
        return  recover(ethSignedMessageHash, abi.encode(_sig)) == _signer;
     }
// 获取消息哈希
     function  getMessageHash(string memory _message) public  pure  returns ( bytes32) {
      return  keccak256(abi.encodePacked(_message));
     }
//  获取以太坊签名hash  \x19Ethereum Signed Message:\n32
    function  getEthSignedMessageHash(bytes32  _messageHash) public pure returns (bytes32) {
      return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32",_messageHash));
    }

// 
    function recover(bytes32 signedMessageHash,bytes memory _sig) public  pure  returns (address){
    (uint8 v, bytes32 r, bytes32 s)=split(_sig);
    return  ecrecover(signedMessageHash,v,r,s);

    } 


    function split(bytes memory _sig) internal  pure returns (uint8 v, bytes32 r, bytes32 s) {
        require(_sig.length == 65,"invalid signature length");
//     assembly 汇编里没有不需要分号
        assembly {
            r:=mload(add(_sig,32))
            s:=mload(add(_sig,64))
            v:=byte(0,mload(add(_sig,96)))
        }

    } 

}
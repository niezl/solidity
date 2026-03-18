// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./Proxy.sol";
contract ProxyAdmin{
    address public owner;

    constructor(){
        owner=msg.sender;
    }
// 连接非owner
   modifier  nolyOwner(){
    require(owner==msg.sender,"not owner");
    _;
   }

//获取代理合约管理员;

 function getProxyAdmin(address _proxy)external view returns(address){

    (bool success,bytes memory data) =   _proxy.staticcall(abi.encodeCall(Proxy.admin,()));
    require(success,"call failed");
    return  abi.decode(data,(address));

}

// 获取代理合约的合目标节约

function getProxyImplementation(address _proxy) external  view returns(address){
    (bool success,bytes memory data) = _proxy.staticcall(abi.encodeCall(Proxy.implementation,()));
     require(success,"call failed");
     return abi.decode(data, ( address ));
} 

// 更改代理合约的管理员地址

function changeAdmin(address payable _proxy,address newAdmin) external nolyOwner {
  Proxy(_proxy).changeAdmin(newAdmin);
}

// 通过代理合约升级目标合约

function upgradeTo(address payable _proxy,address newImplementation) external nolyOwner {
    Proxy(_proxy).upgradTo(newImplementation);

}


}
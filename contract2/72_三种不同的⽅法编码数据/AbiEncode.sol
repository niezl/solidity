// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./IERC20.sol";
contract AbiEncode{

    function test(address addr, bytes calldata data) public {
        (bool success,)=addr.call(data);
        require(success,"call failed");
     
    }

//参数： 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,1000
// 返回: 0xa9059cbb000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb200000000000000000000000000000000000000000000000000000000000003e8
    function encodeWithSignature(address _to ,uint amount) external pure  returns ( bytes memory) {

        return abi.encodeWithSignature("transfer(address,uint256)", _to,amount);

    }
// bytes: 0xa9059cbb000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb200000000000000000000000000000000000000000000000000000000000003e8
    function  encodeWithSelector(address _to,uint amount) external pure  returns ( bytes memory) {
        return  abi.encodeWithSelector(IERC20.transfer.selector, _to,amount);
    }


//参数： 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,1000
// 返回:  0xa9059cbb000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb200000000000000000000000000000000000000000000000000000000000003e8
    function encodeCall(address _to,uint amount) external pure  returns ( bytes memory){
        return  abi.encodeCall(IERC20.transfer,(_to,amount));
    }
}
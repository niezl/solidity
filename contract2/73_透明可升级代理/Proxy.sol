// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./StorageSlot.sol";
contract Proxy{

    bytes32 private  constant implements_SOLT= bytes32(uint(keccak256("eip1967.proxy.implementation"))-1); //SOLT
    bytes32 private  constant admin_SOLT=bytes32(uint(keccak256("eip1967.proxy.admin"))-1); //SOLT

    constructor() {
        _setAdmin(msg.sender);
    }
//    将管理员地址存储在 admin_SOLT 的槽位上
    function _setAdmin(address _admin) private {
      require(_admin!=address(0),"_admint = address(0)");
      StorageSlot.getAddressSolt(admin_SOLT).value = _admin; //SOLT
    }
//    获取存储在admin_SOLT 槽位上的管理原地址
    function _getAdmin() private view returns(address){
      return  StorageSlot.getAddressSolt(admin_SOLT).value;
    }


    function _getImplementation() private  view returns ( address ){
        return  StorageSlot.getAddressSolt(implements_SOLT).value;
    }
//    将Implementation地址存储在 implements_SOLT 的槽位上
    function _setImplementation(address _implements) private {
    require(_implements.code.length>0,"implementation code length = 0");
     StorageSlot.getAddressSolt(implements_SOLT).value = _implements;
    }

    function admin() external  ifAdmin returns ( address ) {
        return _getAdmin();
    }

    function implementation() external  ifAdmin returns ( address ) {
        return _getImplementation();
    }

    function _fallback() private {
        _delegate(_getImplementation());
    }

    // 接收以太时执行
    receive() external payable { 
        _fallback();
    }
    fallback() external payable {
        _fallback();
     }

  // 编写 非管理员拦截器

  modifier ifAdmin(){
    // require(msg.sender==_getAdmin(),"not admin");
    // _;
    if(msg.sender==_getAdmin()){
     _;
    }else{
        _fallback();
        _;

    }
  }

   function changeAdmin(address _admin) external ifAdmin{
    _setAdmin(_admin);
   }

   function upgradTo(address _implementation) external  ifAdmin{

    _setImplementation(_implementation);
   }

    function _delegate(address _implementation) private  {

        assembly{
        // Copy msg.data. We take full control of memory in this inline assembly
        // block because it will not return to Solidity code. We overwrite the
        // Solidity scratch pad at memory position 0.
        // calldatacopy(t, f, s) - copy s bytes from calldata at positionf to mem at position t
        // calldatasize() - size of call data in bytes
         calldatacopy(0, 0, calldatasize())
        // Call the implementation.
        // out and outsize are 0 because we don't know the size yet.
        // delegatecall(g, a, in, insize, out, outsize) -
        // - call contract at address a
        // - with input mem[in…(in+insize))
        // - providing g gas
        // - and output area mem[out…(out+outsize))
        // - returning 0 on error (eg. out of gas) and 1 on success
        let result :=delegatecall(gas(), _implementation, 0, calldatasize(), 0, 0)
        // Copy the returned data.
        // returndatacopy(t, f, s) - copy s bytes from returndata at position f to mem at position t
        // returndatasize() - size of the last returndata
        returndatacopy(0, 0, returndatasize())
        // delegatecall returns 0 on error.
        switch result
        case 0 {
         // revert(p, s) - end execution, revert state changes, return data mem[p…(p+s))
           revert(0, returndatasize())
               }
         default {
             // return(p, s) - end execution, return data mem[p…(p+s))
             return(0, returndatasize())
          }
        }

    
    }

  






    
}
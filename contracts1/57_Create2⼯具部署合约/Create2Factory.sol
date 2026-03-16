// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3; 
import "./DeployWithCreate.sol";
contract Create2Factory{
    event Deploy(address addr);

//  参数:: 666
// 		"from": "0xBc45c34fA3Eb75589fF3455Bd2d9410464205041",
		// "topic": "0x55ea6c6b31543d8e2ec6a72f71a79c0f4b72ed0d4757172b043d8f4f4cd84848",
		// "event": "Deploy",
		// "args": {
		// 	"0": "0x4c05dEBdEf958D97489Bbcf2f48895e4A877c774"  
		// }
    function deploy(uint _salt) external {
     DeployWithCreate    deployWithCreate = new DeployWithCreate{salt: bytes32(_salt)}(msg.sender);
        // DeployWithCreate    deployWithCreate =  new DeployWithCreate{salt: bytes32(_salt)}();
     emit Deploy(address(deployWithCreate));
    }

// 参数:0x60a060405234801561000f575f5ffd5b506040516101f93803806101f9833981810160405281019061003191906100c9565b3373ffffffffffffffffffffffffffffffffffffffff1660808173ffffffffffffffffffffffffffffffffffffffff1681525050506100f4565b5f5ffd5b5f73ffffffffffffffffffffffffffffffffffffffff82169050919050565b5f6100988261006f565b9050919050565b6100a88161008e565b81146100b2575f5ffd5b50565b5f815190506100c38161009f565b92915050565b5f602082840312156100de576100dd61006b565b5b5f6100eb848285016100b5565b91505092915050565b60805160f06101095f395f6046015260f05ff3fe6080604052348015600e575f5ffd5b50600436106026575f3560e01c80638da5cb5b14602a575b5f5ffd5b60306044565b604051603b919060a3565b60405180910390f35b7f000000000000000000000000000000000000000000000000000000000000000081565b5f73ffffffffffffffffffffffffffffffffffffffff82169050919050565b5f608f826068565b9050919050565b609d816087565b82525050565b5f60208201905060b45f8301846096565b9291505056fea26469706673582212209c4233ee537f0012798e1f4710baa077ed8b2643a69f6da86907a8f7a0461acc64736f6c634300081f00330000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4,666
// 返回:0x4c05dEBdEf958D97489Bbcf2f48895e4A877c774 
    function getAddress(bytes memory bytecode,uint _salt)   external view  returns(address){
        bytes32 hash = keccak256(abi.encodePacked(bytes1(0xff),address(this), _salt, keccak256(bytecode)));
        // bytes32 hash = keccak256(abi.encodePacked(bytes1(0xff),address(this), _salt, keccak256(bytecode)));
        return address(uint160(uint256(hash)));
    }
// 参数 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    function getBytecode(address _owner) public pure returns(bytes memory) {
       bytes memory bytecode = type(DeployWithCreate).creationCode;
       return abi.encodePacked(bytecode, abi.encode(_owner));
 }

}
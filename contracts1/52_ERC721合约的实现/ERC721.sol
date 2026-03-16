// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "./IERC721.sol";
import "./IERC721Receiver.sol";
contract ERC721 is IERC721{
//根据tokenId查询拥有者
mapping(uint256=>address) public  _owners;
//存储每个地址拥有的NFT数量
mapping (address=>uint256) public  _balances;
// tokanId对应的被授权
mapping ( uint256=>address) public _tokenApprovals;
// 账号是否被授权转发token
mapping (address=>mapping(address=>bool)) public  _operatorApprovals;

// 作用
function supportsInterface(bytes4 interfaceId) public pure virtual override returns (bool) {
   return interfaceId == type(IERC721).interfaceId || interfaceId == type(IERC165).interfaceId;
}

//获取账号下的tokenId
function balanceOf(address _owner) external virtual view  override  returns (uint256) {
  require(_owner!=address(0),"ERC721: balance query for the zero address");
  return _balances[_owner];
}

//根据tokenId查询他的拥有者
function ownerOf(uint256 _tokenId) external view virtual override returns (address) {
 address owner = _owners[_tokenId];
 require(owner!=address(0),"ERC721: balance query for the zero address");
 return owner;
}
//把tokenId授权给别的账号转发
function approve(address _to, uint256 _tokenId) external virtual override { 
 address  owner=_owners[_tokenId]; //获取tokenId的拥有者
 require(owner!=_to,"ERC721: approval to current owner");  //判断是否授权给自己，如果是返回异常
// 调用者必须是拥有者，调用者必须没有受过权
 require(msg.sender==owner || isApprovedForAll(owner,msg.sender) ,"ERC721: approve caller is not owner nor approved for all"); //判断授权账号是否是tokenId;
 _approve(_to,_tokenId);

}

// 给token授权给 其他账号
function _approve(address _approved, uint256 _tokenId) internal virtual {   //_approved授权账号  _tokenId授权
   _tokenApprovals[_tokenId]=_approved; //在_tokenApprovals里面记录授权信息
//    emit Approval(ERC721.ownerOf(_tokenId),_approved,_tokenId);  //发送事件
   emit Approval(this.ownerOf(_tokenId),_approved,_tokenId);  //发送事件
}

function getApproved(uint256 _tokenId) external view virtual returns (address) {   //获取授权信息
  require(_exists(_tokenId),"ERC721: approved query for nonexistent token"); //判断tokenId有没有拥有者;
  return _tokenApprovals[_tokenId];
}
// 判断 _spender是否授权，是否为_tokenId 的拥有者
function _isApprovedOrOwner(address _spender, uint256 _tokenId) internal view virtual returns (bool) {
  require(_exists(_tokenId),"ERC721: operator query for nonexistent token"); //判断tokenId有没有拥有者;
//   address _owner=ERC721.ownerOf(_tokenId); //获取tokenId的拥有者
//    address _owner=ownerOf(_tokenId); //获取tokenId的拥有者
   address _owner=this.ownerOf(_tokenId); //获取tokenId的拥有者
 return (_spender==_owner || _tokenApprovals[_tokenId]==_spender || isApprovedForAll(_owner,_spender));
}
// 判断操作员是否被授权
function isApprovedForAll(address owner, address operator) public view virtual override  returns (bool) {
    return _operatorApprovals[owner][operator];
}


function setApprovalForAll(address _operator, bool _approved) external virtual override {
    require(_operator!=msg.sender,"ERC721: approve to caller"); //判断授权账号是否是自己
    _operatorApprovals[msg.sender][_operator]=_approved; //记录授权信息
    emit ApprovalForAll(msg.sender,_operator,_approved);
}
//判断tokenId有没有拥有者
function _exists(uint256 _tokenId) internal view virtual returns (bool) {
return _owners[_tokenId] != address(0);
}

// 获取调用者
function _msgSender() internal view virtual returns (address) {
return msg.sender;
}

// token交易内部函数
function _transfer(address from,address to,uint256 _tokenId ) internal virtual {  
    // require(ERC721.ownerOf(_tokenId) == from, "ERC721: transfer of token that is not own"); //发送方必须是拥有者
    require(this.ownerOf(_tokenId) == from, "ERC721: transfer of token that is not own"); //发送方必须是拥有者
    require(to != address(0), "ERC721: transfer to the zero address"); //接收方不能是0地址;
    _approve(address(0), _tokenId);
    _balances[from] -= 1; //发送方的余额减少1
    _balances[to]+=1;//发送方的余额加1
    _owners[_tokenId] = to; //更新所有者

    emit Transfer(from, to, _tokenId);

}

// 安全 token交易
function _safeTransfer(address from,address to,uint256 _tokenId,bytes memory _data) internal  virtual {
   _transfer(from,to,_tokenId);
   require(_checkOnERC721Received(from,to,_tokenId, _data),"ERC721: transfer to non ERC721Receiver implementer");
   // require(to.code.length == 0|| IERC721Receiver(to).onERC721Received(msg.sender, from, _tokenId,"");== IERC721Receiver.onERC721Received.selector,"unsafe recipient");
}

// 检查
// 有了 private 就没有  virtual
function _checkOnERC721Received(address from,address to,uint256 _tokenId,bytes memory data) private  returns(bool){
//  if(to.isContract()){
//    try IERC721Receiver.onERC721Received(msg.sender,from,_tokenId,data) returns(bytes4 retval){
//      return retval == IERC721Receiver.onERC721Received.selector;
//    }catch (bytes memory reason){
//       if(reason.length==0){
//         revert("ERC721: transfer to non ERC721Receiver implementer");
//       }else{
//         assembly {
//           revert(add(32, reason), mload(reason))
//          }
//       }
//    }

//  }else  {
//     return  true;
//  }


   return  true;
}

function transferFrom(address _from,address _to,uint256 _tokenId) external  virtual override{
    // 判断调用者的权限， 要么有权限，要么是拥有者
    require(_isApprovedOrOwner(_msgSender(), _tokenId),"ERC721: transfer caller is not owner nor approved");

     _transfer(_from,_to,_tokenId);

}

function safeTransferFrom(address _from,address _to,uint256 _tokenId) external virtual override{
    // 判断调用者的权限， 要么有权限，要么是拥有者
  require(_isApprovedOrOwner(_msgSender(), _tokenId),"ERC721: transfer caller is not owner nor approved");
   _safeTransfer(_from,_to,_tokenId,"");
}


function safeTransferFrom(address _from,address _to,uint256 _tokenId,bytes memory data) external virtual override {
    // 判断调用者的权限， 要么有权限，要么是拥有者
  require(_isApprovedOrOwner(_msgSender(), _tokenId),"ERC721: transfer caller is not owner nor approved");
   _safeTransfer(_from,_to,_tokenId,data);
}


function  mint(address to ,uint256 tokenId) internal     {
    // 先判断地址收合法
    require(to != address(0),"ERC721: mint to the zero address");
    require(_owners[tokenId]==address(0),"token exists");
    _balances[to]++;
    _owners[tokenId]=to;
    emit Transfer(address(0),to,tokenId);
}


function _burn(uint256 tokenId) internal {
address owner=_owners[tokenId];
   require(owner != address(0),"ERC721: mint to the zero address");

    _balances[owner]--;
    delete _owners[tokenId];
    delete  _tokenApprovals[tokenId];
    emit Transfer(owner,address(0),tokenId);
    // emit Burn(owner,tokenId);
   

}
 

}

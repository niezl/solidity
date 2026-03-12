// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "./IERC165.sol";
interface  IERC721 is IERC165 {
    // 交易事件 
    event Transfer(address indexed from,address indexed to,uint256 indexed tokenId);
    // 授权事件
    event Approval(address indexed owner,address indexed approved,uint256 indexed  tokenId);
    // 授权所有事件
    event ApprovalForAll(address indexed  owner,address indexed  operator,bool approved);
    //查询拥有者的通证
    function balanceOf(address owner) external  view  returns(uint256 balance);
    // 查询tokenid属于谁
    function ownerOf(uint256 tokenId) external  view  returns (address owner);
    // 安全的通证交易
    function safeTransferFrom(address from,address to,uint256 tokenId) external;
    // 通证交易
    function transferFrom(address from,address to,uint256 tokenId) external;
    // 授权
    function approve(address to, uint256 tokenId) external;
     // 查询授权
    function getApproved(uint256 tokenId) external view returns (address operator);
    // 授权所有
    function setApprovalForAll(address operator,bool _approved) external;
    // 查询授权所有
    function isApprovedForAll(address owner,address operator) external view returns (bool);
    function safeTransferFrom(address from,address to,uint256 tokenId,bytes calldata data) external;   
}
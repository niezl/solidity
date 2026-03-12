// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AccessControl{
    // 给用户账号授予决金额
    event GrantRole(bytes32 indexed role,address indexed  account);
    //  给用户撤销角色
    event RevokeRole(bytes32 indexed role,address indexed  account);
    // role => account => bool
    mapping(bytes32=>mapping(address=>bool)) private _roles;
    // admin 管理员角色
    // 0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 private constant ADMIN_ROLE = keccak256(abi.encodePacked("ADMIN"));
    // user  普通角色
    // 0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    bytes32 private constant USER_ROLE=keccak256(abi.encodePacked("USER"));
   // 初始化管理员角色授予给部署地址
    constructor() {
        _grantRole(ADMIN_ROLE, msg.sender);
    }
// 权限管理函数
    modifier  onlyRole(bytes32 role){
        require(_roles[role][msg.sender],"not authrized");
        _;
    }

// 为账号分配角色 ，内部调用方法
// 0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96,0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
    function _grantRole(bytes32 _role,address _account) internal{
     _roles[_role][_account] = true;
     emit GrantRole(_role,_account);
    }
// 为账号分配角色 ，外部调用方法，并且管理员才可以操作
    function grantRole(bytes32 _role,address _account) external  onlyRole(ADMIN_ROLE) {
        _grantRole(_role, _account);
    }
// 取消账号角色
// 0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96,0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
   function revokeRole(bytes32 _role,address _account) external onlyRole(ADMIN_ROLE){
      _roles[_role][_account] = false;
      emit RevokeRole(_role, _account);
    }




}
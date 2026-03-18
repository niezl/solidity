// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./IERC20.sol";

contract DiscreteStakingRewards {
    IERC20 public immutable stakingToken;
    IERC20 public immutable rewardToken;
    mapping(address => uint256) public balanceOf;
    uint256 public totalSupply;

    uint private constant MULTIPIER = 1E18;
    // 当前奖励指数
    uint private rewardIndex;

    // 保存账号上一次的奖励指数
    mapping(address => uint256) private rewardIndexOf;
    // 保存账户目前赚到的总奖励数
    mapping(address => uint256) private earned;
    // 初始化量质押代币合奖励代币
    constructor(IERC20 _taking, IERC20 _reward) {
        stakingToken = _taking;
        rewardToken = _reward;
    }
    // 向合约增加奖励代币，并更新当前奖励指数
    function updateRewardIndex(uint256 reward) public {
        // 向合约奖励代币
        rewardToken.transferFrom(msg.sender, address(this), reward);
        // 计算当前奖励指数
        rewardIndex = rewardIndex + (reward * 1e18) / totalSupply;
    }
    // 计算账号当前的奖励额度
    function _calculateRewards(address account) private view returns (uint256) {
        uint staking_balanc = balanceOf[account]; //账号质押的代币数量
        // 计算账号当前的奖励额度,质押数量乘以当前奖励指数减去上一次的奖励指数.
        uint256 rewards = staking_balanc *
            (rewardIndex - rewardIndexOf[account]);
        return rewards;
    }
    // 计算账号总奖励数量
    function calculateRewardEarned(
        address account
    ) external view returns (uint256) {
        return earned[account] + _calculateRewards(account);
    }

    // 更新当前用户总奖励数量和奖励指数
    function _updateRewards(address account) private {
        earned[account] += _calculateRewards(account);
        rewardIndexOf[account] = rewardIndex;
    }
    // 质押代币

    function stake(uint256 amount) external {
        _updateRewards(msg.sender);
        // 记录当前用户质押代币数量
        balanceOf[msg.sender] += amount;
        // 记录合约质押代表总数量
        totalSupply += amount;
        // 将代币发送给合约
        stakingToken.transferFrom(msg.sender, address(this), amount);
    }

    // 退回质押
    function unstake(uint256 amount) external {
        _updateRewards(msg.sender);
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        //   质押代币返回给调用者
        stakingToken.transfer(msg.sender, amount);
    }

    // 提取(索要)奖励

    function claim() external returns (uint) {
        _updateRewards(msg.sender);
        uint reward = earned[msg.sender];

        if (reward > 0) {
            earned[msg.sender] = 0;
            rewardToken.transfer(msg.sender, reward);
        }

        return reward;
    }
}

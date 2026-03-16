// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

interface IERC721 {
    function transferFrom(address _from,address _to,uint256 tokenId) external ;
    
}

contract DutchAuction{

    // nft合约
    IERC721 public immutable nft;
    // tokenId
    uint256 public immutable tokenId;
    // 卖家
    address public immutable seller;
    // 拍卖时长
    uint256 public constant auctionDuration = 7 days;
    // 起拍价格
    uint256 public immutable startPrice;
    // 结束价格
    uint256 public endPrice;
    // 起拍时间
    uint256 public immutable startTime;
    // 结束时间
    uint256 public immutable endTime;
    // 价格折扣率
    uint public immutable discountRate;




    constructor(uint _discountRate,uint _startPrice,uint _tokenId, IERC721 _nft ){
        seller=payable(msg.sender); //设置卖家；
        tokenId = _tokenId; //设置tokenId；
        startPrice = _startPrice; //设置起拍价格；
        startTime = block.timestamp; //设置起拍时间；
        endTime = startTime + auctionDuration; //设置结束时间;
        // 其实价格 必须小于 折扣率乘以时间间隔
        require(_startPrice > _discountRate*_discountRate, "_startPrice < auctionDuration");
        discountRate = _discountRate; //设置折扣率；
        nft = _nft; //设置NFT合约；
    }


    // 竞拍函数
     function buy() external  payable {
         uint256 currentPrice=currentPrice();
        // 判断拍卖时间是否有效
        require(block.timestamp < endTime,"block.timestamp >= endTime");
        // 判断竞拍价格是否大于当前价格,小于当前价格抛出异常
        require(msg.value >= currentPrice,"msg.value < currentPrice");
        // nfp转发token,从卖家转给买家
        nft.transferFrom(seller, msg.sender, tokenId);
        // 计算剩余资金
        uint refund=msg.value-currentPrice;
        // 如果有剩余资金，就返回给买家(调用者)
        if(refund>0){
           payable(msg.sender).transfer(refund);
        }
        

    
     }

    // 计算当前价格,随着时间的增加，价格逐渐减少。

    function currentPrice() public view returns (uint256) {

        return startPrice - discountRate*auctionDuration;
        
    }


    

}
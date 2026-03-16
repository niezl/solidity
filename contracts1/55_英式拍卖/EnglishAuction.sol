// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface  IERC721 {
    function transferFrom(address _from,address _to,uint256 tokenId) external;
    
}
contract EnglishAuction{
    // nft 合约
    IERC721 public  immutable nft;
    // token
    uint256 public immutable tokenId;
    // 卖家
    address payable  public immutable seller;

    // 结束时间
    uint32 public  endTime;
    // 拍卖开始标记
    bool public started;
    // 拍卖结束标记
    bool public  ended;

   
    // 最高价格 刚开始为起拍价格
    uint256 public highestBid;
    // 最高出价人
    address payable public highestBidder;

    // 记录竞拍者和出的价格，后面没拍到的需要用户资金提现。
    mapping(address=>uint256) public bids;
    //  开始竞拍
    event Started();
    // 竞拍时间
    event Bid(address indexed sender,uint amount);
    // 竞拍者提现事件
    event WithDraw(address indexed bider,uint amount);
    // 竞拍最终结果事件
    event End(address indexed highestBidder,uint highestBid);

    constructor(IERC721 _nft,uint256 _tokenId,uint256 _startPrice)
    {
             nft=_nft;
             tokenId=_tokenId;
             highestBid=_startPrice;
             seller=payable(msg.sender);

    }

   function start()  external  {
    // 判断不是seller抛出异常
    require(msg.sender==seller,"not seller");
    // 判断活动已经开始抛出异常
    require(!started,"already start");
    // 标记活动已经开始
    started=true;
    // 获取结束时间
    endTime=uint32(block.timestamp+30);
    // 发送NFT给合约
    nft.transferFrom(seller,address(this),tokenId);
    // 发送竞拍开始事件
    emit Started();
    // // 发送NFT转账事件
    // emit Transfer(seller,address(this),tokenId);
   }

     // 买家竞拍
    function bid() public payable{
        // 如果活动已结束抛出异常
        require(!ended,"already finished");
        //当前时间大于活动结束时间返回异常
        require(block.timestamp < endTime,"time is up");
        // 小于最高竞价返回异常
        require(msg.value>highestBid,"value < highest bid");
        // 有竞拍者是记录竞拍者和给出的最高价格
       
        if(highestBidder!=address(0)){
            bids[highestBidder]+=highestBid; //每次给出的价格累加
        }

        highestBid=msg.value;
        highestBidder=payable(msg.sender);
        emit Bid(msg.sender,msg.value);
    }
    
    // 买家提现

    function withdraw() public{
        // 如果活动还没结束返回异常
        require(ended,"not finished");
        // 如果没有竞拍者返回异常
        require(bids[msg.sender]>0,"no bid");
        // 给买家转账退回竞拍资金
        payable(msg.sender).transfer(bids[msg.sender]);
        emit WithDraw(msg.sender,bids[msg.sender]);
    }


    // 结束竞拍

    function end() external {
        // 活动没有开始返回异常
        require(started,"not started");
        // 如果活动还没结束返回异常
        require(!ended,"already finished"); 
        // 如果活动没有超过活动结束时间返回异常
        require(block.timestamp > endTime,"not finished");   
        ended = true;
        if(highestBidder!=address(0)){
            // 向出价最高的人转发nft
            nft.transferFrom(address(this), highestBidder, tokenId);
            // 向卖家转发eth
            payable(seller).transfer(highestBid);
        }else{
            // 如果没有竞拍着，会把nft转个seller卖家
            nft.transferFrom(address(this), seller, tokenId); 
        }


        emit End(highestBidder,highestBid);

    }










    



}

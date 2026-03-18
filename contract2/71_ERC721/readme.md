1. 介绍
• 什么是ERC721合约(NFTs)
• ERC721的重要性和应⽤场景
2. 声明接⼝
• IERC165接⼝
• IERC721接⼝及其继承关系
• IERC721Receiver接⼝及其函数
3. ERC721合约的实现
• 合约的基本结构
• 事件声明:Transfer, Approval, ApprovalForAll
• 状态变量声明：
◦ 存储每个NFT的拥有者: mapping(uint => address) _owner
◦ 存储每个地址拥有的NFT数量: mapping(address => uint) _balance
◦ 存储NFT的批准地址: mapping(uint => address) _approvals
◦ 存储地址对所有NFT的批准: mapping(address => mapping(address => bool))
_isApprovedForAll
4. 函数实现
• supportsInterface 函数
• balanceOf 函数
• ownerOf 函数
• setApprovalForAll 函数
• approve 函数
• getApproved 函数
• 内部函数： _isApprovedOrOwner
• transferFrom 函数
• safeTransferFrom 函数（包括带数据参数的版本）
5. 辅助功能
• 铸造函数(mint)
• 销毁函数(burn)
Create2⼯具可以轻松计算即将部署的合约地址。
⼆、使⽤新关键字部署合约
1. 基本步骤
◦ 使⽤ new 关键字部署合约。
◦ ⽰例：部署 deployWithCreate2 合约，构造函数接收⼀个 owner 参数。
2. ⽰例代码
solidity
复制代码
deployWithCreate2 _contract = new deployWithCreate2(msg.sender);
emit Deploy(address(_contract));
1
2
3
4
三、使⽤Create2部署合约
1. 代码修改：
◦ 添加盐值(salt)参数。
◦ 将盐值转换为 bytes32 类型。
2. ⽰例代码
solidity
复制代码
bytes32 salt = bytes32(uint256(777));
1
2
3
四、预计算合约地址
1. 步骤
2.
◦ 计算合约的字节码(bytecode)。
◦ 计算合约 字节码（ y )
◦ 使⽤Keccak256哈希函数计算合约地址。
3. ⽰例代码
4. :
solidity
复制代码
bytes32 bytecodeHash = keccak256(abi.encodePacked(bytecode, salt));
五、部署合约并⽐较地址
1. 预计算地址
2. :
◦ 使⽤ getAddress 函数预计算合约地址。
◦ ⽰例：传⼊字节码和盐值，返回地址。
3. 部署合约
4. :
◦ 使⽤ create2 部署合约。
◦ ⽐较预计算地址和实际部署地址是否相同。
5. ⽰例代码
6. :
solidity
复制代码
address precomputedAddress = getAddress(bytecode, salt);
deployWithCreate2 _contract = new deployWithCreate2{salt: salt}(msg.sender);
emit Deploy(address(_contract));
六、实际操作演⽰
1. 编译合约。
2. 预计算合约地址：
◦ 获取合约字节码。
◦ 调⽤ getAddress 函数计算地址。
3. 部署合约：
◦ 使⽤相同的盐值(salt)部署合约。
◦ ⽐较预计算的地址和实际地址。
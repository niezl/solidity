1. 课程简介
• 介绍Keccak256哈希函数在Solidity中的⼴泛应⽤
• Keccak256的常⻅⽤例:签名、⽣成唯⼀ID、防⽌抢跑(Commit-Reveal机制)
2. Keccak256 哈希函数的使⽤
• 创建⼀个名为 hash 的函数
• Keccak256函数可以接收各种类型的输⼊(字符串、整数、地址）
• ⽰例函数:接受字符串、整数和地址作为参数,返回bytes32类型的哈希值
3. 参数编码
• Keccak256需要字节类型的输⼊,因此需要将参数编码为字节
• 使⽤ abi.encode 和 abi.encodePacked 进⾏编码
• abi.encode 和 abi.encodePacked 的区别： abi.encode 保留更多信息，
abi.encodePacked 压缩数据
4. 编码⽰例
• 创建两个函数 encode 和 encodePacked ，分别使⽤ abi.encode 和
abi.encodePacked 进⾏编码
• ⽰例展⽰不同编码⽅法的输出差异
5. 避免哈希冲突
• 介绍哈希冲突：不同的输⼊得到相同的哈希值
• 动态数据类型（如字符串）并排使⽤ abi.encodePacked 时可能会导致哈希冲突
• ⽰例展⽰如何通过改变输⼊顺序或使⽤ abi.encode 来避免哈希冲突
6. 实例演⽰：避免哈希冲突
• 创建函数 collision ，展⽰哈希冲突的例⼦
• 通过添加⼀个额外的整数参数，改变输⼊顺序，避免哈希冲突
7. 课程总结
• 回顾Keccak256的应⽤、编码⽅法及避免哈希冲突的技巧
• 强调理解和正确使⽤Keccak256哈希函数的重要性
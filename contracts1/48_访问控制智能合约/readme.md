1. 合约概述
• 介绍访问控制的概念
• 说明将要构建的合约功能
2. 数据结构
• 使⽤
1 mapping
• 存储账⼾⻆⾊
◦ mapping(bytes32 => mapping(address => bool)) ⽤于⻆⾊与账⼾的映射
3. 定义⻆⾊
• 定义
1 admin
• 和
1 user
• ⻆⾊
◦ 使⽤ bytes32 存储⻆⾊
◦ 通过哈希计算⻆⾊名称（ keccak256 )
4. 内部函数：分配⻆⾊
• 创建内部函数
1 _grantRole
• 接收⻆⾊和账⼾作为参数
• 更新 roles 映射
• 触发 RoleGranted 事件
5. 外部函数：分配⻆⾊
• 创建外部函数
1 grantRole
• 调⽤内部函数 _grantRole
• 添加 onlyRole 修饰符，确保只有 admin ⻆⾊能调⽤
6. 合约构造函数
• 在构造函数中为合约部署者分配 admin ⻆⾊
7. 撤销⻆⾊
• 创建内部函数
1 _revokeRole
• 接收⻆⾊和账⼾作为参数
• 更新 roles 映射，将⻆⾊设为 false
• 触发 RoleRevoked 事件
• 创建外部函数
1 revokeRole
• 调⽤内部函数 _revokeRole
• 添加 onlyRole 修饰符，确保只有 admin ⻆⾊能调⽤
8. 事件定义
• 定义
1 RoleGranted
• 和
1 RoleRevoked
• 事件
◦ 事件包含⻆⾊和账⼾信息
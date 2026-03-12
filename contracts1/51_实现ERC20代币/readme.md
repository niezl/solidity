1. ERC20代币简介
◦ 总供应量
◦ 余额查询
◦ 转移功能
◦ 授权与查询
◦ 代币转移与事件
2. 状态变量定义
◦ totalSupply : 总供应量
◦ balances : ⽤⼾余额映射
◦ allowances : 授权映射
◦ name , symbol , decimals : 代币元数据
3. 基本功能实现
◦ 转移函数 transfer
◦ 授权函数 approve
◦ 授权查询函数 allowance
◦ 授权转移函数 transferFrom
4. 代币增发与销毁
◦ 增发函数 mint
◦ 销毁函数 burn
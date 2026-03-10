1. 什么是Delegatecall
◦ delegatecall在另⼀个合约的上下⽂中执⾏代码
◦ ⽰例分析:合约A调⽤合约B,B调⽤合约C
2. 常规调⽤与Delegatecall的区别
◦ 常规调⽤中,合约C中的message.sender和message.value
◦ Delegatecall中的上下⽂保留机制
3. Delegatecall的实际应⽤
◦ 如何使⽤delegatecall调⽤函数
◦ ABI编码函数及其参数
◦ ABI编码的两种⽅法:使⽤字符串和使⽤选择器
4. Delegatecall的代码实现
◦ 部署合约并调⽤setVars函数
◦ 验证state variable的更新情况
◦ 更新逻辑的⽅式:通过重新部署testDelegateCall合约
5. Delegatecall的注意事项
◦ 状态变量的顺序和布局的重要性
◦ 如何避免由于状态变量顺序变化引起的异常⾏为
1. 课程⽬标
• 学习并构建⼀个简单的Solidity应⽤，了解Solidity的基本使⽤。
• 通过实际操作，掌握智能合约的编写、编译及部署流程。
2. 开发环境与⼯具设置
• 设置Solidity编译器版本为0.8.7或更⾼。
pragma solidity ^0.8.7;
• 添加许可证信息，以避免编译器警告。
3. 智能合约结构
• 定义合约
1 Counter
• 使⽤Solidity关键字
1 contract
contract Counter {}
• 声明⼀个公共状态变量 count ，类型为 uint （⽆符号整数），⽤于存储当前计数。
4. 功能实现
• 增加计数 ( inc 函数)
◦ 定义⼀个外部函数 inc ，不接受输⼊参数，⽤于增加计数。
◦ 该函数修改状态变量 count ，因此是⼀个写函数。
function inc() external {
count += 1;
}
• 减少计数 ( dec 函数)
◦ 定义⼀个外部函数 dec ，不接受输⼊参数，⽤于减少计数。
◦ 该函数同样修改状态变量 count ，为写函数。
function dec() external {
count -= 1;
}
5. 编译与部署
• 使⽤Solidity编译器编译智能合约。
• 通过以太坊客⼾端(如Remix IDE)部署合约。
6. 合约交互
• 通过调⽤ inc 和 dec 函数，分别实现计数的增加与减少。
• 使⽤ count 函数获取当前计数值。
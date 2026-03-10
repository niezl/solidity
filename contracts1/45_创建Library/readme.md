1. Library的基本概念
• 什么是Library
• Library的作⽤：代码重⽤和数据类型增强
2. 创建Library
• 使⽤ library 关键字创建Library
• Library中的函数定义
• Library的限制：不能声明状态变量
3. ⽰例：⽐较两个⽆符号整数
• 编写⼀个⽐较两个⽆符号整数并返回较⼤值的Library
◦ 创建名为 Math 的Library
◦ 定义 max 函数：接受两个 uint 类型参数，返回较⼤值
◦ 使⽤三元运算符简化 if-else 语句
4. 在合约中使⽤Library
• 在测试合约中使⽤
1 Math.max
• 函数
◦ 在合约中调⽤Library函数
◦ 内部函数与公共函数的区别
5. 增强数据类型：数组操作
• 使⽤Library增强数据类型
◦ 创建名为 ArrayLib 的Library
◦ 定义 find 函数：在数组中查找指定元素并返回索引
◦ 使⽤ storage 关键词处理状态变量
6. ⽰例：数组索引查找
• 编写查找数组中元素的索引函数
◦ 在 ArrayLib 中定义 find 函数
◦ 使⽤ for 循环遍历数组查找元素
◦ 元素不存在时抛出异常
7. 在合约中使⽤增强的数组操作
• 使⽤
1 ArrayLib.find
• 函数查找数组元素
◦ 在合约中调⽤ ArrayLib.find 函数
◦ 使⽤ using 声明简化函数调⽤
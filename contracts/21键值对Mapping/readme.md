1. 映射基础
• 定义映射:映射是类似Python中字典的数据结构,⽤于⾼效查找。
• 声明映射：使⽤ mapping 关键字，后跟键类型与值类型，例如 mapping(address =>
uint) balances; 。
2. 简单与嵌套映射
• 简单映射实例：创建⼀个存储地址余额的映射。
• 嵌套映射实例：创建⼀个表达地址间友谊关系的嵌套映射，例如 mapping(address =>
mapping(address => boolean)) isFriend; 。
3. 操作映射元素
• 设置元素：通过指定键和赋值来存储信息，如 balances[msg.sender] = 123; 。
• 获取元素：通过键访问存储的值，如 uint val = balances[msg.sender]; 。
• 删除元素：使⽤ delete 关键字清除键对应的值，如 delete balances[msg.sender]; 。
4. 映射的⽤途与效率
• 效率对⽐：映射通过⼀次查找完成任务，⽽数组需要多次迭代查找。
• 默认值：未设置的键将返回类型的默认值，如 uint 的默认值为0。
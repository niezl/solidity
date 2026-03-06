1. Structs基础
◦ Structs允许将数据分组。
◦ 例如:创建⼀个包含模型、年份和所有者的Car struct。
2. 数据类型与声明
◦ 模型（字符串类型），年份（整数类型），所有者（地址类型）。
◦ Structs可以作为状态变量声明,例如: car public 。
◦ ⽀持数组和映射结构，例如：数组 car[] public cars ，映射 mapping(address =>car[]) public carsByOwner 。
3. 初始化Structs
◦ 第⼀种⽅式：直接传递参数，例如： car("Toyota", 1990, msg.sender) 。
◦ 第⼆种⽅式：使⽤键值对，顺序可以不同，例如： car({model: "Lamborghini",year: 1980, owner: msg.sender}) 。
◦ 第三种⽅式：使⽤默认值，然后单独设置属性，例如： tesla.model = "Tesla" 。
4. 状态变量的使⽤
◦ 初始化后的structs可以存储到状态变量数组中。
◦ 直接在⼀⾏代码中创建并推送到数组，例如： cars.push(car("Ferrari", 2020,msg.sender)) 。
5. 访问和修改Structs
◦ 从状态变量读取数据,例如获取cars数组中的第⼀个car _car = cars[0] 。
◦ 修改存储在智能合约中的数据,需要使⽤storage关键字,例如: _car.year = 1999 。
6. 删除和重置
◦ 删除或重置struct的字段到默认值,例如： delete _car.owner 。
◦ 删除整个struct,重置所有字段,例如: delete cars[1] 。
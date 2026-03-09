1. 数据位置:storage、memory和calldata
◦ storage:状态变量，可修改
◦ memory:临时存储,不保存在区块链上，可读写
◦ calldata:函数输⼊，不可修改，可⽤于节省 gas
2. 通过⽰例理解数据位置的应⽤：
◦ 使⽤struct从mapping中读取数据时,需指定数据位置
◦ 使⽤storage修改数据,使⽤memory读取数据
3. 函数参数和返回值的数据位置声明：
◦ 使⽤memory和calldata声明函数输⼊
◦ 使⽤memory声明函数返回值
4. 利⽤calldata节省 gas:
◦ 当将参数传递给另⼀个函数时,使⽤calldata可以避免数据复制,节省 gas


string数组,结构体  会用到  storage、memory和calldata
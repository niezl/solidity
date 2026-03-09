1. 三种发送ETH的⽅法:
◦ transfer
▪ 发送2300 gas。
▪ 如果发送失败，整个函数会失败。
◦ send
▪ 发送2300 gas。
▪ 返回⼀个布尔值，指⽰发送是否成功。
◦ call
▪ 转发所有gas。
▪ 返回两个值：⼀个布尔值指⽰调⽤是否成功，⼀个数据值。
2. 合约接收ETH的⽅法:
◦ 在构造函数中使⽤ payable 关键词。
◦ 使⽤ payable 的fallback函数。
◦ 使⽤ receive 函数,专⻔⽤于接收ETH。
3. 代码⽰例:
◦ 使⽤ transfer 发送ETH。
◦ 使⽤ send 发送ETH。
◦ 使⽤ call 发送ETH。
4. 注意事项:
◦ transfer 和 send 仅发送2300 gas。
◦ call 转发所有gas,是推荐使⽤的⽅法。
设置⽂本函数(set)
▪ 输⼊参数为字符串,使⽤calldata数据位置以节省gas。
▪ 避免命名冲突，输⼊变量命名为 _text 。
▪ 该函数定义为external,只能从合约外部调⽤。
◦ 获取⽂本函数(get)
▪ 由于 text 已定义为公开变量,Solidity⾃动创建getter函数,但为练习将⼿动创建。
▪ 返回值为字符串,使⽤memory数据位置。
▪ 该函数同样定义为external。
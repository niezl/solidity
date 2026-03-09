1. 简介
• Fallback函数的定义
• Fallback函数的主要⽤途
2. Fallback函数的声明
• 定义Fallback函数: fallback external
• 使Fallback函数可接收Ether: fallback external payable
3. Fallback函数的变体
• Receive函数的定义:receive external payable
• Fallback和Receive的区别
4. Fallback和Receive函数的执⾏条件
• Fallback函数的执⾏条件
◦ 当调⽤的函数不存在且 message.data 不为空时执⾏
• Receive函数的执⾏条件
◦ 当 message.data 为空时执⾏
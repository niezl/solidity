// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ToDoList{
//任务模型
struct ToDo{string text;bool completed;}
//r任务列表
ToDo[] public  todolist;

//创建任务保存在任务列表中
function createToDo(string calldata _text) external  {
  todolist.push(ToDo(_text,false));

}

//更新任务信息

function updateText(string calldata _text,uint256 index) external{
    todolist[index].text=_text;

}


//获取返回任务信息
function get(uint256 index) external view returns(string memory,bool){

    ToDo memory todo=todolist[index];

    return (todo.text,todo.completed);
}

// 任务开关

function toggleCompleted(uint256 index) external{
    todolist[index].completed=!todolist[index].completed;

}






}
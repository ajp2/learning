import React from "react";
import TodoListItem from "../todo_list/todo_list_item";

const TodoList = ({ todos, receiveTodos }) => (
  <ul>
    {todos.map((todo, idx) => <TodoListItem key={idx} todo={todo} />)}
  </ul>
);

export default TodoList;